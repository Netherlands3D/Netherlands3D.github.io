Layers
======

![layers-topic.png](../imgs/layers-topic.png){align=right width=300}

Imagine walking into a **digital workshop**. At the entrance sits a **Project**, a sturdy cabinet filled with
blueprints, reference notes, and the settings needed to reassemble an entire 3D world.
Each drawer in that cabinet holds a **Layer** — a focused blueprint describing a single part of that world: the terrain,
the buildings, the trees, the imagery above them.

When you open a drawer (load a layer), a **craftsman** — the `LayerGameObject` — takes the blueprint and builds its
physical form on the workbench: a GameObject hierarchy, meshes, textures, and whatever else is needed to make it
visible.
Beside the bench sits a control panel — the **Layer Panel** — letting you switch layers on or off, reorder them, and
tweak their properties while watching the world change.

This is the Layer System of Netherlands3D: a clean separation between **data (the blueprint)**, **runtime behaviour 
(the craftsman)**, and **presentation (the instruments)**.

---

## Quick cheat sheet

* **Purpose:** Provide a bridge between serialized project data and live, interactive scene content.
* **Audience:** Developers and designers extending or integrating new layer types.
* **Mental shortcut:** Layers follow a define → build → interact cycle. 
  LayerData defines the layer, LayerGameObject builds and synchronizes it, and the Layer Panel and scene view let 
  users interact with it — all staying in sync through the model-view-presenter pattern.

---

## 1. Mental model at a glance

| Term                                    | Think of it as                                                                                                                                        | Where it lives                                                                                                                                  |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **Project**                             | The **workshop** that stores all layer blueprints and settings; opening it reconstructs the scene from data.                                          | `Project` / `.nl3d`                                                                                                                             |
| **LayerData**                           | A **blueprint node** in the project hierarchy — pure data (id, name, parent/children, visibility, properties). **No in-world GameObjects.**           | `Assets/_Application/Layers/LayerData.cs`                                                                                                       |
| **ReferencedLayerData**                 | A **blueprint with a handle to runtime content** (e.g., `prefabId`). Owns/attaches a presenter and may resolve external assets/streams.               | `Assets/_Application/Layers/LayerTypes/ReferencedLayerData.cs`                                                                                  |
| **LayerGameObject**                     | The **presenter/visualizer** created and managed **by `ReferencedLayerData`**; builds and syncs the in-world representation and the layer’s UI entry. | `Assets/_Application/Layers/LayerGameObject.cs`                                                                                                 |
| **Layer UI (LayerUIManager / LayerUI)** | The **panel view** for inspecting, toggling, renaming, and reordering layers; **UI only** (no scene orchestration).                                   | `Assets/_Application/Layers/UI/HierarchyInspector/LayerUIManager.cs`, `LayerUI.cs`                                                              |
| **Property Sections**                   | **Modular editors** for layer settings; write to `LayerData` and, when a presenter exists, trigger re-render via the presenter.                       | `Assets/_Application/Layers/Properties/Properties.cs`, `PropertySectionWithLayerGameObject.cs`, `LayerGameObjectPropertySectionInstantiator.cs` |
| **Builder / Spawner / Layers service**  | The **foremen** that instantiate presenters for referenced blueprints and keep hierarchy/order in sync with data.                                     | `Assets/_Application/Layers/LayerBuilder.cs`, `LayerSpawner.cs`, `Services/Layers.cs`                                                           |

Together they form the Layer System: **data-defined blueprints (`LayerData`)** inside a **Project**; **only referenced
blueprints (`ReferencedLayerData`)** create a **presenter (`LayerGameObject`)** that drives the **UI panel** and *
*in-world representation**, with property edits flowing through the model and being reflected live.

---

## 2. A day in the life of a layer

1. **A project is opened**, and its stored `.nl3d` file is read.
   The project loader reconstructs every `LayerData` entry — a set of blueprints describing the layers that make up the
   scene. At this point, nothing is visible yet; the data simply defines what *should* exist.

2. **Each blueprint finds its craftsman.**
   For every `LayerData`, a `LayerGameObject` presenter is instantiated.
   This presenter interprets the stored data into live scene content — spawning GameObjects, loading prefabs, or
   connecting to external datasets such as WMS or 3D Tiles.

3. **The layer’s two views come online.**

    * The **scene view** is created, building the actual 3D representation (meshes, sprites, or tile hierarchies).
    * The **UI view** appears in the Layer Panel, mirroring the model’s name, order, and visibility.

4. **Everything stays in sync.**
   When the user toggles visibility, renames a layer, or adjusts a property in the UI, the presenter updates the
   `LayerData`.
   The change is reflected immediately in the scene.
   Likewise, when project data is modified programmatically, the presenter propagates those updates back to both views.

5. **The layer tidies up when it’s removed or replaced.**
   The presenter detaches from its model, destroys associated GameObjects, and ensures the updated state is stored in
   the project.
   When reopened, the same data can rebuild the same scene, ensuring reproducibility between sessions.

If you prefer a concrete example, picture the **“Buildings”** layer with a referenced dataset and a few basic properties:

| Action                  | What happens behind the scenes                                                                                 |
| ----------------------- | -------------------------------------------------------------------------------------------------------------- |
| Layer is loaded         | `LayerData` specifies a `ReferencedLayerData` with a prefab ID pointing to building models.                    |
| Presenter created       | `LayerGameObject` resolves the prefab, spawns the models, and registers itself in the hierarchy.               |
| User toggles visibility | The UI updates the `visible` flag in `LayerData`; the presenter calls `SetActive(false)` on the scene objects. |
| User edits color        | The property section writes the change to the model; the presenter reconfigures the material.                  |
| Layer deleted           | The presenter cleans up, detaching its references and removing the model from the project.                     |

Every step follows the same cycle:
**data model defines → presenter interprets → views reflect → data model updates.**

---

## 3. Understanding Layers

### 3.1. The workshop: Projects as containers

![layers - tinkering.png](../imgs/layers%20-%20tinkering.png){align=right width=300}

A **Project** in Netherlands3D acts as the *workspace* of the system. It stores not only project-wide configuration and 
metadata but also an ordered collection of **Layer blueprints** (`LayerData` objects).

Each blueprint defines:

* What the layer is (`type`)
* How it should appear (`visible`, `style`, `properties`)
* How it connects to others (`parent`, `children`)

When you open a project (`.nl3d` file), the system rebuilds your workspace:

1. It reads all stored `LayerData` objects.
2. It instantiates a **LayerGameObject** for each one that has a visualisation, or presenter.
3. Those presenters rebuild their corresponding scene content and user interface entries.

The result: your saved digital world — exactly as it was when you left it.

### 3.2. The blueprint: LayerData

**`LayerData`** is the **model** — pure, serializable information.
It doesn’t render, animate, or run code. It describes *what* exists, not *how* it behaves.

Each `LayerData` instance defines:

* A unique identifier (`id`)
* Its type (determines which presenter will interpret it)
* Relationships (parent/child layers)
* Visibility, name, and metadata
* Optional serialized **property blocks** (through the properties system)

Because `LayerData` is stored as JSON (using Newtonsoft), it’s platform-agnostic and editable outside Unity if needed.

### 3.3. The craftsman: LayerGameObject

Once the project loads, each blueprint is handed to a **craftsman** — a `LayerGameObject`.
This class acts as the **Presenter** in the MVP pattern: it binds the pure data from `LayerData` to two forms of
presentation:

1. **The Scene View** — a tangible GameObject hierarchy with renderers, meshes, or other runtime elements.
2. **The UI View** — a panel entry for toggling, reordering, and editing.

Its duties include:

* Creating and maintaining the scene object tree.
* Reacting to model updates (visibility, order, style changes).
* Forwarding UI edits back to the model.
* Managing lifecycle events such as instantiation, destruction, and rehydration after serialization.

### 3.4. The instruments: Layer panel and in-world representation

The craftsman doesn’t work alone — it interacts with instruments that let both developers and users see and control its
results.

#### 3.4.1 UI View — the Layer Panel

The **Layer Panel** conceptually mirrors Unity’s hierarchy but with more context.
It’s managed by `LayerUIManager` and composed of `LayerUI` elements — one per layer.
Through this interface you can:

* Toggle visibility
* Reorder layers
* Select layers for editing
* Delete layers
* Open property sections for fine-tuning

Unlike the classic Unity hierarchy, the panel is not just a visual list — it’s fully synchronized with the `LayerData`
hierarchy.

#### 3.4.2 Scene View — the 3D result

Each layer’s `LayerGameObject` builds its own subtree of GameObjects, representing what that layer contributes to the
scene.
Depending on the layer type, this might be:

* A **mesh or tile** (e.g., Cartesian tiles)
* A **set of sprites or annotations**
* A **streamed dataset** (e.g., OGC 3D Tiles or WMS imagery)
* A **custom prefab** loaded via `ReferencedLayerData`

### 3.5. Types of blueprints: Basic vs Referenced layers

| Type                 | What it describes                                                             | Common use                                |
|----------------------|-------------------------------------------------------------------------------|-------------------------------------------|
| **Basic Layer**      | Self-contained; data and visual are built entirely from the model.            | Folders, polygon overlays, feature masks. |
| **Referenced Layer** | Contains a pointer to external content (prefab, library ID, streamed source). | 3D Tiles, WMS imagery, CityJSON models.   |

Referenced layers are defined by **`ReferencedLayerData`**, which tells the presenter how to resolve the external
resource.
Their `LayerGameObject` might live outside the main hierarchy, but they still behave like native layers in the UI panel.

### 3.6. Fine-tuning the result: Properties and Property Sections

Once a layer is built, its look and behaviour can be adjusted through **Property Sections** — modular UI components
bound to its model and presenter.

The **properties system** includes:

* `Properties.cs` — the backbone for registering and reading property blocks.
* `PropertySectionWithLayerGameObject.cs` — a base for UI sections that interact with presenters.
* `LayerGameObjectPropertySectionInstantiator.cs` — a factory for spawning the right sections per layer type.

Example property sections:

* `FillColorPropertySection.cs` — controls polygon fill color.
* `VerticalDatumPropertySection.cs` — adjusts reference elevation.
* `ToggleScatterPropertySection.cs` — toggles scattered objects in polygon layers.
* `CredentialsInputPropertySection.cs` — manages authentication for remote layers.
* `WMSPropertySection.cs` — configures WMS source parameters.

Each property section updates the **model**, not the scene directly.
The presenter observes model changes and reflects them into the scene view — keeping data authoritative.

### 3.7. The ecosystem of creation and updates

Several utilities keep the system coherent:

| Role               | Responsibility                                                                      | Typical Files        |
|--------------------|-------------------------------------------------------------------------------------|----------------------|
| **Layers Service** | Facade that coordinates everything: building, destroying, and syncing.              | `Services/Layers.cs` |
| **LayerBuilder**   | A Builder for constructing new models, which can be added using the Layers Service. | `LayerBuilder.cs`    |
| **LayerSpawner**   | Factory for constructing, or spawning, the LayerGameObjects -or presenters-.        | `LayerSpawner.cs`    |
| **LayerUIManager** | UI hierarchy and visibility control.                                                | `LayerUIManager.cs`  |

Together, they ensure that adding a new layer or reloading a project follows the same predictable pattern.

### 3.8. Hierarchy, order, and visibility

The **hierarchy** of `LayerData` mirrors Unity’s transform hierarchy:

* **Parenting** maps to `Transform.parent`.
* **Reordering** maps to `SetSiblingIndex`.
* **Visibility** maps to `GameObject.SetActive`.

Referenced layers maintain the same semantics even when their roots live elsewhere.

---

## 4. Crafting Layers

---

## 5. Where Layers live and how they travel

---

## 6. Tips & best practices

* **Let data lead.** `LayerData` is the source of truth; presenters interpret it.
* **Keep presenters idempotent.** They should rebuild safely when data changes or reloads.
* **Minimize deep nesting.** Each transform level adds cost; prefer logical grouping.
* **Clean teardown.** Deregister and destroy referenced content carefully.
* **Stay data-driven.** Avoid hardcoded child references; rely on serialized data and builders.
* **Respect Functionality toggles.** Integrate with the `FunctionalityListener` system.

---

## 8. Recap

1. The **Project** is your workshop — a collection of layer blueprints (`LayerData`).
2. Each **Layer** is a blueprint that comes to life through its **Presenter** (`LayerGameObject`).
3. The **Presenter** visualizes the in-world scene, and the UI panel visualizes the UI view.
4. **Properties** let users fine-tune layer data; the presenter reflects those changes live.
5. The **LayerUIManager** handles panel interaction, while **LayerSpawner** and **Layers** handle creation logic.
6. Everything stays serializable, modular, and data-driven — ensuring reproducibility across sessions and machines.

---

## 9. Further reading

* [Guide: Adding a new Layer Type](./adding-a-simple-type-of-layer.md)
