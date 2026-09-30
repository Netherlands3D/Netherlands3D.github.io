# Memory Management – Overzicht

Tilekit is ontworpen voor omgevingen waarin grote datasets efficiënt en voorspelbaar moeten worden verwerkt. Omdat
Unity—en met name WebGL—met vaste geheugenmodellen werkt, hanteert Tilekit een geheugenstrategie die gericht is op
stabiliteit, hergebruik en minimale fragmentatie. Dit geldt voor alle onderdelen van het systeem, van cold storage tot
warm en hot tiles.

De kernprincipes zijn:

- **Structure of Arrays (SoA):** Tilekit bewaart data in lineaire, gealigneerde blokken. Hierdoor blijft het geheugen
  compact en kunnen tiles snel worden geselecteerd, gefilterd en geüpdatet.
- **Preallocatie en pools:** Alle datastructuren die tijdens de levenscyclus van een tile nodig zijn, worden vooraf
  gealloceerd of komen uit een pool. Dit voorkomt runtime-allocaties, piekbelasting en fragmentatie.
- **Geen allocaties binnen tile-lifecycles:** Zodra een tile cold, warm of hot is, worden er geen nieuwe structuren meer
  aangemaakt. Materialisatie en dematerialisatie gebruiken uitsluitend vooraf voorbereide buffers of bestaande objecten.
- **Voorspelbare geheugenblokken:** Cold Storage, warm data en hot representaties gebruiken vaste patronen en blokken,
  zodat Tilekit stabiel blijft bij grote aantallen tiles en meerdere datasets tegelijkertijd.

Deze principes vormen de basis voor het gedrag van Archetypes en DataSets in de volgende hoofdstukken. Omdat memory
management een breed en gedetailleerd onderwerp is, zijn de achterliggende motivaties, best practices en
implementatierichtlijnen beschreven in een afzonderlijk document.
