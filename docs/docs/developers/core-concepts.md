Whether you are plotting sensor telemetry, planning new building projects, or mapping underground utilities like cables
and pipes, Netherlands3D offers a versatile environment to bring your spatial data to life. This page introduces the key
concepts behind the platform, providing a foundation for understanding how the application is structured and how you can
leverage it for your projects.

## Projects: The Canvas of Your Work

In Netherlands3D, everything you interact with on the screen is part of a **Project**. A project encompasses all the data
layers, styles, and configurations that define your current view and can be saved or loaded as needed. Think of a
project as a snapshot of your work, capturing everything from the base map to the overlaid datasets, and allowing you to
revisit or share your work with others seamlessly.

## Layers: The Foundation of Visualization

In Netherlands3D, **Layers** are the fundamental components that bring spatial data to life on the map. Each layer
represents a specific dataset, determining not only what data is visualized but also how it appears. 

_While Rasterlayers and Vectorlayers are the primary types, there are also additional supporting layers like folders and 
scenarios that help organize your project. However, the focus of this chapter will be on understanding the two main 
types of layers and the nature of the datasets they contain._

### Understanding Datasets: Tiled vs. Fixed

Before diving into the specifics of Raster and Vector layers, it's important to understand the concept of how datasets
are handled: **Tiled** versus **Fixed**.

- **Tiled Datasets**: Tiling is a method used to optimize the performance of large datasets by breaking them down into
smaller, more manageable pieces called tiles. These tiles are loaded dynamically as needed, which is especially useful
when working with high-resolution data or when users need to navigate large geographical areas. Tiled datasets ensure
that only the necessary portions of data are loaded at any given time, reducing memory usage and enhancing performance.

- **Fixed Datasets**: In contrast, fixed datasets are loaded in their entirety at once. This approach can be beneficial 
  when working with smaller datasets or when it's crucial to have immediate access to all the data without waiting for 
  it to stream. However, this method can be more demanding on system resources, particularly for large or complex 
  datasets.

The choice between tiled and fixed datasets affects how the data is visualized and interacted with in Netherlands3D.
Whether a dataset is continuous (like elevation data) or discrete (like building footprints), it can be managed using
either a tiled or fixed approach.

### Rasterlayers: Visualizing Continuous Data

**Rasterlayers** are used to display continuous data across a geographic area, such as heatmaps, terrain models, or
aerial images. These layers are ideal for visualizing information that smoothly varies over space, like temperature
changes across a city or elevation in a landscape.

In Netherlands3D, Rasterlayers are powerful for showing broad, sweeping patterns in your data. For example, if you want
to understand how pollution levels vary across a region, a Rasterlayer can provide a clear, visual representation of
these gradients.

### Vectorlayers: Representing Discrete Data

**Vectorlayers** are used to map specific features like buildings, roads, utilities, or zones. Each feature is
represented by points, lines, or polygons, and comes with attributes that describe it —such as the height of a building
or the type of road.

Vectorlayers are essential for projects that require precise and detailed mapping. For instance, when planning new
infrastructure, you can use Vectorlayers to map out exactly where new roads or pipelines will go. Each feature can be
styled differently based on its attributes, making it easy to distinguish between different types of data.

## Features: The Building Blocks of Layers

In Netherlands3D, **Features** are the individual elements that make up a Vectorlayer and can also be present in certain
modern Rasterlayers. A feature represents a distinct geographical entity, such as a building, road, or zone, and can be
styled and visualized according to your project’s needs.

Understanding features is crucial because they are the entities you interact with and analyze within a layer. 
Whether you are drawing a map of utilities, defining zoning regulations, or visualizing sensor data, you are 
essentially working with features. 

The ability to style and categorize these features, especially within the context of both vector and
hybrid raster layers, provides the flexibility to create detailed, informative, and visually compelling maps.

### Features in Vectorlayers

For Vectorlayers, features are the fundamental units. Each feature within a Vectorlayer has a specific geometry (point,
line, or polygon) and is tied to a set of attributes that describe its properties. For example, a Vectorlayer
representing buildings might have features corresponding to individual buildings, with attributes detailing their
height, function, or construction material. These features can be styled in various ways using the platform's styling
options, allowing you to differentiate between types of buildings, emphasize certain zones, or highlight critical
infrastructure.

### Features in Rasterlayers: The Hybrid Approach

Traditionally, Rasterlayers—such as overlay images or heatmaps—do not contain discrete features. They represent
continuous data spread across a grid, where each cell or pixel has a value but is not individually distinguished as a
feature. However, with advances in 3D mapping technology, a new hybrid approach has emerged.

In this modern method, certain Rasterlayers, especially those involving 3D meshes, may incorporate features. For
example, a 3D terrain mesh (which is typically raster data) can have specific parts of the mesh categorized as features.
These features within a Rasterlayer might represent distinct geographical areas, such as regions of interest or zones
within a city, and can be individually styled and interacted with, similar to features in Vectorlayers. This blending of
raster and vector data allows for a more nuanced and detailed representation of the environment, offering new
possibilities for visualizing and analyzing spatial data.

## Styles: Bringing Data to Life

While layers define what data is displayed and where, Styles (or Symbology) determine how that data is visualized.
Styles control the visual appearance of layers, including colors, line thickness, transparency, and more. Similar to how
CSS styles HTML in web development, styles in Netherlands3D customize the visual representation of your spatial data.
Whether you want to highlight certain areas, differentiate between types of infrastructure, or simply make your map more
visually appealing, styles give you the flexibility to achieve your desired look and feel.

## Conclusion

Understanding these core concepts —Projects, Layers, Rasterlayers, Vectorlayers, Features, Styles, and the distinction
between Tiled and Fixed datasets— is crucial for effectively using Netherlands3D. These elements form the backbone of the
platform, allowing you to create, visualize, and interact with spatial data in a way that meets your project needs. As
you dive deeper into the application, these concepts will guide you in organizing your work and optimizing your use of
the platform’s powerful features.
