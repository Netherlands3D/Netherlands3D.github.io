Embedding Netherlands3D on Your Website
=======================================

You can easily embed Netherlands3D on your own website using an iframe. This allows you to showcase the 3D 
representation of the Netherlands directly within your web pages. You can also customize the location and features 
displayed using a query string.

## Using an Iframe

<iframe src="https://netherlands3d.eu/twin/?origin=161088,503050,300&features=terrain,buildings,trees,sun" width="640" height="480" frameborder="0"></iframe>

To embed Netherlands3D with [Rijksdriehoekformaat (EPSG:28992)](https://epsg.io/28992) coordinates, use the following
HTML code snippet. Replace the `src` attribute value with the URL of the Netherlands3D digital twin you'd like to embed:

```html

<iframe
        src="https://netherlands3d.eu/twin/?origin=161088,503050,300&features=terrain,buildings,trees,sun"
        width="640"
        height="480"
        frameborder="0"
></iframe>
```

* **src**: Set this attribute to the URL of the Netherlands3D digital twin. You can customize the location and features
  using the query string.

* **width and height**: Adjust these attributes to define the dimensions of the iframe on your webpage. Make sure the
  width
  fits your design, and the height provides an optimal viewing experience.

* **frameborder**: Set this attribute to "0" to remove the iframe border.

## Configuring Location and Features

You can customize the location and features displayed in your embedded Netherlands3D using a query string. In the query
string, the origin parameter should follow the format `origin=X,Y,elevation`, where `X` and `Y` is the position of
the camera in [Rijksdriehoekformaat (EPSG:28992)](https://epsg.io/28992) coordinates and elevation is the desired
viewing elevation.

Here's an example URL with a query string for your reference:

```
https://netherlands3d.eu/twin/?origin=161088,503050,300&features=terrain,buildings,trees,sun
```

* **origin**: This parameter sets the initial view location in the
  [Rijksdriehoekformaat (EPSG:28992)](https://epsg.io/28992) coordinate system. It follows the format
  `origin=X,Y,elevation`, where elevation is a value between `0` and `1400`.

* **features**: Use this parameter to specify which features to display in the digital twin. You can include multiple
  features, separated by commas.

## Using the Setup Wizard

For an even easier way to generate the query string with the desired configuration, you can visit the
[Netherlands3D Setup Wizard (https://netherlands3d.eu/twin/)](https://netherlands3d.eu/twin/). This interactive tool
allows you to select the location, features, and other options, and it generates the corresponding query string for your
iframe.

Once you have the query string, insert it into the `src` attribute of your iframe code, and you'll have a fully
customized embedded Netherlands3D digital twin on your website.
