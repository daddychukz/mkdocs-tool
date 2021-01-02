#!/bin/sh

image_name=

docker run --rm -p 8000:8000 -it -v ${PWD}:/MkDocs_tool/my-site --name mkdocs-site $image_name serve
