Welcome to the technical documentation for Netherlands3D, an advanced Digital Twin platform designed to visualize and
analyze geospatial data in a 3D environment. This documentation is intended for developers who want to understand how
the platform works, explore its architecture, and contribute new modules or functionalities.

!!! tip "Why English?"

    While the rest of this website and the user-facing documentation is provided in Dutch, in accordance with 
    government guidelines, the technical documentation is written in English. 

    This decision has been made to ensure a broad range of developers can contribute to Netherlands3D and to maintain 
    consistency with the platform's codebase, which uses English terms and concepts. By using English in the technical 
    documentation, we aim to make it easier for developers to map concepts between the documentation and the code 
    itself, facilitating a smoother development and contribution process.

## Overview

Netherlands3D is built on a modular architecture, allowing for extensibility. Developers can add, modify, or replace
individual modules without affecting the entire system. The platform integrates data from various
sources, such as 3D Tiles, the national georegister, and sensor information, to create an interactive and dynamic 3D
environment for spatial analysis and visualization.

This documentation will provide you with a detailed understanding of how the system operates under the hood, including
its component-based architecture, event-driven communication, and handling of secure data layers.

## Key Technologies

- **Unity3D**: The platform is developed using Unity, leveraging its robust rendering capabilities to display
  high-performance 3D models and large-scale datasets.
- **Scriptable Objects**: Used extensively to manage data, configuration, and communication between different modules
  and functionalities.
- **Event-Driven System**: Internal communication within modules is handled via UnityEvents, while inter-module
  interactions are driven by Scriptable Object Events, which allow asynchronous communication and keep the
  system decoupled.

This documentation will guide you through the internal workings of the platform, including detailed API references,
examples of module creation, and best practices for integrating new functionality.
