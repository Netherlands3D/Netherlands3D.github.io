# Quick Start Guide

!!! info

    This quickstart is aimed at developers who want to build on top of this platform, if all
    you want is to deploy it pre-configured on your platform, please read the guide on 
    deploying using Docker.

## Prerequisites

Netherlands3D is developed in Unity, thus you'll need few prerequisites to start with the platform:

1. Install Unity, the recommended version is Unity 2023 LTS, including the WebGL build options. Please check the Unity 
   Download Page -or Unity Hub- and the official Installation Guide for assistance.
2. Basic understanding of Unity and C# programming language.

## Getting Started

1. Firstly, clone the Netherlands3D/twin repository from GitHub:

    ```bash
    git clone https://github.com/Netherlands3D/twin.git
    ```

2. Once cloned, open the project in Unity. After the project has loaded, you can start tweaking and modifying the
   application as per your needs.

Do make sure that your build settings are set to build the project as a WebGL application, as several functionalities
are tailored to that platform.

## Recommendations

### Copy the Main scene

It's recommended to create a copy of the 'Main' scene before making any modifications. This ensures that you're not
directly altering the original scene which, as the project is in continuous development, can lead to conflicts.

To copy a scene in Unity:

* Select the 'Main' scene in the Project window.
* Press Ctrl+D or right-click and select 'Duplicate' from the context menu.

## Next Steps

With just these steps, you can immediately build and release your own customized Digital Twin; next up you can read up 
on what and how you can configure the platform without making any code changes.
