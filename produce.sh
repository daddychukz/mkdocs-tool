#!/bin/sh

#remove container
docker container rm mkdocs-project

rm -rf project project.tar.gz &&
docker run -it -v /Users/andela/Documents/Work/natterbase/my-project:/MkDocs_tool/my-project --name mkdocs-project mkdocs produce /MkDocs_tool/my-project &&

#copy created tar file
docker cp mkdocs-project:/MkDocs_tool/project.tar.gz . 
