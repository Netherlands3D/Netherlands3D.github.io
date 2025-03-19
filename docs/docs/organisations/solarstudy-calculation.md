# Verantwoording zonnestudie berekening



## **Beheer van tijdzones en zonnestand berekening in Unity** 

Om tijdzones correct te beheren en de zonnestand nauwkeurig te berekenen, is een aangepaste oplossing geïmplementeerd in Unity. Deze oplossing maakt gebruik van een externe package voor tijdzonebepaling op basis van geografische coördinaten en twee aanvullende datasets met historische en toekomstige tijdzone-offsets.

## Tijdzonebepaling op basis van coördinaten

- Er is een aangepaste versie van de **GeoTimeZone**-package gebruikt (oorspronkelijk van GitHub: [mattjohnsonpint/GeoTimeZone](https://github.com/mattjohnsonpint/GeoTimeZone)).
- Deze package converteert **latitude/longitude-coördinaten** naar een **IANA time zone identifier** (bijv. *Europe/Amsterdam*).
- Dit maakt de implementatie **OS-onafhankelijk**, waardoor er geen verschillen meer zijn tussen Windows (bijv. *W. Europe Standard Time*) en andere systemen.
- De tijdzonegegevens worden uit een bestand in de **Resources map** uitgelezen en in Unity geladen. Dit bestand bevat een vast aantal gegevens en moet handmatig worden geüpdatet om veranderingen in de tijdzones en de zomer/wintertijd te bevatten die sinds 2019 mogelijkerwijs plaats hebben gevonden.

## Tijdzone-offsets en historische data

- De aanvullende datasets bevat **IANA time zones en hun UTC-offsets** voor verschillende tijdsperiodes.
- Voor Nederland omvat deze dataset de periode *"1916 tot 2037."*
- Ook deze datasets zijn op de Unity-manier ingeladen en verwerkt.

## Verbeterde zonnestand berekening

- Voorheen zat er een bug in omdat de tijdzone conversie niet werkte in WebGL, waardoor de zonnestand een afwijking had van 1 of 2 uur (afhankelijk van de zomer/wintertijd) omdat de tijd altijd als **UTC** tijd werd geïnterpreteerd, in plaats van de tijd die voor Amsterdam geldt (Central European Time, CET).
- Nu is ook de **tijdzone van de floating origin** meegenomen in de berekening.
- Dit zorgt ervoor dat de tijd correct is omgerekend naar **UTC**, wat resulteert in een nauwkeurigere zonnestand in de simulatie.

**Conclusie**

Door deze aanpak is tijdzonebeheer verbeterd en is de zonnestandberekening betrouwbaarder en consistenter over verschillende platforms en tijdzones.

