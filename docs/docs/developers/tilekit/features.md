## Features

### Wat is een feature?

Een abstractie van reële wereldverschijnselen. Een digitale representatie van een echt bestaande entiteit of een
abstractie van de reële wereld. Voorbeelden van features zijn bijna alles wat in tijd en ruimte geplaatst kan worden,
waaronder bureaus, gebouwen, steden, bomen, bospercelen, ecosystemen, bezorgvoertuigen, sneeuwruimroutes, oliebronnen,
oliepijpleidingen, olielekkage, enzovoort. De termen feature en object worden vaak door elkaar gebruikt.

Bronnen:

- [ISO-19101-1-2014 - Geographic information -- Reference model -- Part 1: Fundamentals](https://www.w3.org/TR/sdw-bp/#bib-iso-19101-1-2014)
- [W3C-SDW#feature](https://www.w3.org/TR/sdw-bp/#dfn-feature)

!!!info

    Een van de beste vertalingen naar het Nederlands is het woord "Kenmerk"; hoewel een exacte vertaling van het woord
    Feature niet in het Nederlands voorkomt. Als gevolg daarvan zal in dit document het woord Feature gebruikt worden.

### Doelen

- Ondersteunt 3D en 2D data
- Gemakkelijk uit te breiden met ondersteuning voor nieuwe GIS formaten
- Vergemakkelijkt implementaties van WFS en [OGC API : Features](https://ogcapi.ogc.org/features) omdat deze formaten
  feature-first zijn en niet tegel-first
- Spatial querying
    - Important: Datasets have features - real or not
    - https://www.youtube.com/watch?v=vxZx_PXo-yo&t=2s
    - Jobs/Burst - een findAll doet een Depth First Search; elke branch in de tree kan in parallel; werkt mogelijk niet
      in WebGL - experiment nodig
    - Promise-based? Dat een search in basis asynchroon is en over frames uitgesmeerd kan worden in WebGL
    - Search in this area - Google Maps zoekt op features in het huidige zoekgebied
    - Querying kan als geheel - maar ook in een tile. Als het een tile is, dan kan een lijst gelooped worden
        - Of kunnen we bij het inlezen van een tile deze onderverdelen middels een grid of quadtree en de features
          spatial onderverdelen zodat we hier ook een Depth First Search kunnen doen?
    - Map/Reduce patroon om te filteren?
        - https://www.youtube.com/watch?v=gX5nD2LeAvQ - ZLinq
- https://portal.ogc.org/files/96288 CQL
- Temporele ondersteuning - als de tijd wijzigt van de applicatie kan de URL beinvloed worden
    - WFS: Queryen op tijdgebaseerde attributen - Zie https://docs.ogc.org/is/17-069r4/17-069r4.html#_identifiers
    - Hele URL, zoals Amsterdam Time Machine
    - https://docs.ogc.org/is/20-057/20-057.html#toc52
- Wat te doen met overlappende features, zoals gebouwen die kort op elkaar zitten? die kunnen dubbel voor gaan komen
  of we moeten bijhouden op welke tegels (meervoud) een feature kan voorkomen. Die moet dan ook pas opgeruimd worden
  zodra alle gerelateerde tegels uit beeld zijn. Maar hoe bepalen we of een feature dubbel is?

