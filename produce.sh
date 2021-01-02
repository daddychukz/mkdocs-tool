#!/bin/sh

#remove container
docker container rm <container name>

rm -rf project project.tar.gz &&
docker run -it -v <local mkdocs folder>:<container mount point> --name <container name> mkdocs produce <container mount point> &&

#copy created tar file
docker cp <container name>:/MkDocs_tool/project.tar.gz . 
