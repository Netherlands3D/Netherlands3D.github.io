# Contributing to our Documentation

Thank you for your interest in contributing to the Netherlands3D documentation. This guide provides all the necessary
information to help you get started with contributing to our documentation, which is composed of Markdown documents in
our GitHub repository and is automatically built using MkDocs whenever a pull request is merged.

## Getting Started

First, you'll need to set up your environment for making contributions:

1. **Fork the Repository**: Go to https://github.com/Netherlands3D/netherlands3D.github.io/ and fork the repository to 
   your GitHub account.
2. **Clone the Fork**: Clone your forked repository to your local machine to make changes.

## Previewing Changes

You can preview the documentation locally in two different ways: either using Docker (recommended, no local installation
required),or by installing MkDocs directly on your system.

### Option 1: Using Docker (Recommended)

If you have [Docker Desktop](https://docker.com) installed and running, you can follow these steps:

1. Open Powershell (or your IDE's terminal)
2. Make sure you are in your project folder (usually something like `C:\Users\[username]\[path to where you cloned]\Netherlands3D.github.io`)
3. Run the included helper script:
   ```powershell
   .\bin\develop.bat
   ```

This will start a virtual webserver inside Docker and make the site available at:

    http://localhost:8000

As long as the script is running, any edits you make to the documentation files will automatically be detected and the
site will refresh. In most cases, your browser will even reload automatically.

This method ensures a consistent environment for all contributors.

### Option 2: Installing MkDocs Locally

If you prefer to install MkDocs directly on your machine:

1. Follow the installation guide on the [MkDocs](https://www.mkdocs.org/getting-started/) website and on 
   the [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) website.
2. In your project directory, run:

```powershell
mkdocs serve
```

This will start a local development server and make the site available at:

    http://localhost:8000

Like with Docker, changes to the files will automatically update the preview.

## Making Contributions

### Language and Voice

* For user and organisation facing parts of the documentation, write in Dutch using the passive voice.
* For developer-facing documentation, write in English.

### Adding or Editing Content

1. **Create a New Branch**: Before making any changes, create a new branch in your forked repository.
2. **Add/Edit Markdown Files**: Make your changes or add new content in the appropriate Markdown (.md) files. Be sure to
   follow
   the language and voice guidelines mentioned above.
3. **Update mkdocs.yml**: If you are adding a new page, don't forget to update the mkdocs.yml configuration file to
   include
   your new page in the navigation.

### Submitting Your Contributions

Once you are satisfied with your changes:

1. **Commit Your Changes**: Add your changes to your fork and commit them with a clear commit message.
2. **Push to Your Fork**: Push your changes to your GitHub fork.
3. **Create a Pull Request**: Go to the original Netherlands3D/docs repository and create a new pull request. Target the
   main branch for your pull request and provide a clear description of your changes.
4. **Review Process**: Your pull request will be reviewed by the Netherlands3D documentation team. Be open to feedback
   and make any requested changes.

### Conclusion

Contributing to the Netherlands3D documentation is a collaborative effort. We appreciate your willingness to contribute
and look forward to improving our documentation with your help. If you have any questions or need assistance, please
open an issue in the GitHub repository.
