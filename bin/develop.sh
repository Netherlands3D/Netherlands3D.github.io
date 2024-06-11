# go one directory up so the mkdocs.yml file can be found
cd .. 
docker run --rm -it -p 8000:8000 -v $(pwd):/docs squidfunk/mkdocs-material
