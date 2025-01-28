# Using Asset Bundles to add Objects to the Object Library

## Introduction

!!! example "This is an experimental feature"
    This feature is in an experimental stage and the guide below is subject to change. Use at your own peril.

Asset Bundles are an excellent way to extend the functionality of Netherlands3D by enabling developers to include
advanced or prebuilt assets, such as textured FBX files, that may not be feasible to load during the initial application
startup.

By utilizing Asset Bundles, you can significantly reduce the initial loading time of your application while providing
end users with access to complex assets on demand. This guide will walk you through how to build an Asset Bundle, load
it into your Netherlands3D project, and make the included assets available in the Object Library for your twin.

---

## Prerequisites

This feature is only available when using the [Netherlands3D "Twin" project](https://github.com/Netherlands3D/twin) as 
the basis for your digital twin viewer. The instructions in this guide assume that you are following the same directory 
structure and conventions as the "Twin" project. Ensure that your project setup aligns with these assumptions to avoid 
integration issues.

---

## Step 1: Creating a Layer Prefab

Before building an Asset Bundle, you need to create a prefab that can be registered as a Layer prefab. This prefab
serves as the entry point for your assets and will automatically be made available in the Object Library.

This can be accomplished by following our guide on 
[adding a simple type of layer](https://netherlands3d.eu/docs/developers/adding-a-simple-type-of-layer). Do remember 
the name of the asset file, as we will be using that in the last step.

---

## Step 2: Build an Asset Bundle

To create an Asset Bundle, follow these steps:

1. **Organize your assets, including the Layer Prefab:**

    - Place all the assets you wish to include in your Asset Bundle into the folder named `AssetBundleAssets` in the
      `Assets/_Functionalities/AssetBundles` folder within your Unity project.

2. **Assign assets to the Asset Bundle:**

    - Select each asset you wish to include and assign it to an Asset Bundle. This can be done in the **Inspector**
      window, under the **AssetBundle** dropdown menu. For more information, refer to
      the [Unity documentation](https://docs.unity3d.com/Manual/AssetBundles-Workflow.html).

3. **Build the Asset Bundle:**

    - Navigate to the Unity menu bar, select `Assets`, and then click `Build AssetBundles`.
    - Unity will compile your assets into a single Asset Bundle and place it in the `StreamingAssets` folder of your
      project.

!!! tip Rebuilding Asset Bundles
    If you make any changes to a prefab or asset included in an Asset Bundle, you must rebuild the Asset Bundle by
    repeating the steps above.

### Notes:

- Ensure that all assets included in the Asset Bundle are properly configured and optimized to avoid runtime issues.

- Assigning assets to an Asset Bundle is a critical step for ensuring they are included in the build.

- Keep your memory footprint as low as possible, and then even lower. WebGL applications are bound to a maximum of 2GBs 
  of RAM by the browser.

---

## Step 3. Registering your Asset Bundle with the Object Library

Once an asset bundle is available, you need to ensure the viewer know about it and registers the prefab -from step 1- as
an object in the _Object Library_. You can do this by creating a game object responsible for loading the Object from
the Asset bundle:

1. Create a new GameObject as a child of the `Functionalities` GameObject in the Hierarchy
2. Attach the `AssetBundleLoader` MonoBehaviour
3. Configure the Loading Screen Prefab and Canvas -recommended is to use the `AssetBundleLoader` prefab for the loader,
    and the `InterfaceUtilities` as the canvas.
4. Assign the name of your asset bundle to the `Bundle Name` field - this is the name you used in Step 2 when tagging 
    assets.
5. Assign the name of your Layer GameObject prefab's asset file -from Step 1- to the `Prefab Name` field, including the
    `.prefab` extension

That's it! When you load your application, you should find your new object in the Object Library.

---

## Common Issues and Solutions

Below are some common issues developers encounter when using Asset Bundles, along with their solutions:

1. Issue: Asset Bundle fails to load.

   - Solution: Check that the Asset Bundle file is placed in the correct location and that the file path in your script 
     is accurate.

2. Issue: Prefab is not found in the Asset Bundle.

   - Solution: Ensure that the prefab’s name matches the name used in the AssetBundleLoader prefab.

3. Issue: Changes to prefabs are not reflected.

   - Solution: Rebuild the Asset Bundle after making any changes to the included prefabs or assets.

4. Issue: Some assets are not visible or missing

   - Solution: Reimport the assets in the asset bundle folder, check if their Asset Bundle field is properly set and 
     rebuild the asset bundle.

5. Issue: The application crashes upon loading with a popup dialog.

   - Solution: make your assets smaller, your asset bundle pushes the memory usage of the application beyond 2GB of RAM
     and WebGL applications crash when that happens.