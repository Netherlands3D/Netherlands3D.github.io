The Netherlands3D platform has a modular configuration system in which [functionalities](functionalities.md) in the 
application can register their own per-deployment defaults and settings. This can be used to -for example- pre-package 
API Keys and server URLs when deploying the application.

!!! info
    The configuration system is not meant to store user preferences or per-project settings but instead it enables
    system operators to provide keys and similar information that is specific to the deployment of the platform.

## Defaults are settings that can be overridden by the user

As a brief aside, let's first discuss what we mean by defaults and settings to provide context for the rest of this 
chapter.

Functionalities can have per-project and per-deployment properties. While the per-project properties as stored in the 
`Project` structure, the Configuration for each functionality may have defaults that can be used to pre-populate a
new project, or when a project does not feature these properties. 

!!! example

    The Digital Twin for the province of Utrecht would want all new projects to have their camera focused on the
    city of Utrecht. While the starting position of the camera can be overridden as a project setting, the default
    is provided in the configuration that is provided by the province.

Configuration settings on the other hand are not changeable on a per-project basis and can be used to provide URLs to 
specific tilesets for the base layers, API Keys for working with a back-end, or pre-provide a set of access tokens for
WFS and WMS services that the deployment should always have access to.

!!! warning

    Information provided through the configuration system are exposed through a publicly accessible configuration file
    as the Digital Twin platform is fully client-side. Information that should stay secret should not be provided 
    through this mechanism.

To summarize: _A default is the same as a setting but it can be overridden from a query parameter in the URL or via a 
project file._

## Configuring the platform

Settings can be provided through a configuration file called the `app-config.json` and should be present in the same
folder as where your `index.html` file is located of your deployment.

!!! info

     Are you using the Docker image? Then you can specify the settings using environment variables, please see
     [https://github.com/Netherlands3D/twin/blob/main/.docker/README.md](https://github.com/Netherlands3D/twin/blob/main/.docker/README.md) 
     for more information on using the Docker image and which variables are supported.

This JSON file has the following structure -where `[...]` represents a placeholder where we omitted content for brevity 
or clarity:

```json
{
  "origin": {
    "epsg": 7415,
    "x": 161088,
    "y": 503050,
    "z": 500
  },
  "functionalities": {
    [...]
  }
}
```

Where functionalities contains a listing of each available functionality and whether they are enabled, and what 
additional configuration they may have.

The `origin` section defines the initial location of the world origin. It is recommended to keep the `epsg` code at 
`7415` -representing the CRS [EPSG:7415](https://epsg.io/7415)- and provide the `x`, `y` and `z` coordinates in
*Rijksdriehoekformaat* with a height in *NAP*. The camera will initially be positioned at that location.

Functionalities always follow this format:

```json
{
  [...]
  "functionalities": {
    "[CODE]": {
      "enabled": true/false,
      "configuration": {
        [...]
      }
    }
  }
}
```

In the snippet above, `[CODE]` can be substituted with the functionality code string as defined in the application -more
on how to find this in the documentation on [functionalities](functionalities.md). 

`enabled` represents a boolean whether the functionality is enabled in the application or not and the `configuration`
json object represents the means to provide additional configuration for that functionality. If there is no additional
configuration or you want the functionality its defaults, you are free to omit the additional configuration section.

