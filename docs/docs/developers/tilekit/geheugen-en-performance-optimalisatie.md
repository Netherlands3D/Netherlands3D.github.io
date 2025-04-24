## Geheugen en performance optimalisatie

Netherlands3D is een WebGL applicatie met de bijbehorende beperkingen zoals een maximaal inzetbaar geheugenbereik van 
2GB RAM en dat de applicatie zelf single-threaded is.

De volgende richtlijnen zijn van toepassing om het tegelsysteem optimaal te laten functioneren:

- **Caching**, informatie die infrequent opnieuw ingeladen moet worden moet niet in geheugen blijven, maar gecached 
  worden naar `Application.temporaryCachePath`.
- **Gebruik van unmanaged en value types** ten behoeve van een optimale geheugenlayout en om CPU cache misses te 
  beperken.
- **Jobs/Burst-systeem vermijden**

In de hoofdstukken hieronder staat beschreven waarom deze keuzes gemaakt worden en ook wat de impact is voor de 
ontwikkelaar om rekening mee te houden. 

!!!info "Unity WebGL is niet 100% single-threaded"

    Een veelvoorkomend misverstand is dat Unity WebGL en JavaScript volledig single-threaded zijn. Hoewel beide één 
    main loop (“player loop” of “event loop”) hebben, lopen sommige van de acties die ze starten wel degelijk op aparte 
    threads:

    - **Web Workers**: kun je expliciet in JavaScript aanmaken om reken-intensieve taken parallel uit te voeren, buiten 
      de main loop om.
    
    - **Web Requests**: Unity gebruikt voor UnityWebRequest de JavaScript Fetch-API. Die delegeert netwerk-activiteiten 
      aan de browser, die deze op achtergrond threads afhandelt. Hierdoor kun je meerdere requests tegelijk in 
      behandeling hebben.
    
    Zodra een achtergrond taak (bijvoorbeeld een web request) gereed is, keert de callback terug naar JavaScript en dus 
    weer naar de Unity-player loop. Pas dan wordt het resultaat in de hoofd-loop verwerkt.

    [Meer informatie is hier te lezen.](https://medium.com/@farshad.development/unlocking-multi-threading-in-javascript-with-web-workers-13b6a1366c28)

### Caching

Om in een Unity WebGL-applicatie binnen de strikte geheugen-limieten te blijven, hanteren we een meer-laagse
cache-strategie voor tile-content. Elke tegel­content doorloopt vier mogelijke staten—van “helemaal niet aanwezig” tot
“actief in geheugen”—zodat we alleen de écht benodigde data in RAM houden, en de rest elders opslaan.

!!!todo

    - Cache eviction beschrijven, bijv. bij memory pressure
    - Kan dit ingezet worden voor alle soorten content in het project en niet alleen tiles? Denk aan MTL bestanden
    - Beschrijf verschil tussen remote en local assets; local assets kunnen niet stale worden en hoeven niet naar Warm.
      local assets leven altijd in cold storage, en om dan dat te dupliceren naar warm is zonde.
    - Zouden we middels een strategy een van de niveaus kunnen 'aanpassen'? Bijvoorbeeld cold storage naar 
      memcache/redis laten schrijven als de gebruiker dat heeft? 
    - Moet het mogelijk zijn om per laag een retention policy te kunnen inregelen?

#### Cache-niveaus

_1. Hot_

- **Definitie**: De content is geladen als een Unity-object (bijvoorbeeld een `Texture2D`) en staat in het actieve
  geheugen.
- **Gevolg**: Telt volledig mee voor de WebAssembly-heap (de Unity-Memory.buffer), dus draagt bij aan de limiet die je
  instelt via **WebGL Memory Size**.

_2. Warm_

- **Definitie**: De content is geëxporteerd naar een bestand in `Application.temporaryCachePath` (Emscripten’s MEMFS).
- **Gevolg**: Verdwijnt uit de WebAssembly-heap, maar leeft voort in de JavaScript-heap als TypedArray. Dat betekent dat
  het niet meer onder Unity’s MAX_MEMORY valt, maar wél ruimt opeist van de browser-JS-heap (±4 GB in Chrome 64-bit).

_3. Cold_

- **Definitie**: De content is verplaatst naar IndexedDB, via Emscripten’s IDBFS of eigen JS-interop.
- **Gevolg**: Telt niet mee voor de JS-heap, maar wel voor de browser-schijfruimte-quota (meestal tot ~6 % van de vrije
  schijfruimte). Perfect voor grote bestanden die je langer wilt bewaren.

_4. Stale_

- **Definitie**: De content is niet aanwezig (nooit geladen of expliciet verwijderd/exired).
- **Gevolg**: Bij next-request moet de data weer vanaf de bron (WMS, server, etc.) worden opgehaald.

#### Overgangs-mechanisme

!!!quote

    There are 2 hard problems in computer science: cache invalidation, naming things, and off-by-1 errors.

    -- Leon Bambrick

1. **Initialisatie** → alle tiles starten in **Stale**.
2. **Gebruiker in zicht** → tile laadt, content wordt **Hot** (direct in geheugen).
3. **Uit zicht maar binnenkort weer nodig** → verplaats Hot → Warm (MEMFS).
4. **Lang uit zicht, low-priority** → verplaats Warm → Cold (IndexedDB).
5. **Verwijderd of verlopen** → ruim Cold op → terug naar **Stale**.

Op deze manier blijft alleen wat nú écht nodig is in het dure RAM staan, en gebruik je de goedkopere lagen (MEMFS of IndexedDB) voor de rest.

#### Voorbeeld: WMS-tegels

1. **Stale**: bij opstart zijn alle WMS-tegels ongekend.
2. **Hot**: als een tegel in view komt, vraagt `TileContentLoader` de afbeelding op en slaat deze als `Texture2D` in RAM op.
3. **Warm**: zodra de gebruiker de tegel even niet meer ziet maar mogelijk snel terugkeert, schrijven we de data weg naar `temporaryCachePath`. De tegel zelf blijft verwijzen naar het bestand in MEMFS, maar geeft RAM vrij.
4. **Cold**: bij zeer ver uit zicht of bij geheugendruk plaatsen we de tegeldata in IndexedDB.
5. **Stale**: als de laag wordt verwijderd, of wanneer een cache-expiry is bereikt, wissen we de IndexedDB-versie; de volgende keer valt de tegel weer in **Stale** en moet hij opnieuw worden geladen.

### Data Structuren en Geheugenlayout

In WebGL-applicaties heb je te maken met strikte limieten op zowel CPU-tijd als geheugen (zowel WASM-heap als
JavaScript-heap). Slecht ontworpen datastructuren leiden tot:

- Onvoorspelbare GC-pauzes die zorgen voor framerate-hicks en mindere gebruikerservaring.
- CPU-cache-misses die loops vertragen en de laadtijd van tiles opvoeren.
- Geheugenlekken of overallocaties die tot uitval (out-of-memory) kunnen leiden, vooral op mobiele of low-end devices.

Deze richtlijnen helpen om:

1. Consistente performance te verkrijgen bij verschillende hardware en browsers.
2. Voorspelbare geheugencapaciteit te behouden, binnen de limieten van Unity WebGL en de browser.
3. Debuggen en onderhoud te vereenvoudigen door eenduidige patterns (value types, Native-collecties) toe te passen.

!!!tip "Als het in Unity zijn Jobs systeem werkt, dan is het goed"

    Hoewel we het Unity Jobs systeem niet gebruiken, is het aan te raden om data structuren zo te schrijven dat die
    daarin toe te passen zijn. Unity Jobs is ontworpen met Data-Oriented Design in gedachten en op deze manier weet
    je wanneer je datamodel klopt.

#### Structuurkeuze

**1. Gebruik altijd value types (`struct`)**

- **Waarom**: Inline opslag, geen managed heap–allocaties, geen onvoorspelbare GC-pauzes.
- **Hoe**: Definieer `TileSet`, `TilesInView`, en alle gerelateerde data als `struct`.

**2. Vermijd reference types (`class`, `string`)**

- **Waarom niet**: Leven op managed heap, leiden tot garbage-collectie en fragmentatie.
- **Tekstdata**: Gebruik `NativeText` of `FixedString32Bytes`/`FixedString64Bytes` voor tekst.

**3. Geen class-inheritance voor data**

- **Beperkingen**: `struct` ondersteunt geen inheritance.
- **Alternatief**: Pas **composition** toe:
    - Maak kleinere, uniforme data-`structs` en combineer ze in grotere struct-velden.
    - Voor polymorfische gedrag, gebruik **discriminated unions** (een enum + union-struct).

#### Geheugenbeheer met Unity.Collections

**1. Native-collecties**

- **Gebruik**: `NativeArray<T>`, `NativeList<T>`, `NativeHashMap<K,V>`, `NativeQueue<T>`.
- **Voordeel**: Contigüe, unmanaged geheugenblokken buiten de managed heap.

**2. Lifecycle (“allocatie → gebruik → vrijgave”)**

- **Allocatie**:

  ```csharp
  var buffer = new NativeArray<MyStruct>(count, Allocator.Persistent);
  ```

- **Gebruik**: lees/schrijf data direct.

- **Vrijgave**:

  ```csharp
  buffer.Dispose();
  ```

- **Checklist**:

    - Sluit alle `Allocator.Persistent`-allocaties af met `Dispose`.
    - Controleer op dubbele `Dispose` (risico op ObjectDisposedException).

#### Samenvatting: Do’s & Don’ts

| Do’s                                           | Don’ts                            |
|-------------------------------------------------|-----------------------------------|
| Definieer data als `struct`                     | Gebruik geen `class` voor data    |
| Gebruik `NativeArray<T>` en `NativeList<T>`      | Sla data niet op in managed heap  |
| Breng data contigüe onder                       | Gebruik geen pointer-indexen      |
| Beheer memory expliciet (`Dispose`)              | Verwaarloos geen `Dispose`-calls  |
| Pas composition toe ipv inheritance voor structs | Gebruik geen polymorphe classes   |

### Waarom géén Unity Jobs?

Unity’s Job-systeem is ontworpen om data binnen meerdere threads gelijktijdig te verwerken. Echter, in de context van
WebGL biedt het Jobs-systeem nauwelijks voordelen:

1. **Beperkte WebGL-threading**

    - Browsers ondersteunen WebAssembly threads alleen via experimentele Web Workers + SharedArrayBuffer, wat door veel
      platformen (zoals iOS/Safari) niet of beperkt wordt aangeboden.
    - Unity WebGL builds zijn standaard single-threaded, waardoor alle jobs alsnog op de hoofdthread worden geplant.

2. **Extra complexiteit en overhead**

    - Jobs vereisen opzet rond `JobHandle`, memory fences en (optioneel) Burst-compilatie.
    - Omdat threads niet daadwerkelijk parallel werken in WebGL, ontstaan onnodige synchronisatiekosten en extra
      API-overhead.

3. **Onderhoud en foutgevoeligheid**

    - De complexiteit van Jobs verhoogt de test- en debugging-load.
    - De ontwikkeltijd neemt toe omdat er meer expertise nodig is om dit te bouwen en onderhouden.

In WebGL-projecten voegen Unity Jobs meer overhead en complexiteit toe dan dat ze performance opleveren.
We kiezen er daarom bewust voor om sequentiële loops en native collecties te gebruiken, zonder Job-dispatching.
