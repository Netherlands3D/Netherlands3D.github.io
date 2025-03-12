# Functionaliteiten
Stel je eigen Netherlands3D.eu samen!  
<br>
Met het submenu `Functionaliteiten` krijgt de gebruiker toegang tot het **aan-/uitzetten van de standaard datalagen en (menu)functionaliteiten** die in de basis versie van Netherlands3d.eu wordt aangeboden.    

---
![Building Blocks](../handleiding/imgs/functionaliteiten.png)
_(Afbeelding) Functionaliteiten - submenu_  
<br> 
Klik in het `selectievakje` om de laag of functionaliteit aan of uit te zetten.   

---

## **Functies**

#### **Terrein (Kadaster)**
Met maaiveld, ofwel het 'oppervlak waarop we lopen' is weergegeven als 3D terrein. 
Voor het tonen van dit terrein is gebruik gemaakt van de 3D Basisvoorziening van het Kadaster. 
Visueel onderscheiden zijn gebouwen, terreinonderdelen (zoals wegen, groenvlakken en water) en bruggen, waarbij de 	gebouwen niet als 3D objecten worden getoond in deze laag. Op enkele onderdelen is een geometrische versimpeling 	toegepast om het maaiveld sneller in de viewer te tonen.
Bron: 3D Basisvoorziening
Datum: 2020, Actualisatie: Jaarlijks

#### **Gebouwen (3DBag)**
Alle objecten op de laag 'Gebouwen' komen uit de 3D BAG, een jaarlijks geactualiseerde dataset van alle gebouwen in 	Nederland. De set is ontwikkeld door de de 3D geoinformatie onderzoeksgroep van de Technische Universiteit Delft. Aan 	het gebruik van de 3D BAG zitten.
Bron: 3D BAG
Datum: 2023, Actualisatie: Jaarlijks

#### **Bomen en bospercelen**  
Deze kaartlaag toont alle individuele bomen en bospercelen van Nederland voor zover ze in de Basiskaart Grootschalige 	Topografie (BGT) zijn opgenomen. Binnen bospercelen wordt onderscheid gemaakt in loofbossen, naaldbossen en gemengde 	bossen, welke met een willekeurige hoogte en locatie zijn geplaatst. Bomen worden als 2D objecten op 3 vlakken 	geprojecteerd, waardoor het lijkt alsof ze 3D objecten zijn. 
Bron: Basiskaart Grootschalige Topografie (BGT)
Datum: december 2023, Actualisatie: jaarlijks

#### **Straatnamen**  
Deze kaartlaag toont alle straatnamen van Nederland. Afhankelijk van het zoomniveau worden straatnamen weergegeven. Bron: PDOK

#### **Buurtnamen**  
Deze kaartlaag toont alle buurtnamen van Nederland. Afhankelijk van het zoomniveau worden buurtnamen weergegeven. Bron: PDOK

#### **Wijknamen**  
Deze kaartlaag toont alle wijknamen van Nederland. Afhankelijk van het zoomniveau worden wijknamen weergegeven. Bron: PDOK

#### **Gebouw informatie**  
Maakt een koppeling tussen pandobjecten in de 3D viewer en administratieve data uit de Basisadministratie Adressen en Gebouwen (BAG) waardoor het mogelijk is gedetailleerde informatie over het pand, enkele pandkenmerken en de adressen daarbinnen op te vragen. Bron: PDOK

#### **Downloaden 3D gebied (Collada)**  
Maakt het mogelijk alle 3D modellen uit de viewer te downloaden als losse 3D Collada DAE objecten (per kaartlaag). Downloaden kan per tegel van 100x100m met een maximum van 16 tegels tegelijk.

#### **Maak screenshots**  
Naast het maken van schermafbeeldingen met verschillende resolutie, is het ook mogelijk verschillende onderdelen uit de interface wel of niet op te nemen in de afbeelding.

#### **3D modellen toevoegen (OBJ)**  
Maak het mogelijk jouw eigen .obj modellen in de 3D wereld te plaatsen. Je kunt ook direct een .mtl bestand toevoegen om materialen te koppelen.   
Zorg dat het 3D model aan de volgende eisen voldoet:  
- Wavefront OBJ formaat  
- Maximaal 300MB bestandsgrootte  
- Triangulated faces  
Vanuit SketchUp:  
File > Export > 3D Model  
Selecteer OBJ File (*.obj)  
- Zorg dat 'Triangulate all faces' is aangevinkt onder Options  
- Zorg dat 'Swap YZ coördinates' is aangevinkt onder Options

#### **Indicatoren (Tygron)**  
NB. Tygron inlog vereist
Maakt het mogelijk dossiers vanuit Tygron in te laden en de indicatoren in de 3D viewer weer te geven.

#### **Gebouwen kleuren (Op basis van BAG id)**  
Maakt het mogelijk een CSV bestand in te laden met daarin een kolom BAG-Pand id's en een kolom kenmerken. De BAG Pand id's uit de CSV worden gebruikt om een koppeling met de 3D BAG panden uit de viewer te maken om vervolgens het bijbehorende kenmerk te gebruiken om panden te kleuren. Aan elk onderscheidend kenmerk wordt een kleur toegewezen welke zichtbaar wordt gemaakt in de viewer.

#### **Objectenbibliotheek**  
Een aantal voorgedefinieerde objecten kunnen in de viewer worden geladen. Denk aan windmolens of verschillende type bomen. Objecten kunnen op willekeurige locaties geplaatst worden en bij sommige objecten zijn extra instellingen mogelijk.

#### **Minimap**  
Er wordt een minimap getoond waarin je als gebruiker snel naar een andere locatie kunt navigeren. Binnen de minimap geeft een selectiegebied of 'field of sight' aan welk deel van Nederland in het hoofdscherm in 3D wordt weergegeven.

#### **3D tiles (BETA)**  
Maakt het mogelijk om gebouwen en maaiveld 3D Tiles lagen toe te voegen.

#### **Google RealityMesh (BETA)**  
Toont voor delen van Nederland een foto-realistisch beeld van de omgeving.
Met de kaartlaag 'Google Reality Mesh' komt een fotorealistische laag beschikbaar in de 3D viewer. Voor grote delen van Nederland heeft Google een 3D model beschikbaar gesteld waar objecten in 3D herkenbaar worden weergegeven. Deze laag, die in 3D Tiles formaat wordt aangeboden, maakt het mogelijk om nog beter inzicht te krijgen in de werkelijke situatie.

#### **Zonnestand simuleren (Vrij beschikbaar)**  

#### **UrbanReLeaf Sensor Data**  
Deze kaartlaag toont all UrbanReLeaf sensor temperatuur data. Bron: PDOK

---