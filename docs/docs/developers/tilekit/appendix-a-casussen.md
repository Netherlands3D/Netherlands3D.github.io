## Appendix A. Casussen

### A.1. WMS

#### A.1.1. Doel

De casus van het herimplementeren van WMS in het nieuwe tegelsysteem is bedoeld om te demonstreren hoe een vertegeling
op basis van [HLOD](#hlod) kan helpen om nabij de camera gedetailleerde tegels te tonen, en verder weg steeds grotere
onnauwkeurige tegels.

#### A.1.2. Demonstreert

- Inladen Capaciteiten en omzetten naar TileSet definitie
- Impliciete vertegeling van een ongetegelde bron
- Inladen van een externe databron
- Verbeelden van remote tegels met afbeeldingen
- Dynamische aanpassing tegelgrootte en resolutie afhankelijk van afstand camera

#### A.1.3. Requirements

- Middels de Tileset definitie van dit systeem moet
    - binnen de bounding box van een WMS laag een tegelset getoond worden
    - een implicit quadtree gebaseerde vertegeling gedefinieerd kunnen worden
    - Meerdere sublevels mogelijk zijn om kleinere en grotere tegels te tonen afhankelijk van de afstand tot het 
    - [zichtpunt](#zichtpunt).
    - TBC

### A.2. GeoJSON

#### A.2.1. Doel

#### A.2.2. Demonstreert

- Impliciete vertegeling van een ongetegelde bron
- Inladen van een lokale databron
- Inladen van een externe databron

#### A.2.3. Requirements

