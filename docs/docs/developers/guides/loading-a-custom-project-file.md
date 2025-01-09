# Loading a Custom Project File

In the Netherlands3D application, a default file named **`ProjectTemplate.nl3d`** is used. This file is located in the 
**`StreamingAssets`** folder and is loaded at application startup. It defines the default settings, such as the 
location, and allows the twin installation to be customized according to the needs of the organization using the 
application.

## Creating the intended Project

To create a custom project file, use your twin installation to configure the desired view, including layers and
settings. Once satisfied with the setup, save the project as a file named `ProjectTemplate.nl3d`. This file
can then be used to define the default settings for your Netherlands3D application.

## Built from Source

If you choose to build the Netherlands3D project from source rather than using the available Docker image, you can
directly place the created `ProjectTemplate.nl3d` file into the `StreamingAssets` folder before building the 
application. This allows the default settings to be included with your custom-built application.

## Using Docker and Mounts

The default Netherlands3D application is deployed as a Docker image, built via our GitHub Actions pipeline and hosted in
the [Github Container Registry](https://github.com/Netherlands3D/twin/pkgs/container/twin). Docker images act as virtual
servers with all required files and configurations preconfigured. Typically, this setup offers little flexibility to
modify files in the image without rebuilding it.

To simplify things for organizations and DevOps specialists, our Docker image is designed to allow an external directory
to be **mounted** in the Docker container. This makes it possible to add a custom project file without rebuilding the
image.

!!! info What is Mounting?

    Mounting is a technique that makes an external storage location, such as a folder on a server or in the cloud,
    accessible within an application or container. It works as a virtual link: files or directories from the external
    location become accessible as if they were locally available in the container.

    For example:

    - By mounting a folder, configurations or files can be modified without rebuilding the container.
    - In environments that support file-level mounts (like Docker), it is more efficient to directly mount a file
      to `/usr/share/nginx/html/StreamingAssets/DefaultTemplate.nl3d`, as changes become immediately visible without
      restarting the container.

## General Steps for Configuring a Mount

1. **Prepare the external storage location:**
    - Ensure the storage location (e.g., a folder on a server or a cloud storage container) is configured and
      accessible.
2. **Place the project file:**
    - Place the custom project file (e.g., **`DefaultTemplate.nl3d`**) in the external storage location.
3. **Configure the mount:**
    - Set up the mount so that the external storage location is linked to the desired directory in the Docker container,
      such as **`/usr/share/nginx/html/StreamingAssets/Projects/`**. For a single file mount, use *
      *`/usr/share/nginx/html/StreamingAssets/DefaultTemplate.nl3d`**.

    - Restart the application or container to apply the new configuration. A single file mount does not require a
      restart.
5. **Verify:**
    - Check if the application has correctly loaded the changes.

## Example: Configuring a Mount Locally via Docker Command Line

Here is an example of how to configure a mount using the Docker command line when running Netherlands3D locally:

1. **Make the project file available:**
    - Ensure the custom project file **`DefaultTemplate.nl3d`** is available on your local system or an external storage
      location.
2. **Start the Docker container with a file mount:**
    - Use the following command to start the container:

        ```bash
        docker run -d \
          -v /path/to/DefaultTemplate.nl3d:/usr/share/nginx/html/StreamingAssets/DefaultTemplate.nl3d \
          --name netherlands3d \
          ghcr.io/netherlands3d/twin:latest
        ```

      In this example, the file **`/path/to/DefaultTemplate.nl3d`** is directly linked to the expected location in the
      container.
3. **No restart required:**
    - Since the file is mounted directly, changes are immediately visible without restarting the container.
4. **Verify:**
    - Check if the application has correctly loaded the changes by opening it in the browser.

## Example: Configuring a Mount via Azure Portal

Below are the steps to set this up using the Azure Portal:

1. **Create a Blob Storage Container:**
    - In the Blob Storage for your environment, create a container to store project files, for example, named *
      *`projects`**.
2. **Upload the project file:**
    - Upload the new default project file, named **`DefaultTemplate.nl3d`**, to the container.
3. **Go to the Web App Service:**
    - Open the Azure Portal and navigate to the Web App Service for your environment.
4. **Open Settings:**
    - Open the **`Settings`** menu and go to **`Configuration`** in the sidebar.
5. **Configure Path Mappings:**
    - Go to the **`Path mappings`** tab.
    - Add a new **Azure Storage Mount** with a name of your choice, such as **"Projects"**.
6. **Link the Blob Storage:**
    - In the **`Storage Accounts`** dropdown, select the storage account associated with the Blob Storage containing the
      container.
    - In the **`Storage Container`** dropdown, select the container you created earlier, such as **`projects`**.
7. **Set the Mount Path:**
    - Enter the following value for **`Mount Path`**: **`/usr/share/nginx/html/StreamingAssets/Projects/`**.
    - This makes the contents of the Blob Storage container available at this location in the Docker container.
8. **Save Settings:**
    - Click **`Ok`**, and then **`Save`** to save the changes.
9. **Restart the Web App Service:**
    - Go back to the **`Overview`** page for the Web App Service and click **`Restart`**. This will restart the Docker
      container and initialize the **`DefaultTemplate.nl3d`** file.
10. **Check in the browser:**
    - Open the application in the browser to verify that the configuration has been applied correctly.
