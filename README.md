Documentation
=============

In this repository we create the website, project-wide documentation and, combined with the documentation for 
each package, we use mkdocs to build a static html website and publish it to https://netherlands3d.eu/docs using 
Github Pages.

Writing your own additions
--------------------------

> Important: In this repository we have the project-wide docs, if you want to write documentation for a package you
> should do so in that package's `Documentation~` folder.

To add onto this documentation you can do so using Markdown by adding or changing files in the `docs` folder. Every 
file in that folder is copied and transformed onto Github Pages using Github Actions. This means that if you need
additional assets, such as images, you can add those to the docs folder as well.

Previewing
----------

To preview the generated documentation you can start the `.\bin\develop.bat` script from this folder and mkdocs will
start building and watching the files in the docs folder. This also means you do not need to restart this command
on every change, mkdocs is watching the docs folder and will rebuild automatically while it is running.

> Make sure that you have docker installed, mkdocs is ran through docker so that you do not need to install it on your 
> own system. 

The location where you can preview the docs is at: http://localhost:8000.

What if I get a 404 after deploying?
------------------------------------

When using a custom domain in GitHub Pages, there needs to be a file named CNAME in the gh-pages branch. The deploy
step of mkdocs does a clean release of this branch and if you add this file through GitHub's settings, it may become 
lost and GitHub forgets the connection between the custom domain and github pages.

For this purpose a CNAME file is present in the `docs` folder, this should automatically be copied by mkdocs. If there
are issues with a custom domain, check the presence of this file and whether the correct custom domain is present in it.
