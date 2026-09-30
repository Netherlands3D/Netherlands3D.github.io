# How to color parts of the terrain

## Introduction

How to use the CartesianTileLayerStyler and expressions to assign distinct fill colors to specific terrain feature
types—e.g. footpaths, residential zones, and roads—based on their material index.

Using the Netherlands3D styling system ensures that any styling rules you define are saved directly into the project
file and will be automatically reapplied whenever the project is reopened or the layer is reloaded.

---

## Prerequisites

- A `BinaryMeshLayer` or similar layer already added to your scene

---

## Step 1: Identify your feature-type → material-index mapping

Your tile data assigns each feature a material index via the `data-materialindex` attribute. Decide which indices
correspond to each terrain part. For example:

```csharp
// These values depend on how your CartesianTiles are authored!
const int footpathIndex      = 0;   // e.g. “footpath” material
const int residentialIndex   = 1;   // e.g. “residential area” material
const int roadIndex          = 2;   // e.g. “road” material
```

!!!tip "If you’re not sure, inspect your layer’s mesh materials in the editor or log `layerFeature.Attributes["data-materialindex"]` at runtime."

---

## Step 2: Choose your colors

Define the `Color` instances you want to use:

```csharp
var footpathColor = new Color(0.8f, 0.7f, 0.5f); // a light sandy tone
var residentialColor = new Color(0.9f, 0.9f, 0.6f); // a pale yellow
var roadColor = new Color(0.7f, 0.7f, 0.7f); // light gray
```

---

## Step 3: Apply styling in code

In your layer-initialization (or UI callback), call `CartesianTileLayerStyler.SetColor` for each type:

```csharp
void StyleTerrainLayer(BinaryMeshLayer terrainLayer)
{
    // Get the LayerGameObject wrapper
    var layerGO = terrainLayer.GetComponent<LayerGameObject>();

    // Iterate the existing features in this layer
    foreach (var kvp in layerGO.LayerData.LayerFeatures)
    {
        var layerFeature = kvp.Value;

        // Get the material index identifier from the attributes        
        if (!layerFeature.Attributes.TryGetValue("data-materialindex", out var idxStr)) continue;
        if (!int.TryParse(idxStr, out var materialIndex)) continue;

        // Choose color based on materialIndex
        switch (materialIndex)
        {
            case footpathIndex: CartesianTileLayerStyler.SetColor(layerGO, layerFeature, footpathColor); break;
            case residentialIndex: CartesianTileLayerStyler.SetColor(layerGO, layerFeature, residentialColor); break;
            case roadIndex: CartesianTileLayerStyler.SetColor(layerGO, layerFeature, roadColor); break;
            // add more cases as needed
        }
    }
}
```

> **What’s happening?**  
> For each `LayerFeature` you find with a given index, `SetColor` builds an expression like
>
> ```csharp
> Expression.EqualTo(
>     Expression.Get("data-materialindex"),
>     "<index>"
> )
> ```
>
> and installs a `StylingRule` that fills any real feature with that same index in your layer.

---

## Step 4: Verify in the Editor

1. Enter Play Mode (or run in the Scene view).
2. Inspect your terrain layer: footpaths should now use `footpathColor`, residential blocks use `residentialColor`, and
   roads use `roadColor`.
3. If anything looks off, check the console for parsing errors or confirm the right material indices.

---

## What’s next?

- **Combine multiple indices:** if “roads” span two materials, use a single `StylingRule` with `Expression.Any`:
  ```csharp
  var roadExpr = Expression.Any(
      Expression.EqualTo(Expression.Get("data-materialindex"), "2"), // first road material
      Expression.EqualTo(Expression.Get("data-materialindex"), "3") // second road material
  );
  ```
  It is recommended to add a convenience method, such as `SetRoadColor()` to the `CartesianTileLayerStyler` class -or
  through an extension method- to have a logical interface how to manipulate the styling of this type of layer.
- **Dynamic UI:** build a color-picker panel that reads the current style via `GetColor` and lets users tweak colors at
  runtime.

---

## Performance tips

- Regroup similar expressions into fewer rules; avoid one-rule-per-feature if you have hundreds.

---


## Further Reading

- [Explanation: Layer styling](../styling.md) - for more in-depth information how the styling system works.
