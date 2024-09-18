# Functionalities

At the core of Netherlands3D, various functionalities serve as building blocks. Each functionality represents a distinct
element or feature of the platform, designed to perform specific tasks.
These functionalities are modular, meaning they can be enabled or disabled individually based on user requirements or
the needs of a particular project.

This ability to toggle functionalities on and off ensures that you have control over the features you want to deploy in
your project.

## Configuring Functionalities

Furthermore, each functionality can be individually configured according to specific project requirements. Read more
about this in detail in the chapter about [configuration](configuration.md).

Through additional configuration settings, you have the flexibility to adjust the functionality's behavior and
characteristics to match your project's needs. You'll have access to a broad range of settings allowing you to refine
each element of your project in detail.

To give some context to the above: examples of additional configuration options are API keys, URLs of services,
default values for new projects and more.

## How does it work

In Unity's context for the Netherlands3D platform, each functionality is encapsulated in a ScriptableObject. Exploring
further, you'll discover that each ScriptableObject is highly configurable, granting you the ability to tailor it to
satisfy specific demands.

### Key Components

#### ScriptableObjects

The ScriptableObjects for the functionalities can be located in the `Scriptables/Functionalities` folder. Each
ScriptableObject represents a distinct functionality in the application, and can be configured to define its behavior
and properties within the application.

#### Functionality System

The code powering the functionality system is hosted within the embedded package named
`eu.netherlands3d.eu.twin-functionalities`. Digging into this package reveals the design and implementation of
the system that manages and orchestrates the functionalities.

#### The Functionality Script

At the core, the Functionality script exists as a foundational unit for the ScriptableObject. Here is where you define
key attributes such as its title, description, ID, and any additional configuration. This script performs the following
roles:

1. **Title and Description**: The title and description fields of the ScriptableObject are primarily designed for your
reference in the settings screen of the application.

2. **Functionality ID**: The ID (or code) is used to refer to the functionality from the configuration file. This ID attribute
is instrumental in organizing and managing configurations of functionalities within the system robustly.

3. **Enabled State**: The enabled state of the functionality indicates whether it's active or inactive. The system can query
this status to determine the functionality's availability and act accordingly in any part of the application.

4. **Additional Configuration**: The ScriptableObject also includes an additional configuration section where you can define
supplementary settings and properties that control its behavior within your application.
