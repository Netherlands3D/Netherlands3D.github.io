# GeoJSON Support

Netherlands3D enables users to import and work with GeoJSON data seamlessly. Below is a breakdown of how GeoJSON files
are supported, including file handling, parsing, coordinate transformation, and more.

---

## Importing

Netherlands3D supports `.json` and `.geojson` file extensions by default. For custom file types, you can extend support
by modifying:

- **FileOpen** script: Enables selection of additional file types.
- **FileTypeAdapter**: Handles the processing of new file types.

GeoJSON files are uploaded and embedded as assets within the open NL3D project. When opened from a URL, pointing to
GeoJSON files (
e.g., [https://raw.githubusercontent.com/blackmad/neighborhoods/refs/heads/master/utrecht.geojson](https://raw.githubusercontent.com/blackmad/neighborhoods/refs/heads/master/utrecht.geojson)),
these are added as remote assets, ensuring they reload every time a project is opened.

---

## Parsing and Performance

To prevent application freezes when importing large files, GeoJSON parsing is spread across multiple frames. The default
parsing time per frame is **0.01 seconds**, but this value can be adjusted by modifying the `maxParseDuration` variable
in `GeoJSONLayer.cs`.

---

## Supported Feature Types

Netherlands3D supports the following GeoJSON feature types:

- Polygon
- MultiPolygon
- LineString
- MultiLineString
- Point
- MultiPoint

Features of the same type are combined into a single layer in the application:

- **Polygon** and **MultiPolygon** → One layer.
- **LineString** and **MultiLineString** → One layer.
- **Point** and **MultiPoint** → One layer.

---

## Coordinate Transformation

GeoJSON coordinates are converted to Unity coordinates using the [
`eu.netherlands3d.coordinates`](https://openupm.com/packages/eu.netherlands3d.coordinates/) package. The transformation
leverages the parsed CRS (Coordinate Reference System).

### CRS Support

- Netherlands3D supports the "Named CRS" feature described in the original pre-2018 GeoJSON
  specification ([see details here](https://geojson.org/geojson-spec.html#named-crs)), enabling backwards compatibility
  for older GeoJSON files that define their own CRS.
- Support for the "Linked CRS" variant is not provided.
- Custom CRS definitions are not supported in the current GeoJSON specification, but legacy files using "Named CRS" are
  still supported.

---

## Visualization and Appearance

A material can be assigned to a GeoJSONLayer to control the visualization's appearance. This allows for customization of
how imported GeoJSON features are displayed in the 3D environment.

---

## Error Handling

Netherlands3D includes error handling for GeoJSON imports. If parsing fails, an event is invoked to display error
messages on-screen, ensuring users are informed of any issues during the import process.

---

## Troubleshooting

If GeoJSON data does not display correctly in Netherlands3D, follow these steps to verify data correctness before
debugging the code:

1. **Open the file in QGIS**: Check if QGIS can successfully display the data. If QGIS cannot load the file, the data
   may be incorrect.
2. **Validate the GeoJSON structure and geometry**: Use
   the [GeoJSON Validator](https://geojson-validator.streamlit.app/) to confirm the file’s structure and geometry are
   valid.
3. **Test the file in GeoJSON.io**: Try loading the file in [GeoJSON.io](https://geojson.io/) to verify if the data
   renders correctly.

These steps help ensure the GeoJSON file is correct and usable, minimizing unnecessary debugging in the code.