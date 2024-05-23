# Text Field

## Design

### Usage

"Text Fields" in the Netherlands3D platform allow users to input or modify text information. They can be used singularly
or in combination with other components like a [Slider](sliders.md) or Form Label in the
[Properties](../blocks/property-panel-and-sections.md) block. They're an essential part of Netherlands3D's user
interface, providing users with interactive fields to enter or manipulate various properties.

### Parts

The Text Field component comprises two main parts:

1. **Form Label**: The descriptive text associated with the Text Field, explaining what value is being manipulated. This
   is a reusable part and can be shared with other components like the [Slider](sliders.md).

2. **Form Field**: It serves as the component for user text input or changing text information. It is styled to account
   for different states like Idle, Focus, Pressing, and Read-Only.

### Anatomy

!!! note

    Add an image to showcase the anatomy of a form field and elaborate some more on this in the text

1. **Form Label**: Positioned above or adjacent to the Form Field, providing a textual description of the information
   required or displayed.

2. **Form Field**: The interactive text input area where users can enter or modify data. It transitions between various
   states (Idle, Focus, Pressed, Read-only) to visually communicate its current mode of interaction.

### Design Principles

* **Clarity**: Labels are clear and informative, ensuring users understand what information is required.

* **Feedback**: Built-in states (Idle, Focused, Pressed, and Read-Only) provide immediate visual feedback to users,
  aiding an interactive experience.

## Implementation

The Text Field is modeled using Unity prefabs and scripting, offering dynamic interaction within the user interface,
allowing for adaptive properties adjustment based on user input.

### Adding a Text Field to Your Scene

* Prefab Placement: Locate the Text Field prefab in the project's asset directory. Drag and drop the prefab into your
  scene where you need the Text Field component to appear.

### Configuring the Text Field

You can utilize the Unity Editor to add listener functions that get triggered on text value change events, enabling you
to manipulate and use the user-input text as per application needs.
