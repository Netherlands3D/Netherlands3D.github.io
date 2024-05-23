# Beginnen met Netherlands3D in Unity

!!! warning

    Dit deel van de documentatie is nog gebaseerd op een oudere versie van het project. We werken aan een nieuwe versie 
    die deze spoedig zal vervangen.

## Systeemeisen

Een laptop waarop je software mag installeren (nog) geen Apple en het liefst met een i5 CPU (of hoger) 
en een externe GPU (grafische kaart).
Windows 10 of hoger (in ieder geval 64 bits).
Een losse muis om beter te kunnen navigeren.

## Git installeren

Zorg om te beginnen dat Git is geinstalleerd op het systeem. Dit maakt het mogelijk om pakketjes te installeren.

Git is te downloaden vanaf https://gitforwindows.org/

Installatie met de standaard opties is voldoende. Herstart je systeem na de installatie.

## Unity installeren

Download en installeer Unity3D via <https://unity.com/download>

Je download daarmee de 'Unity Hub'. Vanuit deze Hub kan je verschillende versies van Unity downloaden.

'Sign in' met een bestaand Unity account, of maak eerst een nieuw account aan via 'Create account' en doe dan 'Sign in'

Ga eventueel akkoord met het activeren van een 'FREE personal license'.

Kies in het 'Install Unity Editor' scherm rechtsonderin 'skip installation'. Wij willen namelijk een specifieke versie gaan installeren.

Installeer via 'Installs / Install Editor' de LTS (long term service) versie 2021.3.6f1

![image-20220509104007559](./imgs/beginnen/image0.png)

Maak na het installeren in de Hub een nieuw Unity project aan via 'Projects / New Project' en kies als template '3D Core'.

Kies een naam voor je project en de locatie op je computer

![image-20220509104007559](./imgs/beginnen/new_project.png)

Het project wordt vervolgens automatisch geopend in Unity.

## Netherlands3D packages beschikbaar maken

Met Netherlands3D worden alle packages gepubliceerd op [OpenUPM](https://openupm.com), een Unity Package 
Registry voor Open Source packages.

OpenUPM raadt aan om hun CLI tool te gebruiken om packages mee te installeren, maar het is ook mogelijk om deze
als Scoped Registry toe te voegen middels de volgende stappen:

 
* open Edit/Project Settings/Package Manager.
* Voeg een nieuwe Scoped Registry toe, of bewerk de bestaande OpenUPM verwijzing.
  ```
  Name: package.openupm.com
  URL: https://package.openupm.com
  Scope(s): eu.netherlands3d
  ```
* Klik op Save (of Apply)

Om een overzicht te zien van alle packages die je op deze manier kan installeren volg je deze stappen:

* Open de Package Manager
* In de dropdown `Packages: In Project`, selecteer `My Registries`

In dit overzicht staan alle packages die beschikbaar vanuit Netherlands3D, en andere Scopes mocht je 
die ingesteld hebben staan.

## Netherlands3D opzetten

Open in Unity de package-manager (window package manager)

![](./imgs/beginnen/image1.png)

Klik op het + icoon in de linkerbovenhoek, kies voor "Add package from git URL", vul daar in "<https://github.com/Amsterdam/Netherlands3D.git?path=/Packages/Netherlands3D/>" en klik op "Add".

![](./imgs/beginnen/image2.png)

![](./imgs/beginnen/image3.png)

Unity gaat nu even iets voor zichzelf doen.

Er komt een melding om de editor opnieuw te starten, klik op Yes

![](./imgs/beginnen/editor_herstart.png)



Unity herstart nu en laat daarna, als alles goed gegaan is, de package Netherlands3D zien in de package-manager.

![](./imgs/beginnen/image4.png)

Onder het kopje "Samples" staat een lijst met pakketjes, dit zijn de modules in netherlands3D die je kunt toevoegen aan je eigen project.

![](./imgs/beginnen/image5.png)

We beginnen met het TileSystem. Dit is de module die het 3D-model van de stad laat zien. 
Klik hiervoor op het knopje "Import" naast "TileSystem".

Unity heeft nu in de Assets map een mapje "Samples" aangemaakt met daarin een mapje "Netherlands3D" en daarin een mapje met een
versienummer. In dit mapje staat alles wat je nodig hebt om het 3D-model van de stad in het project te laten zien.

Nu maken we in de Assets map een nieuwe map aan met de naam "RenderPipeline" (let op de hoofdletters).

![](./imgs/beginnen/create_folder.png)

![](./imgs/beginnen/image8.png)

Geef een rechter-muisklik op deze nieuwe map en kies via create > rendering > voor URP Asset (with Universal Renderer).

![](./imgs/beginnen/image9.png)

Unity geeft je nu de optie om de naam van dit nieuwe bestand te wijzigen, maar dat is niet nodig. Geef een enter om de voorgestelde naam te accepteren. Direct na het accepteren van de bestandnaam maakt Unity nog een tweede bestand aan.

![](./imgs/beginnen/image10.png)

De laatste handeling die we moeten doen is aan Unity vertellen dat deze, zojuist gemaakt bestandjes, gebruikt moeten worden door de Universal
Render Pipeline. Dit doen we in de project Settings ( Edit project Settings. In het project settings menu kiezen we in de linker kolom voor "Graphics".)

![](./imgs/beginnen/image11.png)

Boven in het Graphicsmenu klikken we op het rondje naast het invulveld bij Scriptable Render Pipeline Settings.

![](./imgs/beginnen/image12.png)

In het menuutje dat opent dubbelklikken we op het bestandje dat we zojuist hebben aangemaakt.

![](./imgs/beginnen/image13.png)
