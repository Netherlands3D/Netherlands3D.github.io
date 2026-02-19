# Creating a Custom Component

## Introduction

Unity's UI Toolkit allows you to build your own reusable UI components - known as Controls - that go beyond simple UXML
templates by including actual behaviour, much like components in React.js. 

You can create these controls either by starting in the UI Builder or by copying an existing component. When using the 
UI Builder, a few extra setup steps are required before the component is ready to publish. These are explained in their 
own guide on using UI Builder.

Also, when you want to use other custom controls inside the UI Builder, make sure to select them from the 
“Custom Controls (C#)” section in the Project panel, rather than from the UXML documents listed under 
“UI Documents (UXML)”, to ensure the correct version of the component is used.

---

## Overview

This guide consists of the following parts:

1. [Setting up a simple presentation component](#1-setup-a-simple-presentational-component)
2. Adding content (To be written)
3. Configuring a component using props (To be written)
4. Responding to events  (To be written)

Through this structure it is expected that you can either reference the specific section when you want to accomplish
one of these.

---

## 1. Setup a simple presentational component

This example shows how to create a minimal “Header” component that only manages its layout and styling.

---

### Make the component in C\#

Minimal implementation:

**File:** `Assets/UI Toolkit/Scripts/Components/Header.cs`

```csharp
using Netherlands3D.UI_Toolkit.Scripts;
using Netherlands3D.UI.ExtensionMethods;
using UnityEngine.UIElements;

namespace Netherlands3D.UI.Components
{
    [UxmlElement]
    public partial class Header : VisualElement
    {
        public Header()
        {
            this.CloneComponentTree("Components");
            this.AddComponentStylesheet("Components");
        }
    }
}
```

`CloneComponentTree` and `AddComponentStylesheet` automatically connect the UXML and USS files located in the
`Components` subfolder of the shared UI Resources directory.

They are Netherlands3D helper methods that:

- Centralize resource loading paths  
- Wrap Unity’s default API  
- Add small guardrails

---

### Make the layout template (UXML)

**File:** `Assets/UI Toolkit/Resources/UI/Components/Header.uxml`

```xml
<ui:UXML
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:ui="UnityEngine.UIElements"
    noNamespaceSchemaLocation="../../../../UIElementsSchema/UIElements.xsd"
    xmlns:nl3d="Netherlands3D.UI.Components"
    editor-extension-mode="False"
    class="header"
>
</ui:UXML>
```

!!! tip
    The `xmlns:nl3d` namespace lets you reference Netherlands3D components without writing their full C# namespace, this 
    is demonstrated below when we add a label and icon. 

---

### Make the styling (USS)

Example header bar: full‑width, automatic height, horizontal layout with spaced content.

**File:** `Assets/UI Toolkit/Resources/UI/Components/Header-style.uss`

```css
.header {
    /* Display contents horizontally (row) */
    flex-direction: row;

    /* Prevent this header from growing vertically */
    flex-grow: 0;

    /* Allow shrink‑to‑fit based on content */
    flex-shrink: 1;

    /* Spread child elements horizontally */
    justify-content: space-between;

    /* Use theme's white color */
    background-color: var(--color-white);
}
```

!!! warning
    **Filename must end with `-style.uss`.**  
    Unity may incorrectly pair a USS file with a UXML if their names differ only by extension.

---

## Best practices

- Use USS variables for colors, spacing, and text styles.  
  These are defined in: **`Assets/UI Toolkit/Resources/UI/_Theme.uss`**

