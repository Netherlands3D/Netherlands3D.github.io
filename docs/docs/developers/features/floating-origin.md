Working with large distances (Floating Origin)
==============================================

The Floating Origin system allows you to navigate the entire world without encountering floating-point precision errors.
Instead of letting the camera roam infinitely far from the unity origin (0, 0, 0), it keeps the camera near the center 
by shifting the entire world when needed:

* When the camera moves more than 5 kilometers away from (0, 0, 0), the system shifts all GameObjects so that the camera
  is back near the origin.

* This shift is invisible to the user—everything appears stable, while in reality, the whole scene has been 
  repositioned.

* Each object stores its real-world coordinates separately, and the Floating Origin itself also tracks its own 
  real-world position, enabling accurate placement at all times.

> Analogy: Imagine sliding the world underneath you in 5 km steps as you move, instead of moving the camera through the
  world.

## Overview of the Floating Origin System

Before the deep-dive into the components of the Floating Origin system, a basic understanding of the concepts in this 
system is required: 

### Real world coordinates and Unity positions

In Unity, the transform component is responsible for tracking the position relative to Unity's (0,0,0) origin point, 
when working with large worlds -such as our real-world- this system no longer works due to floating point precision 
errors. To solve this, a second mechanic for tracking positions is introduced using real world coordinates in 
the WGS84 lat/long ECEF coordinate system.

As the distances expressed by real world coordinates are greater than Unity's floating point based transforms, it is 
needed to track the real world coordinate of the (0,0,0) origin -called the Floating Origin- and the coordinates 
of _real world objects_.

When the camera moves thus far away from the Floating Origin that floating point issues may occur, the origin will 
change its real-world coordinate to be nearer to the camera's real-world coordinate and shift the Unity position of all
real-world objects to match the new real-world coordinate of Unity's (0,0,0) origin.

### (Floating) Origin

The Origin represents the real world coordinates of Unity's (0,0,0) origin and is responsible for tracking the distance 
of the Camera from Unity's (0,0,0) origin. If the Camera moves too far away, rendering and calculation anomalies can 
happen due to floating point precision issues and all real world objects -including the origin's own real-world 
coordinates- need to be shifted so that all elements are back into a safe distance in Unity's coordinate system.

### Shifting

Shifting is the term for when real world objects need to have their Unity position adjusted to get closer to the 
Floating Origin. Because the origin's Unity position never changes -it is always at 0,0,0- but its real-world coordinate
can change, we need to respond to that by moving real-world objects' Unity position. As soon as this happened, all Game 
Objects should be within a safe distance from 0,0,0 again.

### Real-world objects

Real-world objects -sometimes referred to as spatial objects- are game objects whose location is tied to the real-world
and have a location in the real world. An example may be a windmill, where a UI element is an example of something that 
is not.

Real-world objects have a _World Transform_ component that tracks the real-world position and orientation of the object 
and when a shift is emitted, they will reposition themselves or its parts.

### World Transform

The World Transform tracks the real-world position and orientation for a real-world object. The World Transform also
reacts to the Origin calling for a shift, but delegates the actual work to a World Transform Shifter component. This
allows for objects to respond to shifts differently.

### World Transform Shifter

The World Transform Shifter is the component that handles the shifting of a Game Object. Usually you do not need to 
provide a specific World Transform Shifter with a World Transform, in that case the default 
GameObjectWorldTransformShifter is used. 

## Origin

In the Floating Origin System, the Origin is an important concept referring to the focal point within the Unity game
world. It is crucial for large scale projects where precision becomes a challenge.

The Origin is typically associated with its own separate GameObject. This GameObject serves as an indicator or marker of
the origin point, and doesn't have any visual representation in the game environment. Its primary role is to maintain
the game world's central point and handle shifts in that point to ensure accuracy and consistency in objects' locations
in the world.

To use the Origin, create an empty GameObject in your scene. This empty GameObject often doesn't need any other
components besides Origin. Then, attach the Origin script to this GameObject. Now, the Origin GameObject will
continually monitor its distance from the camera (or a specified mainShifter object) while playing.

### Performance Optimizations in Origin

Understanding and managing performance is key in any system, and the Floating Origin System includes several performance
optimizations to ensure efficient operation.

#### Using sqrMagnitude Instead of Magnitude

The process of calculating distance often involves the operation of square roots, which introduce computational
complexity. In the Floating Origin System, we use Unity's built-in sqrMagnitude method instead of magnitude for distance
calculations.

The sqrMagnitude method calculates the square of the magnitude of a distance vector, which omits the need for a square
root operation. Since the Origin uses a squared threshold for determining shifting necessity, this optimization aligns
perfectly. Simply put, both the mainShifter's distance and the threshold are squared values, so no square root operation
is needed, resulting in improved performance without comprising correct operation.

#### Using a Coroutine to Wait Until the End of Frame

The Floating Origin System uses Unity's Coroutine feature to postpone the shifting evaluation to the end of each frame.
The shifting operation checks at the end of the frame if it needs to reposition the Origin based on the final position
of the mainShifter.

This optimization minimizes unnecessary Origin shifting, as multiple changes to the mainShifter position within a single
frame will only trigger the shifting operation once at the end of the frame. This approach effectively reduces
computational load by minimizing the frequency of costly shifting operations.

### The Origin triggers the shifts

The Origin in the Floating Origin System demonstrates an example of encapsulation, a fundamental principle of
object-oriented programming. Instead of distributing responsibilities across multiple components (like making the camera
responsible for calculating distances and triggering shifts), the Floating Origin System centralizes these
responsibilities within the Origin.

**Encapsulating Responsibilities**

The Origin is responsible for continually monitoring its distance from the camera (or another defined mainShifter
object). Using a pre-determined threshold, the Origin decides when the shift operation needs to occur. Once that
threshold is surpassed, the Origin triggers a shift operation to reestablish itself closer to the camera or mainShifter.
This design decision encapsulates the behavior within the Origin, making it a standalone component that can
independently determine and respond to shifts.

**Performance and Design Improvements**

The encapsulation model presents several advantages:

- **Performance**: By monitoring the mainShifter's distance at the end of each frame and shifting only when necessary,
  the Origin can optimize performance and reduce unnecessary shifts, irrespective of how many changes occur to the
  mainShifter during the frame.
 
- **Design Simplicity**: Having the Origin act as the central point of control simplifies task delegation amongst
  components and makes the overall system easier to understand.
 
- **Encapsulation**: By keeping related functions within the Origin, the design favors encapsulation, ensuring a clean
  system where components' responsibilities are clearly defined and do not blend.

## WorldTransform

!!! info inline end "An analogy: transforms and rigidbodies"

    To illustrate how the WorldTransform and their Shifters work, you can compare them to the way Transform and RigidBodies
    work in Unity. The Transform holds the position, rotation and scale and can be manipulated; but the actual physics 
    interaction -movement forced by external factors- is accomplished through a RigidBody component, or even a 
    CharacterController.

    In Unity, you have one transform and one type of RigidBody/Character Controller; and with the WorldTransform this
    works similarly: the WorldTransform works like a Transform and records the position of the real-world object, where a 
    WorldTransformShifter functions like a RigidBody and exerts force on the WorldTransform when a Shift happens. 

The WorldTransform is effectively the real-world equivalent of an object's location within the Unity game world. When
the Origin shifts, the WorldTransform is adjusted correspondingly. Meanwhile, Unity's native Transform class remains
untouched. This results in two interconnected, but separate, coordinate systems.

Not all objects will need to handle a shift in the same way. The default is to shift the GameObject itself, but some
objects are containers whose children need to shift and not themselves -example: tile handlers- or where transformation
matrices are used instead of transform components -example: instanced objects-. By delegating this responsibility to
a _World Transform Shifter_ all real-world objects will track their coordinates in the same way but have different ways
to react to shift events.

## WorldTransformShifter

The WorldTransformShifter is meant to manage the effects of moving the Origin on GameObjects. Custom behaviors for 
different types of GameObjects when the Origin shifts can be defined by implementing the method ShiftTo in derived 
classes of WorldTransformShifter.

When it is not the GameObject itself whose position needs to change but a child or something not directly linked to the 
transform position, then you need to use one of the other strategies. See below for more information.

!!! tip

     The WorldTransform and its Shifters is an implementation of the [Strategy design pattern](https://refactoring.guru/design-patterns/strategy).

### Specialized Shifters

Specialized Shifters are used to manage Origin shifts for unique types of GameObjects not part of the Unity base
package. These could be packages like Netherlands3D 3DTiles that have their unique behaviors.
An example of this is ThreeDTilesWorldTransformShifter. This sub-class handles shifts for child GameObjects associated
with the Content component. When an Origin shift happens, it iterates over all Content components and adjusts the
positions of all their children.

## Usage

To use the Floating Origin System within your Unity projects:

1. Attach the Origin component to a GameObject that will act as the world origin.
2. For objects that should maintain real-world positions, attach the WorldTransform component.
3. For specialized objects, for example, objects from the Netherlands3D 3DTiles package, attach a specialized
   WorldTransformShifter, like ThreeDTilesWorldTransformShifter.

