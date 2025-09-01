Website and Documentation
=========================

In this repository we create: 

1. the website, 
2. project-wide documentation and, 
3. the documentation for each package
 
We use mkdocs to build a static html website and publish it to https://netherlands3d.eu/ using Github Pages.

Writing your own additions
--------------------------

To add onto this documentation you can do so using Markdown by adding or changing files in the `docs` folder. Every 
file in that folder is copied and transformed onto Github Pages using Github Actions. This means that if you need
additional assets, such as images, you can add those to the docs folder as well.

Please read our documentation page hwo to get started, what tone to use and how to preview your changes:

    https://netherlands3d.eu/docs/developers/contributing/documentation/

What if I get a 404 after deploying?
------------------------------------

When using a custom domain in GitHub Pages, there needs to be a file named CNAME in the gh-pages branch. The deploy
step of mkdocs does a clean release of this branch and if you add this file through GitHub's settings, it may become 
lost and GitHub forgets the connection between the custom domain and github pages.

For this purpose a CNAME file is present in the `docs` folder, this should automatically be copied by mkdocs. If there
are issues with a custom domain, check the presence of this file and whether the correct custom domain is present in it.
