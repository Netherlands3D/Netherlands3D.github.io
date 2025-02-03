# Mijn URL wil niet importeren door CORS, en nu?

**Wat is CORS?** Cross-Origin Resource Sharing (CORS) is een beveiligingsmechanisme dat webapplicaties beschermt door te
controleren of ze verbinding mogen maken met een server op een ander domein dan het domein van de webapplicatie zelf.
Zonder CORS zou een website toegang kunnen krijgen tot data van andere servers zonder toestemming, wat
veiligheidsrisico’s met zich meebrengt. In de praktijk betekent dit dat u, als beheerder van een webservice, uw server
moet configureren om expliciet toestemming te geven aan externe toepassingen die uw data willen gebruiken.

**Waarom is CORS Configuratie Uw Verantwoordelijkheid** Omdat CORS een beveiligingsmaatregel is van en voor de 
data-aanbieder, kan de configuratie niet vanuit een Netherlands3D viewer worden ingesteld. Webapplicaties, zoals een 
Netherlands3D viewer, moeten toegang tot data krijgen via de server die deze data aanbiedt. Zonder CORS-headers 
blokkeert de browser toegang om de privacy en veiligheid van de server te waarborgen.

!!! info "Waarom hebben desktopapplicaties zoals QGIS geen last van CORS?"

    CORS-beperkingen gelden alleen voor webbrowsers die webapplicaties beschermen tegen ongeautoriseerde toegang tot 
    data. Desktopapplicaties zoals QGIS communiceren rechtstreeks met servers zonder de CORS-beperkingen van 
    webbrowsers en kunnen daardoor zonder beperkingen externe data ophalen.

## Configureer CORS in uw Applicatie of Webserver

**Wat moet u doen?** Om CORS toe te staan, moet u specifieke HTTP-headers configureren in de webserver of 
applicatieserver. De belangrijkste header is: `Access-Control-Allow-Origin: *` (of in plaats van `*` een specifieke 
domeinnaam, zoals https://netherlands3d.eu). 

Afhankelijk van de technologie, zoals MapServer of ArcGIS Server, kunt u deze headers toevoegen in de 
serverinstellingen of in configuratiebestanden.

Voorbeeldinstellingen in MapServer en ArcGIS:

- **MapServer**: Voeg de CORS-headers toe in de configuratie door de mapfile aan te passen of via de 
  webserverconfiguratie (bijv. Apache).

- **ArcGIS Server**: Open de service-instellingen in ArcGIS Manager en configureer de CORS-headers onder 
  "Allowed Origins".

## Verificatie van de CORS Configuratie

1. Open Google Chrome en ga naar de **Inspect**-tool (rechterklik op de pagina > Inspecteren).
2. Ga naar het **Network**-tabblad en laad de pagina van uw webservice.
3. Zoek naar de aanvraag die uw webservice adresseert, klik erop en kijk onder **Headers**.
4. Onder "Response Headers" zou u `Access-Control-Allow-Origin` moeten zien staan. Als de header correct geconfigureerd 
   is, staat hier het domein dat u heeft toegestaan of een `*` voor alle domeinen.

Met deze stappen zorgt u ervoor dat uw data veilig toegankelijk is voor webapplicaties die de juiste toegang nodig 
hebben.
