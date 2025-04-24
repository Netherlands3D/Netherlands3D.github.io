## Changes

!!!important
Dit hoofdstuk is nog in ontwikkeling en moet gaan beschrijven hoe changes los staan van de tegels zelf of features,
en ook hoe we het Change subsysteem agnostisch houden van concrete implementaties

Een [Change](#change) is het proces om een tegel toe te voegen of te verwijderen. Elke change gebeurd als _transactie_,
wat betekent dat de change als geheel moet slagen of falen, en dat deze geannuleerd kan worden. Deze handelswijze is
essentieel om bij het [mappen](#643-mapping) om te kunnen gaan met snelle bewegingen in de viewer, waarbij het laden
van tegels onderbroken moet kunnen worden zonder dat er gaten in het vlak vallen

### Prioritering

In ons tegelsysteem willen we ervoor zorgen dat de belangrijkste informatie zo snel mogelijk zichtbaar is. Daarom
gebruiken we een prioriteitssysteem dat bepaalt welke tegels het eerst worden ingeladen. Dit systeem werkt op basis van
twee belangrijke factoren:

1. **Laagprioriteit**: Sommige lagen zijn belangrijker dan anderen. Elke laag heeft een gewicht dat aangeeft hoe
   belangrijk de informatie in die laag is.
2. **Positie op het scherm**: Tegels die dichter bij het midden van het scherm liggen, zijn belangrijker dan tegels die
   verder weg liggen.

#### Hoe werkt het?

- **Gewichten en afstanden**: We kijken naar het gewicht van elke laag en de afstand van elke tegel tot
  het [Midden van het Scherm](#midden-van-het-scherm).
- **Tegels in volgorde inladen**: Als de gewichten van de lagen dicht bij elkaar liggen, laden we de tegels eerst in
  vanaf het midden van het scherm, dan op basis van de laag. Dit betekent dat tegels in het midden altijd het eerst
  worden ingeladen, gevolgd door tegels die verder van het midden af liggen.
- **Hele lagen in volgorde inladen**: Als de gewichten van de lagen ver uit elkaar liggen, laden we eerst alle tegels
  van de hoogste laag in, voordat we doorgaan naar de volgende laag. Dit betekent dat we eerst een complete laag inladen
  voordat we naar de volgende laag gaan.

#### Voorbeeld

Stel je voor dat je naar een kaart kijkt met drie lagen: maaiveld, gebouwen en WMS. De maaiveld en gebouwen liggen dicht
bij elkaar qua gewicht, en de WMS laag niet.

1. Begin in het midden van het scherm.
    1. Laad eerst de maaiveld-tegel in omdat deze de hoogste prioriteit heeft,
    2. Gevolgd door de gebouwen-tegel omdat deze zijn prioriteit dichtbij de vorige ligt
2. Ga naar de volgende tegelpositie vanaf het midden en herhaal stap 1.
3. Zodra alle maaiveld- en gebouwen-tegels zijn ingeladen, begin dan met het inladen van de WMS-tegels, ook vanaf het
   midden van het scherm.
