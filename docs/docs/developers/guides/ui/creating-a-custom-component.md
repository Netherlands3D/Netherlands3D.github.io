# Creating a Custom Control

## Introduction

Unity's UI Toolkit allows you to build your own reusable UI controls - known as Controls - that go beyond simple UXML
templates by including actual behaviour, much like controls in React.js. 

You can create these controls either by starting in the UI Builder or by copying an existing control. When using the 
UI Builder, a few extra setup steps are required before the control is ready to publish. These are explained in their 
own guide on using UI Builder.

Also, when you want to use other custom controls inside the UI Builder, make sure to select them from the 
“Custom Controls (C#)” section in the Project panel, rather than from the UXML documents listed under 
“UI Documents (UXML)”, to ensure the correct version of the control is used.

---

## Goal

This guide consists of the following parts:

1. [Setting up a simple presentation control](#1-setup-a-simple-presentational-control)
2. [Adding content](#2-adding-content)
3. Configuring a control using props (To be written)
4. Responding to events  (To be written)

Through this structure it is expected that you can either reference the specific section when you want to accomplish
one of these.

In the end, we want to end up with a control that looks like this:

```xml
<nl3d:Header label="My header text" help-url="https://netherlands3d.eu/docs/my-help-topic" />
```

---

## Prerequisites

* You have a basic understanding of UI Toolkit, especially the roles of the UXML and USS files, and recognize at least
  terms like "attribute", "element", "class", "selector" and others denoting important parts.
  * It is recommended to watch [this YouTube playlist](https://www.youtube.com/watch?v=0mYtI21Fmg4&list=PLgCVPIIZ3xL_FVLhDrC3atsy8CiZzAMh6)
* Familiarity with how HTML and CSS works is helpful
* Familiarity with React.js' Components is helpful

---

## 1. Setup a simple presentational control

This example shows how to create a minimal “Header” control that has layout and minimal styling.

A Component always consists of three parts:

1. The Component's logic as a C# class extending the `VisualElement` class of Unity
2. The UI's layout as UXML - this is similar to how HTML works on web.
3. The styling declaration as USS - this is similar to how CSS works on web.

The layout and styling are static declarations that together form the presentation of the control, where the C# code
provide behaviour and integration points for the control.

---

### Make the control in C\#

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
    <!-- We will add content here later -->
</ui:UXML>
```

Do note the `class` attribute with the value  `header` on the UXML tag. The class `header` will be used in the 
stylesheet to apply styling to this element.

!!! tip
    The `xmlns:nl3d` namespace lets you reference Netherlands3D controls without writing their full C# namespace, this 
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

    /* Add padding for some whitespace, spacing-2 is half the reference size of 16px - thus 8px */
    padding: var(--spacing-2);
}
```

!!! warning
    **USS filenames for Custom Controls must end with `-style.uss`.**  
    Unity may get confused if a USS file and a UXML their names differ only by extension.

In the code above, it is stated that any element with the class `header` (see the chapter on 
[making the template](#make-the-layout-template-uxml) where this is introduced in your layout) will 

- have a fixed background color that matches the white color of the theme using a [USS variable](https://docs.unity3d.com/6000.3/Documentation/Manual/UIE-USS-CustomProperties.html).
- will have its child elements layed out in a row -horizontally- and ensures the whole width is used by spacing child
  elements
- It will allow the containing element to shrink the element's height to match the contents of this element 
  (`flex-shrink`) and prevents this element from growing to match the containers desired height (`flex-grow`).  

---

## 2. Adding Content

For our header, let's assume it should have 

1. a label on the left, and 
2. a help icon button on the right.

In the [chapter where we made the template](#make-the-layout-template-uxml) we left off with the following template 
file:

```xml
<ui:UXML
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:ui="UnityEngine.UIElements"
    noNamespaceSchemaLocation="../../../../UIElementsSchema/UIElements.xsd"
    xmlns:nl3d="Netherlands3D.UI.Components"
    editor-extension-mode="False"
    class="header"
>
    <!-- We will add content here later -->
</ui:UXML>
```

Let's expand on that.

### 2.1. Adding a label

Unity has a label control that does nothing more than display text. This sounds like a perfect candidate for our
header's label.

It looks like this:

```xml
<ui:Label name="..." class="..." text="Default text" />
```

Two important attributes here are `name` and `class`. 

- The `name` should be a unique name for that element within your control, but you can also omit if it is not needed. 
- The `class` attribute is used for styling (see [the earlier chapter on styling](#make-the-styling-uss)) and that will 
  be used to make sure the label will have the right look and feel for this control.

Let's omit the `name` for now, and add a `class` named `header-label`.

!!! important
    Because class names are global for the whole application, it is **required** to make sure each class specific to 
    a control is prefixed with the name of that control, then a hyphen and the role it plays - or class - in this 
    control.

Our contents now look like this:

```xml
<ui:Label class="header-title" text="Default text" />
```

Let's add it into our template:

```xml
<ui:UXML
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:ui="UnityEngine.UIElements"
    noNamespaceSchemaLocation="../../../../UIElementsSchema/UIElements.xsd"
    xmlns:nl3d="Netherlands3D.UI.Components"
    editor-extension-mode="False"
    class="header"
>
    <!-- Here comes the label - as a child of the UXML element. -->
    <!-- Note that we removed the text as well, we are going to set that 
         using the control's logic -->
    <ui:Label class="header-title" />
</ui:UXML>
```

This is a good first step, but next: let's style it and set the label text using an attribute on our header. 

### 2.2.  Styling the header's label

In the [chapter where we setup our styling](#make-the-styling-uss), we introduced the style for the header itself. Now
we need to add a bit of styling to make sure the header's title has the correct text size.

The header already has all the basic styling needed to position the title correctly, so we can focus on the title 
itself. 

```css
.header-title {
    -unity-font-style: bold;
    font-size: var(--font-size-xl);
}
```

> _See [https://docs.unity3d.com/6000.3/Documentation/Manual/UIB-styling-ui-text.html](https://docs.unity3d.com/6000.3/Documentation/Manual/UIB-styling-ui-text.html) for the Unity information on styling text._

Again, we use [USS variables](https://docs.unity3d.com/6000.3/Documentation/Manual/UIE-USS-CustomProperties.html) to
say: this text should be extra-large! By using these variables we can easily change the theme later on, or provide
variants for accessibility.

---

## Best practices

- Use [USS variables](https://docs.unity3d.com/6000.3/Documentation/Manual/UIE-USS-CustomProperties.html) for colors, 
  spacing, and text styles. These are defined in: **`Assets/UI Toolkit/Resources/UI/_Theme.uss`**
- Do not use magic numbers, especially for spacing. Check the theme for a list of available variables.
