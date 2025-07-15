# Tilekit

## Visie

Tilekit is een raamwerk om geospatiale datasets te visualiseren, inclusief de mogelijkheid om deze data te bevragen.

---

## Synopsis

Een geospatiale dataset is een dataset die getegeld aangeboden wordt -zoals 3D Tiles, Webmapper en WMTS-, of een
verzameling van geospatiale features -zoals WFS, OGC API Features of GeoJSON-. Tilekit is ontworpen om deze datasets
op een getegelde manier te visualiseren.

Dit betekent dat Tilekit uit twee aparte maar nauw verbonden delen bestaat:

- Het opbouwen en bevragen van een of meer verzamelingen van features
- Het efficient opdelen van de geospatiale wereld in een verzameling van tegels die features visualiseren

Afhankelijk van de databron kan de volgorde van de processen variëren, wat leidt tot een soort kip-of-ei-probleem.
Systemen die van nature tegel-georiënteerd zijn – zoals WMTS of 3D Tiles – zullen doorgaans eerst tegels genereren en
tegelijkertijd bepalen welke features aanwezig zijn in die tegels. Het is echter ook mogelijk om te starten met een
verzameling features, waarna een deel ervan wordt geselecteerd om bijbehorende tegels van te maken, zoals het geval is
bij GeoJSON-bestanden of WFS.

!!!tip
    Hoewel je genegen zou zijn om bij raster of 3D Data gebaseerde datasets aan te nemen dat er geen features zijn, is 
    het praktisch om de verbeelding -raster of mesh data- van een tegel als één feature te beschouwen.

---

## Doelen

Tilekit heeft ten doel om een raamwerk te bieden voor het visualiseren van alle geospatiale content, deze flexibiliteit
vereist een ontwerp waar bij de volgende doelen gesteld zijn:

- **Raamwerk** om, getegeld, geospatiale data in te laden en visualiseren.
- **Makkelijk om onderdelen te vervangen** zonder het hele systeem aan te hoeven te passen, 
  zie [Pluggable Architectuur](pluggable-architectuur.md).
- **Asynchroon-first** middels Promises
- **Ondersteunt publieke en afgeschermde bronnen** middels authenticatie.
- **Live linken (remote datasets) of importeren (lokale datasets)** van data moet mogelijk zijn 

---

## Filosofie

Tilekit is gebouwd rondom het principe dat als een legoset een tegelsysteem in elkaar kan worden geprikt. Daarbij kunnen
onderdelen vervangen worden als voortschrijdend inzicht dat vereist, of juist toegevoegd als er nieuwe databronnen
geimplementeerd worden.

## Duik dieper in de materie

- [Pluggable Architectuur](pluggable-architectuur.md)
- [Tegelsysteem](tegelsysteem.md)
- [Features](features.md)
- [Metadata](metadata.md)
- [Ophalen van data](ophalen-van-data.md)
- [Geheugen en performance](geheugen-en-performance-optimalisatie.md)
- [Appendix A. Casussen](appendix-a-casussen.md)
- [Appendix B. Bronvermeldingen](appendix-b-bronvermeldingen.md)
- [Appendix C. Begrippen](appendix-c-begrippen.md)

## Notities en TODO tbv uitwerking

- Postprocessing van tegels verder toelichten, mogelijk met clipping en masking als voorbeeld
- Herzien of laden vanaf zichtpunt wel een goede beslissing is
- Laadvolgorde tegels beter beschrijven
- Beter beschrijven hoe het tegelsysteem een tussenlaag is en dat het 'werk' door monobehaviours gebeurd
- Beschrijving hoe hoogte wisselingen te kunnen doen (FAQ?)
- CRS is nog niet benoemd; dat stuk moet ook nog
