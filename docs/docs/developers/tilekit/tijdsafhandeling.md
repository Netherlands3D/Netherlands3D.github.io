# Tijdsafhandeling

Tijd is een volwaardige dimensie in Tilekit. Net als ruimte en resolutie bepaalt tijd wélke tegels of features zichtbaar
mogen zijn, welke vervangen moeten worden, en hoe het systeem tile-lifecycle-beslissingen neemt.

## Tijd als SoA-vriendelijke, numerieke dimensie

Binnen Tilekit wordt tijd uitsluitend gerepresenteerd als een **64-bit Unix-timestamp in milliseconden** (UTC). 
Dit betekent dat elk tijdstip een `long` is met “het aantal milliseconden sinds 1 januari 1970, 00:00 UTC”. Deze
representatie is:

* **Blittable en vast in grootte** — ideaal voor SoA-structuren, NativeArray/NativeList, en low-level CPU-loops.
* **Exact en ordelijk** — vergelijkingen zijn simpele integer-vergelijkingen, zonder floating-point afrondingsfouten.
* **Breed ondersteund** — externe standaarden zoals 3D Tiles en JSON-gebaseerde APIs gebruiken Unix-tijd als
  gemeenschappelijke noemer.

!!!warning

    Tijd is in UTC. Dat betekent dat als een databron geen tijdzone informatie bij zijn datum/tijd notaties heeft,
    dat aangenomen moet worden dat de tijd ook in UTC is, of dat er een tijdzone opgegeven moet kunnen worden bij het
    importeren. Door tijd te normaliseren naar UTC voorkom je problemen als gevolg van wintertijd/zomertijd wisselingen
    of conversies van en naar verschillende tijdzones. Dit betekent wel dat bij het weergeven van tijdsinformatie deze
    tijden geconverteerd moeten worden naar de Europe/Amsterdam tijdzone, of CET cq. CEST.

Door alle tijd in Tilekit terug te brengen tot een enkel numeriek domein, blijven Tilekit-componenten eenvoudig te
combineren zonder conversieproblemen of verlies van precisie.

### Tijd als geldigheidsbereik

Een tegel of feature heeft zelden één enkel tijdstip; meestal kent het een **geldigheidsinterval**. Tilekit gebruikt
daarom een compacte, SoA-geschikte vorm:

```csharp
public struct TimeRange
{
    public long Start; // inclusief
    public long End;   // exclusief
}
```

Deze keuze maakt tijdsselectie eenvoudig:

* Een tegel is zichtbaar indien: `Start <= huidigeTijd && huidigeTijd < End`
* Een tegel overlapt een tijdsvenster indien: `End > vensterStart && Start < vensterEinde`

Deze checks zijn extreem snel en vragen geen enkele conversie tijdens runtime.

## Tijd en externe interfaces

Aan de randen van Tilekit — in API-clients, readers voor WMS/3D Tiles/GeoJSON, of UI-elementen — mag tijd in prettige
vormen bestaan zoals `DateTime`, `DateTimeOffset`, ISO-8601 strings, of server-specifieke formats. Binnenkomende waarden
worden **direct geconverteerd** naar Unix-milliseconden.

## Waarom Tilekit deze aanpak gebruikt

De combinatie van integer-vergelijkingen en expliciete tijdsintervallen biedt:

* **Maximale performance** in tile selection en change planning
* **Minimale geheugenvoetafdruk** per tile
* **Voorspelbaar gedrag** bij overlap, geldigheid en vervanging
