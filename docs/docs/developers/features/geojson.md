GeoJSON Support
===============

Netherlands3D offers limited support for importing GeoJSON data. The functionality is still being expanded.

## Features

- Currently only GeoJSON files are supported. The default file extensions are .json or .geojson. In case custom file
  types should be supported, these can be added in the FileOpen script (to allow selection of other file types) and in
  the FileTypeAdapter (to process the opened file).
- The GeoJSON parsing is spread over multiple frames, (default is max 0.01s of parsing per frame) as to not freeze the
  application when importing large files. This duration can be changed by changing the variable `maxParseDuration` in
  GeoJSONLayer.cs
- GeoJSON features of type Polygon, MultiPolygon, LineString, MultiLineString, Point, and MultiPoint are supported.
- GeoJSON coordinates are passed to
  the [`eu.netherlands3d.coordinates`](https://openupm.com/packages/eu.netherlands3d.coordinates/) package using the
  parsed CRS in order to convert them to Unity coordinates (see also the section on limitations for CRS limitations). A
  CRS object of type `Linked CRS` is currently not supported
- A material can be assigned to the GeoJSONLayer that determines the appearance of the visualization.
- An event is invoked when parsing fails, to allow for display of error messages on screen.

## Limitations

The GeoJSON support currently has the following limitations:

- A LinkedCRS object is parsed correctly in the GeoJSONLayer, however it is currently not interpreted to provide a valid
  input for the visualization through
  the [`eu.netherlands3d.coordinates`](https://openupm.com/packages/eu.netherlands3d.coordinates/) package.
- All features of the Type Polygon and MultiPolygon are combined to form 1 layer in the application
- All features of the Type LineString and MultiLineString are combined to form 1 layer in the application
- All features of the Type Point and MultiPoint are combined to form 1 layer in the application
