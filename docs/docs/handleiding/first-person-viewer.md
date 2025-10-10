# First Person Viewer

Functie, hoofdmenu.  

<div style="display: flex; align-items: flex-start; gap: 15px;" markdown>

*De First Person Viewer (FPV) is een work-in-progress functionaliteit van Netherlands3D.*
</div>

De First Person Viewer maakt het mogelijk voor gebruikers om zich op realistische ooghoogte door de 3D-wereld te bewegen. Zo kan de gebruiker ervaren hoe een aangepaste omgeving in het echt beleefd zou worden.


---
## Beginnen
Om de First Person Viewer te starten, volg je de onderstaande stappen:
1. Zet de functionaliteit aan via Instellingen → Functionaliteiten → First Person Viewer.
2. Er verschijnt een First Person Viewer-knop rechtsonder in beeld, naast de noordpijl.
3. Sleep het poppetje uit de knop naar de gewenste locatie in de wereld waar je wilt rondlopen. Vanaf hier opent de First Person Viewer.

<br>

![Building Blocks](../handleiding/video/fpv_start_drag.gif){ width="550px" }  


---

### Verlaten
De first person viewer vergrendeld de muisaanwijzer vast in de first person viewer. Deze kun je weer ontgrendelen door één keer op **Backspace** te drukken.
Het verlaten van de first person viewer kan op meerdere manieren;

- Houd de **Backspace**-toets 2 seconden ingedrukt. Linksboven in het scherm verschijnt een voortgangsbalk zien die aangeeft hoe lang je escape nog moet indrukken voordat je de first person viewer verlaat.
- Druk één keer op Backspace om de muis vrij te geven, en klik vervolgens rechtsboven op de 'verlaten' knop om de First Person Viewer te verlaten. 

![Building Blocks](../handleiding/video/fpv_verlaten.gif){ width="550px" }  


---

## Besturing
Er zijn verschillende manieren van bewegen in de first person viewer. 
In de beta-versie kan **gelopen** en **gevlogen** worden, in aparte bewegings modi.

De algemene beweging kan op twee manieren worden gedaan;

- met de **pijltjestoetsen**, *óf* 
- met de knoppen **'W, A, S, D'**.

Hieronder volgt uitleg per bedieningsmethode. Kies de methode die voor jou het prettigst werkt.

<br>

#### Pijltjestoetsen
Met de pijltjestoetsen kun je rondbewegen in de First Person Viewer. De muis gebruik je om rond te kijken in de virtuele wereld. Door de muis te bewegen, verander je je kijkrichting. De pijltjestoetsen bewegen je vervolgens in die richting.
Op dit onderstaande kaartje is zichtbaar welke knoppen waarvoor dienen:

![Building Blocks](../handleiding/imgs/FPV_buttonmappingPijlen.png){ width="1000px" }  

Extra functies:

- Versnellen: houdt **Shift** ingedrukt.

Loopmodus:

- Springen: druk op **Spatiebalk**.

Vliegmodus:

- Omhoog vliegen: **Spatiebalk** *of* **PageUp**.
- Omlaag vliegen: **PageDown**.

<br>

#### W A S D
Je kunt rondbewegen door de knoppen 'W A S en D' te gebruiken. 

- Vooruit: **W**.
- Achteruit: **S**.
- Links: **A**.
- Rechts: **D**.

Deze knoppen zijn bepaald met respect tot hun positie op het toetsenbord, net als de pijltjestoetsen. 
De muis gebruik je om rond te kijken in de virtuele wereld. Door de muis te bewegen, verander je je kijkrichting. De knoppen 'W A S en D' zullen bewegen in de gekozen kijkrichting.

Onderstaand kaartje toont de knoppenindeling:

![Building Blocks](../handleiding/imgs/FPV_buttonmappingWASD.png){ width="1000px" }  

Daarnaast zijn er verschillende manieren om te bewegen in de tool:

- Versnellen: houdt **Shift** ingedrukt.

Loopmodus:

- Springen: druk op **Spatiebalk**.

Vliegmodus:

- Omhoog vliegen: **Spatiebalk** *of* **Q**.
- Omlaag vliegen: **E**.

<br>

### Algemene besturing:
Wisselen tussen bewegingsmodi: **Tab**.
De camera te draaien zonder de muis: 

- Omhoog draaien: **I**.
- Omlaag draaien: **K**.
- Naar links draaien: **J**.
- Naar rechts draaien: **L**.

Handige sneltoetsen:

- Screenshot: **C**.
- "Snap" omhoog naar het hoogste niveau: **R**.
- Verberg alle UI (User Interfaces): **H**. Druk nogmaals H om de UI weer te tonen.

---

### Movement Modus
Op dit moment heeft de first person viewer twee bewegings-modi, lopen en vliegen.
Hiernaast zijn meerdere modi in ontwikkeling.
Je kunt van **modus wisselen** door:

- op de pijlen links of rechts in de button op het scherm te klikken.
- op de cirkel met de huidige bewegingsmodus te klikken om het menu te openen.
- De toetsen **Tab** en **Enter** te gebruiken.

![Building Blocks](../handleiding/video/fpv_moduswissel.gif){ width="550px" }  


In het instellingenpaneel van de First Person Viewer kun je enkele variabelen aanpassen:
- **Snelheid**.
- **Gezichtsveld** (vergelijkbaar met de breedte van een lens).
- **Kijkhoogte**.

Typ zelf de gewenste waardes in en klik vervolgens uit het veld om de waardes vast te leggen.


### Functionaliteiten
De first person viewer heeft enkele functionaliteiten die in de beta versie beschikbaar zijn voor gebruik:

- Ondergronds kijken:
Bij het activeren van deze functie verschijnt een cirkel op het grondvlak, waarmee je ondergronds kunt kijken.
- Gebouwen informatie:
In het midden van het scherm verschijnt een kleine stip. Richt deze stip op het gewenste gebouw en klik. In het veld rechts verschijnt gebouwinformatie, uit de Basisadministratie Adressen en Gebouwen (BAG). *Let op, houd voor deze functionaliteit uw muis stil wanneer u klikt, bewegende selectie wordt meestal niet gedetecteerd.*
- Zonnestand simuleren: 
Hiermee kan je de Zonnestand simuleren door tijd en datum aan te passen, of de zon in de slider op te pakken en te bewegen.
- Reset to start: Deze button hersteld de beginpositie van de first person viewer. *Let op: dit werkt nog niet goed bij grote afstanden*.

*De First Person Viewer is een bètaversie in ontwikkeling door Netherlands3D*.

