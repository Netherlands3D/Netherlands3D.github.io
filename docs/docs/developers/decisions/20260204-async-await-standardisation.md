# 2026-02-04 - Gebruik van Async/Await en Unity Awaitables

|            |              |
|------------|--------------|
| **Datum**  | 04-02-2026   |
| **Status** | Geaccepteerd |

## Context

Binnen het project wordt steeds meer gebruikgemaakt van asynchrone functionaliteit. Tot nu toe werd dit op verschillende manieren geïmplementeerd 
(Coroutines, Promises, Unity Awaitables), wat leidt tot variatie en verminderde uniformiteit in de codebase. Om de kwaliteit, voorspelbaarheid en 
onderhoudbaarheid van de code te vergroten, stelt het team een eenduidige werkwijze vast voor nieuwe async‑implementaties.

## Besluit

Vanaf heden gelden de volgende afspraken voor nieuwe, door het team geschreven code:

1. **Async/await, tenzij**  
   Asynchrone functionaliteit wordt standaard geschreven met `async/await`. Unity Coroutines worden niet meer gebruikt voor nieuwe code.

2. **Awaitable, tenzij**  
   Bij Unity‑specifieke async operaties wordt gebruikgemaakt van **Unity Awaitables**.

3. **AwaitableCompletionSource, tenzij**  
   Wanneer een async taak informatie moet teruggeven over *succes* of *fout*, wordt **AwaitableCompletionSource** gebruikt als standaard mechanisme.

4. **Promises alleen bij expliciete motivatie**  
   Promises worden niet toegepast, tenzij er een duidelijke meerwaarde is die binnen het team wordt toegelicht. Alleen na akkoord mag een
   uitzondering worden gemaakt.

## Gevolgen

- Nieuwe eigen code volgt deze afspraken.  
- Bestaande code die hiervan afwijkt wordt **niet direct aangepast**, maar het recht trekken wordt **gepland** en opgepakt wanneer passend binnen
  regulier werk.  
- De codebase zal door deze standaardisering geleidelijk uniformer en beter onderhoudbaar worden.  
- Minder variatie in async‑patronen resulteert in eenvoudiger onderhoud, betere leesbaarheid en snellere onboarding voor nieuwe teamleden.
