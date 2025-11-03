Architecture
============

## Overview

The Netherlands3D platform is built on a **hybrid conceptual model** that unites principles from [**MVVM 
(Model–View–ViewModel)**][MVVM] and [**MVP (Model–View–Presenter)**][MVP]. This model was created to address a 
fundamental challenge: in Netherlands3D, **Project Data**—and by extension, **Layer Data**—always has **two views**.

- a **UI view** for interaction and configuration, and 
- a **Scene view** for spatial visualization.

Traditional [MVP] or [MVVM] structures assume a single dominant view, but the Netherlands3D model treats both as equal
interpreters of the same data. By placing **data (the model)** at the centre, the architecture ensures that both worlds 
remain synchronized through a single, persisted source of truth.

---

## Historical Context

Modern software architecture has progressively evolved toward a deeper **separation of data and behaviour**.
The earliest **two-tier architectures** coupled presentation logic directly to the data store.
This evolved into **three-tier architecture**, which introduced a dedicated application layer to mediate between
presentation and data.
Patterns such as [**Model–View–Presenter (MVP)**][MVP] and [**Model–View–Controller (MVC)**][MVC] refined this further 
for interactive applications, and later [**Model–View–ViewModel (MVVM)**][MVVM] formalized declarative, data-bound user 
interfaces.

Netherlands3D continues this lineage. It extends these ideas into a **five-tier hybrid model (V–VM–M–P–V)** that 
combines both patterns: [MVVM] for UI-driven configuration and [MVP] for in-world visualization.
Both tiers communicate through a shared data model that represents the persistent state of the system.

---

### **Figure – Evolution of Software Architecture Toward the Netherlands3D Model**

*(Insert the lineage-to-hybrid diagram here.)*

> This diagram illustrates the evolution from classical two- and three-tier architectures toward presentation patterns
> like [MVP] and [MVVM].
> Each generation increases the separation between data and behaviour, culminating in the **five-tier hybrid** used in
> Netherlands3D.
> In this model, the user interface ([MVVM]) and spatial visualization ([MVP]) both rely on the same persisted data model —
> the single source of truth.

---

## The Hybrid Conceptual Model

The Netherlands3D **Hybrid Conceptual Model** unites the principles of [MVVM] and [MVP] around the central idea that 
**data is the truth of the system**. This truth is shared across two complementary pathways:

* **The UI Path** — users interact with the application through panels, inspectors, and configuration interfaces built
  with [MVVM] principles. Changes made in the UI update the shared data model.

* **The Visualization Path** — the same data is interpreted by scene presenters ([MVP]) that manage spatial objects,
  geometry, and other 3D representations. Visualizers read from the same data model and reflect its current state.

This creates a **dual-view architecture**—one for interaction, one for visualization—both synchronized through the same
data.

---

### **Figure – Hybrid Conceptual Model (V–VM–M–P–V)**

*(Insert the “tiers and truth” diagram here.)*

> Each flow represents a different interpretation of the same data.
> The left side (“want to change stuff”) corresponds to the UI; the right side (“want to show stuff”) corresponds to
> visualization in the 3D scene. Both converge on the **Model (Data)**, the persisted truth at the centre of the system.

---

## Data as the Truth

At the centre of Netherlands3D lies the **data model**—objects such as `ProjectData`, `LayerData`, and
`LayerPropertyData`. These objects are serializable, human-readable, and form the **persisted state** of the 
application. Everything else—the UI, behaviours, and scene objects—either **observes**, **modifies**, or 
**renders** this data.

This approach draws from **data-driven programming** (not to be confused with data-oriented design).
In data-driven systems, **data describes behaviour**; systems interpret that data rather than hard-coding logic.
Netherlands3D applies this principle throughout, ensuring that what users configure in the editor is exactly what
appears in the 3D world and what is saved to disk.

---

## Layers and Separation of Concerns

While tiers describe how **data and behaviour** are separated horizontally, Netherlands3D achieves 
**separation of concerns** vertically through **layered composition**—a concept inspired by **data-oriented design** 
and **Entity–Component–System (ECS)** principles.

Each **Layer** in Netherlands3D acts like an **entity** that can aggregate multiple **components**, known as
`LayerPropertyData` blocks. These components define specific aspects of the layer’s configuration or 
behaviour—such as styling, elevation sampling, animation, or metadata.

At runtime, each layer also has corresponding presenters and visualizers that operate across all tiers:

| Concern            | Data Tier           | Behaviour Tier     | Presentation Tier    |
|--------------------|---------------------|--------------------|----------------------|
| **Layer**          | `LayerData`         | `LayerGameObject`  | Scene objects        |
| **Property Block** | `LayerPropertyData` | Property presenter | UI & world behaviour |
| **Styling**        | `LayerStyle`        | Style visualizer   | Visual appearance    |

This structure allows every **layer** to touch every **tier**—from serialized data to runtime visualization—without
breaking encapsulation. Each concern remains modular and composable: adding a new capability simply means defining a 
new data block and its associated presenters.

---

## Rationale and Benefits

This architectural approach offers several advantages:

1. **Unified data flow** – both UI and scene rely on the same data model, eliminating duplication and desynchronization.
2. **Clear separation of data and behaviour** – tiers isolate persistence, logic, and visualization.
3. **Clear separation of concerns** – layering allows each functional area (e.g., styling, animation, sampling) to
   evolve independently.
4. **Extensibility** – new functionality can be introduced by adding new property types and corresponding presenters.
5. **Consistency** – every layer behaves predictably because all tiers reference the same persisted truth.
6. **Transparency** – the entire application state is inspectable and serializable, improving reproducibility and
   debugging.

---

## Summary

The **Hybrid Conceptual Model** provides the backbone of Netherlands3D’s architecture. It combines the structured 
clarity of **tiered design** with the modular flexibility of **ECS-inspired layering**. By placing 
**data at the centre**, both UI and world visualization remain in sync, enabling reproducible, data-driven
workflows across the entire application.

Each layer in the system therefore operates as a small, self-contained world:

* its data defines **what it is**,
* its presenters define **how it behaves**, and
* its views define **how it appears**.

Together, these patterns allow Netherlands3D to scale from small experiments to full city-scale digital twins without
compromising architectural clarity or maintainability.

---

Would you like me to follow this with a short **“Architectural Summary Diagram” caption and layout suggestion** (a final
overview figure that visually combines tiers + concerns in one nested illustration)? It would make this the perfect end
section for your architecture chapter.

[MVVM]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel
[MVP]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter
[MVC]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller