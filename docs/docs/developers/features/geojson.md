GeoJSON in Netherlands3D
=======================================

## GeoJSON import

Netherlands3D offers limited support for importing GeoJSON data. The functionality is still being expanded.

## Features
- Currently only GeoJSON files are supported. The default file extensions are .json or .geojson. In case custom file types should be supported, these can be added in the FileOpen script (to allow selection of other file types) and in the FileTypeAdapter (to process the opened file).
- The GeoJSON parsing is spread over multiple frames, (max 0.01s of parsing per frame) as to not freeze the application when importing large files. This duration can be changed by changing the variable `maxParseDuration` in GeoJSONLayer.cs
- GeoJSON features of type Polygon and MultiPolygon are currently supported.
- GeoJSON coordinates are passed to the [`eu.netherlands3d.coordinates`](https://openupm.com/packages/eu.netherlands3d.coordinates/) package using the parsed CRS in order to convert them to Unity coordinates. (see also the section on limitations for CRS limitations)
- A material can be assigned to the GeoJSONLayer that determines the appearance of the visualization.
- An event is invoked when parsing fails, to allow for display of error messages on screen.

## Limitations

The GeoJSON support currently has the following limitations:
- A LinkedCRS object is parsed correctly in the GeoJSONLayer, however it is currently not interpreted to provide a valid input for the visualization through the [`eu.netherlands3d.coordinates`](https://openupm.com/packages/eu.netherlands3d.coordinates/) package.
- Only features of type Polygon or MultiPolygon are currently supported.
