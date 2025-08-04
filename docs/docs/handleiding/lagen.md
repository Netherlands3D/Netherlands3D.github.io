# Lagen

Basisfunctie, hoofdmenu.  
![Building Blocks](../handleiding/imgs/lagen.menu.main.png)

Lagen is onderdeel van **de basisfuncties van Netherlands3d.eu**. Deze functie biedt de mogelijkheden om **datalagen en objecten** uit verschillende bronnen te (ont)**koppelen** en de zichtbaarheid hiervan aan te passen. 
 
Dit hoofdstuk beschrijft de belangrijkste functies van lagen en geeft uitleg over de gebruikersinterface en essentiële functies.  
<br>
---

## Overzicht van de functies

Door het uit-/aanvinken van datalagen worden deze verborgen of getoond. 
Met behulp van links en/of het importeren van bestanden worden datalagen en objecten gekoppeld.

<video controls>
<source src="../video/lagen.mp4" type="video/mp4">
</video>
_(Video) gebruik van Lagen_

---

## Gedetailleerde beschrijving van de functies

### **Menu (linksboven)**
Door met de muis op het `Lagen-icoon` in het hoofdmenu te klikken wordt de tool actief.  
Het menu klapt open en de **basislagen worden zichtbaar**.

![Building Blocks](../handleiding/imgs/lagen.main.png)  
_(Afbeelding) lagen-menu_

---

### **functies**

* #### **Standaardlagen**   
De lagen Bomen, Bossen, Gebouwen en Maaiveld zijn in de basisversie standaard gekoppeld.

* #### **Laagvolgorde**   
Met de muis en linkermuisknop kan de volgorde van de lagen worden gewijzigd.  
`Klik` op een laag en `sleep` de laag naar de gewenste plek door de `linkermuisknop` ingedrukt te houden. Door de laag op een andere laag te slepen wordt deze onder die laag gekoppeld. Sleep je de laag tussen twee lagen, Dan wordt deze er tussen geplaatst na het `loslaten` van de `linkermuisknop`. Met deze functie kunnen lagen op- of juist onder elkaar worden gesorteerd.

![Building Blocks](../handleiding/imgs/lagen.slepen.gif)
_(Afbeelding) Rangschikken van lagen_

!!! tip "Waarom zie ik geen effect bij het verslepen van de lagen?"
	Het verplaatsen van lagen heeft alleen een zichtbaar effect bij lagen waarin WMS-data gekoppeld is.  
	[zie Voorbeeld koppelen bestand met URL](../toevoegen-importeren/#bestand-bestand-via-url).

* #### **Tonen/verbergen**   
Klik op het `oog` voor het verbergen of tonen van de inhoud van de datalagen in de 3D-Viewer.

* #### **Transformatie tool**   
De locatie, oriëntatie en schaal van toegevoegde objecten wordt met de transformatie tool aangepast.

![Building Blocks](../handleiding/imgs/lagen.transformatie.png)
_(Afbeelding) Transformatie tool geactiveerd door selectie in Lagen_
<br>  
 
* #### **Eigenschappen**   
Van toegevoegde objecten en sommige lagen kunnen eigenschappen zoals b.v. de locatie, oriëntatie en schaal maar ook object/laag specifieke eigenschappen worden aangepast.  
Klik op het `Eigenschappen-icoon` om het eigenschappenmenu te openen.

![Building Blocks](../handleiding/imgs/lagen.instellingen.png)
_(Afbeelding) Instellingen actief_

* #### **Kleurenpaneel** 

Bij het laden van .OBJ, .GLB, WFS en GeoJSON lagen is er de mogelijkheid om de kleuren van de geladen data te  wijzigen. Dat geldt ook de standaard terreinlaag. De gebouwenlaag volgt later en ook de mogelijkheid om kleuren te herstellen volgt later. Hoe je de kleuren wijzigt, lees je hieronder.

![Building Blocks](../handleiding/imgs/kleurenpaneel.aanroepen.png)

Door op het **instellingen** icoon te klikken open je het instellingenvenster waar, wanneer van toepassing, het kleurenpaneel zichtbaar wordt.

![Building Blocks](../handleiding/imgs/kleurenpaneel.overzicht.png)

Met het **kleurenpaneel** kan je kleuren en transparantie van basis en toegevoegde lagen aanpassen (deze kunnen materiaal kleuren uit een .mtl bestand overrulen). Door op een kleur in de cirkel te klikken, of door op het rondje in de kleurenwaaier te klikken en te verslepen, kan je jouw gewenste kleur kiezen. De saturatie is dan nog aanpasbaar via de meest rechtse horizontale balk. Daarnaast kan de transparantie van de kleur worden aangepast (werkt voorlopig alleen voor WFS/GeoJSON). Ook kan je een Hexadecimale Kleurcode invullen in het onderste veld.

De kleur van de geladen en geselecteerde laag zal nu wijzigen naar de gekozen kleur.

* #### **Afgeschermde bronnen**

#### Invullen gebruikersnaam en wachtwoord
![Building Blocks](../handleiding/imgs/afgeschermde.bronnen.wachtw.png)

Als er een laag van een afgeschermde bron wordt geladen (via het importeren menu), krijg je bovenstaande venster in beeld. Dit kunnen WMS/WFS/GeoJSON en 3D-Tiles lagen zijn, welke je via een bestand of url koppelt. In dit venster vul je gebruikersnaam en wachtwoord in.

#### Switchen tussen gebruikersnaam/wachtwoord en code
![Building Blocks](../handleiding/imgs/afgeschermde.bronnen.switch.png)

Wanneer je geen gebruikersnaam en wachtwoord hebt, maar alleen een code (bijvoorbeeld een API-key) dan kan je via bovenstaande knop switchen tussen gebruikersnaam/wachtwoord en code.

#### Invullen Code
![Building Blocks](../handleiding/imgs/afgeschermde.bronnen.token.png)


In dit venster vul je alleen de code in.

Als je de gegevens hebt ingevuld, wordt de laag gemaakt en de gegevens uit bestand of bron geladen.

---
