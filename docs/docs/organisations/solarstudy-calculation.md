# Verantwoording zonnestudie berekening



## **Beheer van tijdzones en zonnestand berekening in Unity** 

Om tijdzones correct te beheren en de zonnestand nauwkeurig te berekenen, is een aangepaste oplossing geïmplementeerd in Unity. Deze oplossing maakt gebruik van een externe package voor tijdzonebepaling op basis van geografische coördinaten en een aanvullende dataset met historische en toekomstige tijdzone-offsets.

## Tijdzonebepaling op basis van coördinaten

- Er wordt een aangepaste versie van de **GeoTimeZone**-package gebruikt (oorspronkelijk van GitHub: [mattjohnsonpint/GeoTimeZone](https://github.com/mattjohnsonpint/GeoTimeZone)).
- Deze package converteert **latitude/longitude-coördinaten** naar een **IANA time zone identifier** (bijv. *Europe/Amsterdam*).
- Dit maakt de implementatie **OS-onafhankelijk**, waardoor er geen verschillen meer zijn tussen Windows (bijv. *W. Europe Standard Time*) en andere systemen.
- De tijdzonegegevens worden als een **tabel** in Unity geladen, in plaats van als een embedded resource (dit voorkomt compatibiliteitsproblemen met WebGL).

## Tijdzone-offsets en historische data

- Een aanvullende dataset bevat **IANA time zones en hun UTC-offsets** voor verschillende tijdsperiodes.
- Voor Nederland omvat deze dataset de periode *"1916 tot 2037."*
- Ook deze dataset wordt op de Unity-manier ingeladen en verwerkt.

## Verbeterde zonnestand berekening

- Voorheen werd de zonnestand uitsluitend berekend op basis van **tijd en coördinaten**.
- Nu wordt ook de **tijdzone van de floating origin** meegenomen in de berekening.
- Dit zorgt ervoor dat de tijd correct wordt omgerekend naar **UTC**, wat resulteert in een nauwkeurigere zonnestand in de simulatie.

**Conclusie**

Door deze aanpak wordt tijdzonebeheer verbeterd en is de zonnestandberekening betrouwbaarder en consistenter over verschillende platforms en tijdzones.

