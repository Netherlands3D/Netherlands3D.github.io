# Quick Start Guide

!!! info

    This quickstart is aimed at developers who want to build on top of this platform, if all
    you want is to deploy it pre-configured on your platform, please read the guide on 
    deploying using Docker.

## Prerequisites

Netherlands3D is developed in Unity, thus you'll need few prerequisites to start with the platform:

1. Install Unity, the recommended version is Unity 6 (6000.0.58f2), including the WebGL build options. Please check 
   the Unity Download Page -or Unity Hub- and the official Installation Guide for assistance.
2. Basic understanding of Unity and C# programming language.

## Getting Started

1. We use Git LFS for storing large files. For Windows users, this is included in Git for Windows, while Mac users need to do the following:
    
    ```bash
    brew install git-lfs
    git lfs install
    ```
    
2. Clone the Netherlands3D/twin repository from GitHub:

    !!! warning
        The projects contains long paths, make sure you clone in a folder that is not too deeply nested - see 
        [https://learn.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=registry](https://learn.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=registry) 
        for more information.

    ```bash
    git clone https://github.com/Netherlands3D/twin.git
    ```

3. Once cloned, open the project in Unity. 

4. Now, go to the File menu, then select Build Settings. In the Build Settings window, choose WebGL and click Switch Platform.

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
