# Testing OGC Web Services

## Introduction

This document provides guidance on testing Open Geospatial Consortium (OGC) Web Map Services (WMS) and Web Feature
Services (WFS). It includes a list of available test services and a matrix of their properties, enabling systematic
evaluation against different capabilities and constraints.

## Scope of This Document

This document focuses on testing the fundamental functionalities of OGC Web Services, such as service availability,
supported coordinate reference systems, bounding box capabilities, and format support. Advanced functionalities,
including attribute and spatial filtering, will be considered in later versions of the application. This document will
be updated accordingly to reflect new testing procedures when such features are introduced.

## Test Endpoints

Below is a list of example WMS and WFS services that can be used for testing. Each service should
include its endpoint and relevant metadata -_do not forget to scroll sideways to see all information_. 

!!! info "Please note"
    This is not an exhaustive list, it is recommended to test with as many variations possible. Should a new variant be 
    found that has a different profile from these, please update this list to include it.

| Endpoint                                                                                                        | Service Type | Version | Default CRS | Multiple CRS Support | BBOX Support | Layer/Feature Count | Supported Formats | Supports parameterless invocation |
|-----------------------------------------------------------------------------------------------------------------|--------------|---------|-------------|----------------------|--------------|---------------------|-------------------|-----------------------------------|
| https://service.pdok.nl/cbs/vierkantstatistieken500m/2022/wfs/v1_0?request=GetCapabilities&service=WFS          | WFS          | X.X.X   | EPSG:XXXX   | ✅/❌                  | ✅/❌          | XX                  | X                 | ✅/❌                               |
| https://service.pdok.nl/cbs/vierkantstatistieken500m/2022/wms/v1_0?request=GetCapabilities&service=WMS          | WMS          | X.X.X   | EPSG:XXXX   | ✅/❌                  | ✅/❌          | XX                  | X                 | ✅/❌                               |
| https://service.pdok.nl/cbs/gebiedsindelingen/2024/wfs/v1_0?request=GetCapabilities&service=WFS                 | WFS          | X.X.X   | EPSG:XXXX   | ✅/❌                  | ✅/❌          | XX                  | X                 | ✅/❌                               |
| https://service.pdok.nl/prorail/spoorwegen/wfs/v1_0?service=wfs&request=GetCapabilities                         |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/rioned/beheerstedelijkwater/wfs/v1_0?request=GetCapabilities&service=wfs                |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/rws/digitaaltopografischbestand/wms/v1_0?request=GetCapabilities&service=WMS            |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/rws/digitaaltopografischbestand/wfs/v1_0?request=GetCapabilities&service=WFS            |              |         |             |                      |              |                     |                   |                                   |
| https://geo.rijkswaterstaat.nl/services/ogc/gdr/bps_kaart/ows?service=WMS&request=getcapabilities&version=1.3.0 |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/rvo/natura2000/wfs/v1_0?request=getcapabilities&service=wfs                             |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/rws/ahn/wms/v1_0?request=GetCapabilities&service=WMS                                    |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/kadaster/plu/wms/v1_0?request=Getcapabilities&service=WMS&version=1.3.0                 |              |         |             |                      |              |                     |                   |                                   |
| https://apps.geodan.nl/public/data/org/gws/YWFMLMWERURF/kea_public/wms?&SERVICE=wms&REQUEST=Getcapabilities     |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/kadaster/kadastralekaart/wms/v5_0?&service=WMS&Request=GETCapabilities&version=1.3.0    |              |         |             |                      |              |                     |                   |                                   |
| https://service.pdok.nl/hwh/luchtfotorgb/wms/v1_0?request=GetCapabilities&service=wms                           |              |         |             |                      |              |                     |                   |                                   |
| https://nens.lizard.net/wms/raster_f284fcd9-84ef-4b5a-ad32-d20f6f8978c5/?SERVICE=WMS&REQUEST=Getcapabilities    |              |         |             |                      |              |                     |                   |                                   |

This table serves as a reference for understanding which services support different properties, allowing focused testing
and troubleshooting.

*\* While compiling this list, it is possible not all properties are available yet. Please provide a pull request with
the missing information when encountering this.*

## Testing Methodology

1. **Service Validation**:
    - Verify that the service responds when accessed directly at its base URL (without `service` and `request`
      parameters) if the service supports parameterless invocation (see chapter below).
    - Check whether the service responds correctly when providing `service=WMS/WFS` and `request=GetCapabilities`
      parameters.
    - Validate that individual layers or feature types can be requested using `GetMap` (for WMS) or `GetFeature` (for
      WFS) and their supporting parameters.
2. **CRS & BBOX Testing**:
    - Request maps or features in different CRSs and bounding boxes to confirm proper handling.
3. **Format Compatibility**:
    - Ensure that the expected image (PNG) and feature formats (GeoJSON) is used if multiple formats are supported.
4. **Feature & Layer Access**:
    - Check layer listings (WMS) and feature queries (WFS) to confirm all advertised data is retrievable.
5. **Performance Testing**:
    - Note high response times while testing to provide guidance when doing performance reviews.

## Parameterless Invocation

Some GIS endpoints support parameterless invocation, where calling the service using only its base URL (without
explicitly providing `service` and `request` parameters) automatically returns the GetCapabilities response. While this
is not part of the OGC standard, it is a commonly observed behavior in the field.

This feature is often referenced in documentation and examples, making it necessary to support and test for. Services
that implement parameterless invocation simplify client implementation but also introduce inconsistencies in behavior
across different services. When testing, it is recommended to verify whether a service responds correctly when invoked
without parameters and compare the results against an explicit `GetCapabilities` request.