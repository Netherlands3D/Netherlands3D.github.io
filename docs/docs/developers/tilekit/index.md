# Tilekit

## Visie

Tilekit is een raamwerk om geospatiale datasets te visualiseren middels een geheugen-geoptimaliseerde methode om grote 
gebieden te kunnen visualiseren op een manier die web-geschikt is.

---

## Introductie

Digitale twin omgevingen brengen een brede variatie aan ruimtelijke datasets samen: van fijnmazige tegeldiensten tot
uitgebreide, ongetegelde modellen, van rasterlagen tot 3D-geometrie en thematische vectorinformatie. Elk van deze
bronnen heeft een eigen structuur, formaat en dynamiek, maar in de applicatie moeten ze samenkomen in één integrale
visualisatie.

Tilekit is ontwikkeld om dit proces te vereenvoudigen. Het biedt een generiek en uitbreidbaar fundament waarmee elke
dataset—ongeacht of deze getegeld, ongetegeld, statisch of dynamisch is—op een consistente manier kan worden
geïnterpreteerd, beheerd en weergegeven. In plaats van dat iedere bron speciale behandeling nodig heeft, zorgt Tilekit
voor één uniforme levenscyclus waarmee data efficiënt kan worden gestreamd en gevisualiseerd.

Deze aanpak maakt het mogelijk om meerdere grote datasets tegelijk te gebruiken binnen Unity, inclusief
WebGL-toepassingen waar zorgvuldig omgaan met geheugen en bandbreedte belangrijk is. Door datastructuren te
optimaliseren, onderdelen strikt te scheiden en de tile-levenscyclus centraal te stellen, biedt Tilekit een solide basis
voor schaalbare en performante visualisatie.

Deze technische specificatie beschrijft hoe Tilekit dit bereikt: de ontwerpkeuzes, datastructuren, extensiepunten en
service-typen die het systeem vormen. Het document helpt ontwikkelaars begrijpen hoe verschillende bronnen in één
samenhangend geheel kunnen worden opgenomen, en hoe nieuwe datasettypes eenvoudig kunnen worden geïntegreerd in een
groeiend landschap van ruimtelijke informatie.

---

## Doelen

Tilekit heeft ten doel om een raamwerk te bieden voor het visualiseren van alle geospatiale content, deze flexibiliteit
vereist een ontwerp waar bij de volgende doelen gesteld zijn:

- **Raamwerk** om, getegeld, geospatiale data in te laden en visualiseren.
- **Geheugen-geoptimaliseerd** om op het web grote gebieden te kunnen tonen.
- **Makkelijk om onderdelen toe te voegen** zonder het hele systeem aan te hoeven te passen.
- **Ondersteunt publieke en afgeschermde bronnen** middels authenticatie.
- **Live streamen (remote datasets) of importeren (lokale datasets)** van data moet mogelijk zijn 

---

## Filosofie

Tilekit is gebouwd rondom het principe dat als een legoset een tegelsysteem in elkaar kan worden geprikt. Daarbij kunnen
onderdelen vervangen worden als voortschrijdend inzicht dat vereist, of juist toegevoegd als er nieuwe databronnen
geimplementeerd worden.

## Duik dieper in de materie

- [Architectuur in vogelvlucht](architectuur-in-vogelvlucht.md)
- [Memory management](memory-management.md)
- [Tijdsafhandeling](tijdsafhandeling.md)
- [Data opslag](data-opslag.md)
- [Ophalen van data](ophalen-van-data.md)
- [Tegelsysteem](tegelsysteem.md)
- [Features](features.md)
- [Appendix A. Casussen](appendix-a-casussen.md)
- [Appendix B. Bronvermeldingen](appendix-b-bronvermeldingen.md)
- [Appendix C. Begrippen](appendix-c-begrippen.md)

## Nog uit te zoeken / beschrijven

- Meer in-diepte hoe de architectuur werkt
- CRS afhandeling
- Tiling Schemes en hoe die werken
- Debugging tools
- Features
- Styling
- Memory Management Handreiking
- Postprocessing van tegels verder toelichten, mogelijk met clipping en masking als voorbeeld
- Beschrijving hoe hoogte wisselingen te kunnen doen (FAQ?)
