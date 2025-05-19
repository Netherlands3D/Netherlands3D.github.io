
# Quick Start Guide

!!! info

    This quickstart is aimed at developers who want to build on top of this platform.  
    If all you want is to deploy it pre-configured on your platform, please read the guide on 
    deploying using Docker.

## Prerequisites

Netherlands3D is developed in Unity, thus you'll need a few prerequisites to get started:

1. Install Unity. The recommended version is **Unity 6000.0.44f1**, including the WebGL build options.  
   Please check the Unity Download Page or Unity Hub, and refer to the official Installation Guide for assistance.
2. Basic understanding of Unity and the C# programming language.

## Getting Started

1. We use Git LFS for storing large files.  
   For Windows users, it's included in Git for Windows.  
   For macOS users, install it via Homebrew:

    ```bash
    brew install git-lfs
    git lfs install
    ```

2. Clone the Netherlands3D/twin repository from GitHub:

    ```bash
    git clone https://github.com/Netherlands3D/twin.git
    ```

3. Once cloned, open the project in Unity.

4. Now, go to **File > Build Profiles**, select **WebGL** from Platforms, and click **Switch Platform**.

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




## Development on macOS

> ⚠️ **Note:** Microsoft ended support for Visual Studio for Mac on **August 31, 2024**. The final version (17.6) is now considered a legacy installation.

### Recommended Development Options on macOS

If you're working on macOS with Unity and C#, we recommend one of the following setups:

- **Visual Studio Code** with the [C# Dev Kit](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit) and Unity extensions  
  → Lightweight, free, and actively maintained.

- **JetBrains Rider**  
  → A commercial IDE with excellent Unity and C# support. Subscription required.

- **Visual Studio on Windows**  
  → Can be run via a virtual machine or through [Microsoft Dev Box](https://azure.microsoft.com/en-us/products/dev-box) (cloud-based).

Currently, **Visual Studio Code with extensions** is the most accessible and supported solution for Unity development on macOS.

### Configuring Visual Studio Code

Add the following to `.vscode/settings.json` in your project folder:

```json
{
  "dotnet.defaultSolution": "twin.sln",
  "search.exclude": {
    "**/Library": false
  },
  "files.exclude": {
    "**/Library": false
  },
  "search.useIgnoreFiles": false
}
```

#### Explanation of Settings

- `search.exclude`: ensures the `Library` folder is included in searches.
- `files.exclude`: makes the `Library` folder visible in the file explorer.
- `search.useIgnoreFiles`: disables ignoring files listed in `.gitignore` or `.ignore`.

### IntelliSense & .NET Roslyn

IntelliSense is powered by **.NET Roslyn**, which is activated via the **C# Dev Kit** extension, so make sure you have it installed.

To verify if .NET is installed:

```bash
dotnet --version
```

Roslyn is Microsoft’s official C# compiler and analyzer. It:

- Parses `.csproj` files
- Resolves references
- Builds syntax trees
- Indexes all symbols and types for IntelliSense

If everything is configured correctly, you should be able to use **Find in Files** and get full IntelliSense support.