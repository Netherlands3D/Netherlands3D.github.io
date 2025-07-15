# Add styling support to layers

### Goal

Show how to extend `LayerGameObject` to surface its visual elements as `LayerFeature` instances, and how to build a
companion “Styler” class that applies and persists style rules to your layer’s features.

---

### Prerequisites

* You already have a subclass of `LayerGameObject` for your custom layer type (e.g. `MyCustomLayerGameObject`).
* You understand the basics of the Netherlands3D Expression & Styling system (see “How to color parts of the terrain”
  guide).

---

### Step 1: Expose your features

In your `LayerGameObject` subclass’s `Awake()`, create one `LayerFeature` per visual element (e.g. per material, 
per mesh, per component). This lets the styling engine treat them as independent style targets.

!!!example

    In this example is shown how each of the materials is converted into a LayerFeature since that is for a mesh layer 
    often that which distinguishes a feature - or type of feature. This can also be a GameObject -as happens for the 
    .OBJ import- or actual GeoJSON.net Feature objects.

    ```csharp
    // MyCustomLayerGameObject.cs
    protected override void Awake()
    {
        base.Awake();
    
        for (int i = 0; i < layer.DefaultMaterialList.Count; i++)
        {
            // duplicate material so color changes don’t bleed into the original
            var mat = new Material(layer.DefaultMaterialList[i]);
            layer.DefaultMaterialList[i] = mat;

            var feature = CreateFeature(mat); // Create the feature and ..
            LayerFeatures.Add(mat, feature); // .. register it
        }
    }
    ```

The styling system only sees what you expose as `LayerFeatures`. By calling `CreateFeature(geometry)`, you get a 
`LayerFeature` with a hook to `AddAttributesToLayerFeature` (next step).

---

### Step 2: Annotate each feature with identifying attributes

Override `AddAttributesToLayerFeature` to record everything the Styler needs—e.g. material index, material name, any
semantic tags.

!!!example

    ```csharp
    // MyCustomLayerGameObject.cs
    protected override LayerFeature AddAttributesToLayerFeature(LayerFeature feature)
    {
        // guard that the geometry is a material
        if (feature.Geometry is not Material mat) return feature;

        // perform a lookup of the material index
        int idx = mesh.DefaultMaterialList.IndexOf(mat);

        feature.Attributes.Add( 
            CartesianTileLayerStyler.MaterialIndexIdentifier, // key for the attribute, here shown as a const 
            idx.ToString() // record the material index as an identifier for this feature
        );
        feature.Attributes.Add(
            CartesianTileLayerStyler.MaterialNameIdentifier, // key for the attribute, here shown as a const
            mat.name // record the material name as a name for this feature
        );

        return feature;
    }
    ```

Expressions work by matching on feature attributes. This step encodes the minimal context your Styler will need. Please
note that LayerFeatures can also be used for other purposes, such as showing information in the information panels, thus
more attributes may be needed.

!!!tip Prefix your custom attributes

    If you add custom attributes on top of the source data -such as GeoJSON features- it is recommended to prefix these
    to prevent naming collisions. The prefix for custom attributes is generally `data-`, by default the styling system
    will also include `nl3d_layer_id` and `nl3d_layer_name`.

---

### Step 3: Implement `ApplyStyling` to invoke your Styler

Override `ApplyStyling` and, for each feature, request the resolved `Symbolizer` using the `GetStyling()` method and 
hand it off to your custom Styler class.

!!!example

    ```csharp
    // MyCustomLayerGameObject.cs
    public override void ApplyStyling()
    {
        foreach (var (_, feature) in LayerFeatures)
        {
            var styling = GetStyling(feature);
            MyCustomLayerStyler.Apply(layer, styling, feature);
        }

        base.ApplyStyling();
    }
    ```

Calling `base.ApplyStyling()` at the end ensures events fire for UI panels, property refreshes, etc.

---

### Step 4: Build your “Styler” helper

Encapsulate all expression-creation and object-manipulation logic in a static helper class (e.g. `MyCustomLayerStyler`).
This keeps your layer class clean and makes styling behavior discoverable.

#### Step 4a: Register and Retrieve Styling Rules

Before you can apply visuals, your Styler must expose methods to register new style rules and retrieve saved styles for
UI integration.

- **Registering**: create or update a `StylingRule` in `LayerData.DefaultStyle.StylingRules`. For example:
  ```csharp
  MyCustomLayerStyler.SetColor(layerGO, feature, Color.red);
  ```
  Internally, this creates an expression like `Get("data-materialindex") == "2"` and sets the rule’s FillColor.

- **Retrieving**: read back any existing override or fall back to the default material color:
  ```csharp
  Color? current = MyCustomLayerStyler.GetColor(layerGO, feature);
  ```

This separation ensures that style registration and UI display logic live in your Styler class, cleanly apart from
rendering.

#### Step 4b: Applying styling rules

To update any visuals, the Apply method must take the resolved `Symbolizer` — which encapsulates all style 
properties for a feature—and translate those into concrete modifications on your layer’s objects. 

This typically involves:

- Retrieving style attributes (e.g. fill color, opacity, line width) from the `Symbolizer`.
- Determining which visual element to target (by material index, component reference, or other attribute).
- Applying those properties directly to the Unity object (e.g. changing `Material.color`, adjusting mesh renderer 
  settings).

By centralizing this logic in `Apply`, you ensure that all style rules are consistently enforced whenever 
`ApplyStyling()` is called.

```csharp
// MyCustomLayerStyler.cs
public static class MyCustomLayerStyler
{
    // Declare keys for custom attributes to keep track
    public const string MaterialIndexIdentifier = "data-materialindex";

    // Applies the resolved style to the Unity objects
    public static void Apply(BinaryMeshLayer meshLayer, Symbolizer styling, LayerFeature feature) 
    {
        // Grab the fill color from the symbolizer
        Color? color = styling.GetFillColor();
        if (!color.HasValue) return;

        // Attempt to get the material index from the layer feature' attributes
        if (!int.TryParse(layerFeature.Attributes[MaterialIndexIdentifier], out var materialIndex)) return;

        // Apply the grabbed color to the given material
        layer.DefaultMaterialList[materialIndex].color = color.Value;
    }
}
```

---

### Verification

1. Enter Play Mode and open your custom layer’s property panel.
2. Define a new style rule (e.g. “material == 2 → color = red”).
3. Observe that only the intended feature(s) change color.
4. Save and reload the project — verify your rule is still applied.

---

### What’s next?

* Add support for line-width, opacity or other symbolizer properties.
* Expose a color-picker or style-preset dropdown in your layer’s UI.
* Document your Styler API so other developers can discover available expressions.
