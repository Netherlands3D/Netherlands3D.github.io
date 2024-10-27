This guide will focus on adding functional behavior to a layer using persisted data. It will provide the structure for a
headless approach to layer properties, enabling custom layer behavior without exposing settings to the end user.

Properties in this platform are modular, making it possible to attach reusable “property sections” to a layer rather 
than defining specific fields. This modular approach allows data persistence when saving and reloading projects, with 
Netherlands3D managing persistence automatically.

This guide builds on the previous steps for creating a simple layer type. Here, we'll add properties that are stored 
within the layer’s data but without displaying them in the properties panel UI.

[//]: # ( TODO "Add an infographic showing a layer with multiple behaviours that each have properties")

!!! info "About the examples"

    The code examples are meant to show a simple scenario where you have a layer with 2 cubes and where we add behaviour
    for users to change the colour randomly by clicking on a cube, and where that colour is persisted between sessions.
    It is expected that for your own use-case you can adapt these examples to suit your situation.


### Step 1: Create a Controller Script with `ILayerWithPropertyData`

Begin by creating a `MonoBehaviour` script to encapsulate behaviour for your layer. This behaviour script will handle 
the interactions with your property data. To start, implement the `ILayerWithPropertyData` interface in the script. 
This interface includes a `LoadProperties` method, which we’ll define in a later step. For now, leave the 
`LoadProperties` method empty, focusing on setting up the controller structure.

_The code:_

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using Netherlands3D.Twin.Layers;
using Netherlands3D.Twin.Layers.Properties;
using UnityEngine;

[RequireComponent(typeof(LayerGameObject))]
public class TwoCubesColorChangingBehaviour : MonoBehaviour, ILayerWithPropertyData
{
    private LayerPropertyData propertyData;
    public LayerPropertyData PropertyData => propertyData;

    public void LoadProperties(List<LayerPropertyData> properties)
    {
    }

    // implement the on click behaviour that will randomly change the 
    // color on one of the cubes; this is omitted for brevity
}
```

In subsequent code samples some parts will be omitted for brevity -such as the import statements-.

### Step 2: Define a Property Data Class

Next, create a dedicated class to represent the data fields you want to persist. This class should extend the
`LayerPropertyData` superclass, which provides a foundation for layer properties. By extending `LayerPropertyData`, this
class becomes capable of being serialized and deserialized by [JSON.net](https://www.newtonsoft.com/json), which 
Netherlands3D uses to store and retrieve data within `.nl3d` project files. 

The data fields in this class should only represent state, with no embedded business logic, ensuring data integrity and 
predictability.

_The code:_

```csharp
using System.Runtime.Serialization;
using Newtonsoft.Json;
using UnityEngine.Events;

public class TwoCubesColorPropertyData : LayerPropertyData
{
    // We will be adding fields in the next step
}

```

###  Step 3: Add Fields to the Property Data Class

Now, add the fields to the property data class that you want to persist. For serialization and future compatibility, use
a `DataContract` annotation on the class. This annotation should include a `Namespace` attribute, typically a URI 
associated with your organization, to uniquely identify the origin of the class. In addition, a `Name` attribute provides 
a clear, recognizable identifier for this data type.

When defining fields, it is encouraged to use a `UnityEvent` alongside a C# property to trigger an event whenever a 
property changes. This approach will allow the behaviour script to detect changes in state through events, making the 
class versatile and responsive.

_The code:_

```csharp
...

[DataContract(Namespace = "https://example.org/schemas/my-nl3d-project", Name = "TwoCubesColor")]
public class TwoCubesColorPropertyData : LayerPropertyData
{
    [DataMember] private Color cube1Color = Color.white;
    [DataMember] private Color cube2Color = Color.red;
    
    [JsonIgnore] public readonly UnityEvent<Color> Cube1ColorChanged = new();
    [JsonIgnore] public readonly UnityEvent<Color> Cube2ColorChanged = new();
    
    [JsonIgnore]
    public float Cube1Color
    {
        get => cube1Color;
        set
        {
            cube1Color = value;
            Cube1ColorChanged.Invoke(cube1Color);
        }
    }

    [JsonIgnore]
    public float Cube2Color
    {
        get => cube2Color;
        set
        {
            cube2Color = value;
            Cube2ColorChanged.Invoke(cube2Color);
        }
    }
}

```

### Step 4: Wiring the Controller Script to the Property Data

With your property data class in place, return to the controller script and establish the connection between it and your
properties. Start by creating a private field in the controller script, using the property data class you defined in
Step 2. Next, set the controller's `PropertyData` getter to retrieve data from this field. Finally, implement the
`LoadProperties` method by populating it with the necessary code to retrieve the correct `LayerPropertyData` object from 
the layer at load time.

!!! tip "Each controller can contain only one LayerPropertyData instance." 

    This ensures the controller is dedicated to a single cohesive set of properties and promotes modularity, allowing 
    the controller to be reused across different layers without modification. For more information, see the explanation
    section on layers and properties.

_The code:_

```csharp
[RequireComponent(typeof(LayerGameObject))]
public class TwoCubesColorChangingBehaviour : MonoBehaviour, ILayerWithPropertyData
{
    // Note this change -> We have replaced the generic LayerPropertyData with TwoCubesColorPropertyData
    private TwoCubesColorPropertyData  propertyData;
    public LayerPropertyData PropertyData => propertyData;

    private void Start()
    {
        // Initialise the behaviour with properties from the propertyData - this will trigger upon loading a new project
        OnCube1ColorChanged(propertyData.Cube1Color);
        OnCube2ColorChanged(propertyData.Cube2Color);
    }
    
    public void LoadProperties(List<LayerPropertyData> properties)
    {
        // Find the property data for this behaviour in the list of properties belonging to its parent layer
        var properties = properties.OfType<TwoCubesColorPropertyData>().FirstOrDefault();
        
        // if we found something, use that
        if (properties != null)
        {
            propertyData = properties;
        }

        // if nothing is provided, or propertyData is otherwise null; make sure we have a default 
        propertyData ??= new();

        // Add the listeners to allow this behaviour to respond to change in its state
        propertyData.Cube1ColorChanged.AddListener(OnCube1ColorChanged);
        propertyData.Cube2ColorChanged.AddListener(OnCube2ColorChanged);
    }
    
    private void OnCube1ColorChanged(Color colour)
    {
        // Implement the logic to apply this color to cube 1
    }

    private void OnCube2ColorChanged(Color colour)
    {
        // Implement the logic to apply this color to cube 2
    }

    private void OnDestroy()
    {
        propertyData.Cube1ColorChanged.RemoveListener(OnCube1ColorChanged);
        propertyData.Cube2ColorChanged.RemoveListener(OnCube2ColorChanged);
    }
}
```

### Step 5: Add the New Behavior to the Layer Prefab

To integrate your new persistent behavior with the layer, attach the behaviour script to the prefab for your layer.
By adding the behaviour script, you enable the layer to utilize the persisted properties, allowing it to execute 
specific behaviours based on saved data.
