# Testing 3D Model Formats

## Introduction

This document provides guidance on testing 3D model formats supported by our system. It includes a list of available
test models and a matrix of their properties, enabling systematic evaluation of compatibility, rendering behavior, and
feature support.

## Scope of This Document

This document focuses on testing the fundamental functionalities of 3D model loading, such as format compatibility,
texture support, coordinate system alignment, and performance considerations. Additional features, including animation,
material properties, and advanced optimizations, will be considered in later versions of the application. This document
will be updated accordingly as new formats and capabilities are introduced.

## Test Models

Below is a list of example 3D models that can be used for testing. Each entry includes a download link and relevant
metadata.

!!! info "Please note"
    This is not an exhaustive list. It is recommended to test with as many variations as possible. If a new model highlights
    a different compatibility issue, please update this list accordingly.

| Model Name                   | Format | Download Link                                                                       | Textures | Materials | Animation | Coordinate System | File Size |
|------------------------------|--------|-------------------------------------------------------------------------------------|----------|-----------|-----------|-------------------|-----------|
| OBJ with 4 colored materials | .obj   | [Download](models/colored-materials.zip) / [Project](models/colored-materials.nl3d) | ❌        | ✅         | ❌         | Local             | XX MB     |
| Rietveldhuis (Utrecht)       | .obj   | [Download](models/rietveldhuis.zip)                                                 | ❌        | ✅         | ❌         | EPSG:28992 (RD)   | XX MB     |

This table serves as a reference for understanding which formats support different properties, allowing focused testing
and troubleshooting.

*\* While compiling this list, some properties might not yet be tested. Please provide a pull request with missing
information when encountered.*

## Testing Methodology

1. **Format Validation**:
    - Ensure the file format is correctly recognized and loaded.
    - Check for potential parsing errors when opening the file.

2. **Texture & Material Testing**:
    - (Upcoming) Verify that textures are correctly applied and rendered.
    - Confirm that material properties (e.g., roughness, metallic) are correctly interpreted.

3. **Coordinate System & Alignment**:
    - Ensure that the model loads in the correct orientation.
    - Verify whether georeferenced models are loaded in the correct location

4. **Performance Testing**:
    - Load models with different complexities and file sizes to observe performance.
    - Identify any models that cause excessive rendering lag or memory usage.

## Future Format Support

We currently support `.obj` files and plan to add support for additional formats, such as `.gltf`. As new formats are
introduced, this document will be updated with relevant testing procedures and additional test models.

Should you encounter issues with a specific model, please document it and submit a report to improve format
compatibility.
