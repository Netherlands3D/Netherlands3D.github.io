# Architectuur in Vogelvlucht

Tilekit is opgebouwd vanuit één overkoepelend principe: elke ruimtelijke dataset—ongeacht formaat, protocol of
domein—kan worden teruggebracht tot dezelfde driedelige levenscyclus van **koud → warm → hot**. Deze cyclus bepaalt hoe
data wordt opgeslagen, voorbereid en uiteindelijk gematerialiseerd voor visualisatie.

De architectuur maakt hierbij een strikt onderscheid tussen **protocol-onafhankelijke visualisatieconcepten** (
Archetypes) en **protocol-afhankelijke datastromen** (DataSets). Deze scheiding vormt de kern van Tilekits
uitbreidbaarheid en schaalbaarheid.

---

## 1. Dataopslag: Cold, Warm en Hot

Tilekit hanteert drie niveaus van materialisatie:

- **Cold Storage** is een _gematerialiseerde view_ van de brondataset binnen een **interessegebied**. Dit gebied is
  groter dan de cameraview, maar omvat niet noodzakelijk de volledige dataset. In deze laag staan alleen de minimale,
  gestandaardiseerde gegevens (bounding volumes, resolutiemaatstaven, metadata, verwijzingen naar content) in een
  SoA-structuur.
- **Warm Tiles** bevatten de dataset-specifieke resources die nodig zijn om tiles snel zichtbaar te maken (zoals
  textures, meshes, polygonbuffers of feature-attributen).
- **Hot Tiles** zijn de daadwerkelijk actieve representaties in de Unity-scène.

Deze scheiding zorgt ervoor dat Tilekit nauwkeurig kan bepalen welke data moet worden voorbereid of gevisualiseerd,
zonder onnodige belasting van geheugen of CPU.

---

## 2. Archetypes: Protocol-onafhankelijke visualisatiefamilies

**Archetypes vormen de basis van Tilekits visualisatiearchitectuur.**

Een Archetype beschrijft _hoe_ een bepaald type ruimtelijke informatie moet worden behandeld en gevisualiseerd, los van
waar die informatie vandaan komt. Voorbeelden:

- **RasterArchetype**: werkt met beelden en texturen, ongeacht of ze uit WMS, WMTS, PNG-bestanden of iets anders komen.
- **VectorArchetype**: tekent features als polygonen of lijnen, los van het protocol waarmee deze features zijn
  verkregen.
- **MeshArchetype**: gaat om met 3D-geometrie, onafhankelijk van het bestandsformaat of domein.
- Eventuele **nieuwe archetypes** (bijv. voor voxels, point cloud tiles, multi-temporal lagen) kunnen eenvoudig worden
  toegevoegd.

Kenmerkend is dat een Archetype:

- het fundament biedt voor warm en hot tiles,
- weet hoe data moet worden voorbereid en gerenderd,
- maar niets weet over protocols, endpoints of bestandsindelingen.

Archetypes zijn dus _universele visualisatiebouwblokken_.

---

## 3. DataSets: Protocol-afhankelijke bronnen

**DataSets zijn de onderdelen die de daadwerkelijke communicatie met de bron verzorgen.**

Waar Archetypes bepalen _hoe iets getekend wordt_, bepaalt een DataSet:

- _hoe_ de data moet worden opgehaald
- _welke_ protocollen worden gebruikt
- _welke_ parameters gelden voor tilebeschikbaarheid, queries of filtering
- _hoe_ de bron wordt vertaald naar de gestandaardiseerde tile-structuur van het Archetype

!!! example
    Voorbeelden:

    - Een **WMS DataSet** spreekt het WMS-protocol, bouwt requests op, doet de netwerkcommunicatie en ontvangt de
      afbeeldingen. De uiteindelijke verwerking en visualisatie daarvan gebeurt in het **RasterArchetype**.
    - Een **3D Tiles DataSet** decodeert tilesets en b3dm/PNTS-content, maar het **MeshArchetype** bepaalt hoe die
      geometrie als warm/hot tile verschijnt.
    - Een **GeoJSON DataSet** haalt features op en vertaalt deze naar cold/warm data, maar het **VectorArchetype** bepaalt
      hoe deze features worden getekend.

DataSets verzorgen dus de _glue-code_ tussen Tilekit en de buitenwereld, terwijl Archetypes de consistente
visualisatielaag vormen.

---

## 4. Besturing van de levenscyclus

Elke DataSet beheert de lifecycle binnen zijn interessegebied:

- bepalen welk deel van de bron - en hoe - moet worden gematerialiseerd naar Cold Storage,
- bepalen welke tiles warm moeten worden,
- bepalen welke tiles hot moeten worden,
- bepalen wanneer resources moeten worden opgeruimd.

De DataSet gebruikt dus het fundament van het Archetype om de lifecycle in goede banen te leiden.

---

## 5. Extensiepunten in de architectuur

De architectuur is modulair opgebouwd en biedt uitbreidingsmogelijkheden op drie niveaus:

1. **Nieuwe Archetypes** → nieuwe visualisatiefamilies
2. **Nieuwe DataSets** → nieuwe protocollen en bronnen
3. **Nieuwe content loaders** → nieuwe bestands- of streamformaten

Deze scheiding voorkomt dat protocolcode zich vermengt met visualisatiecode, en maakt Tilekit geschikt voor zowel
bestaande als toekomstige datastromen.
