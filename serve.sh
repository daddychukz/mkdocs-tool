#!/bin/sh

docker run --rm -p 8000:8000 -it -v ${PWD}:/MkDocs_tool/my-site --name mkdocs-site mkdocs serve
