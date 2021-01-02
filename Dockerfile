FROM python:3.7-alpine

RUN apk update
RUN pip install mkdocs 

WORKDIR /MkDocs_tool

COPY mkdockerize.sh /MkDocs_tool/scripts/mkdockerize.sh

RUN chmod 755 /MkDocs_tool/scripts/mkdockerize.sh

EXPOSE 8000

ENTRYPOINT [ "/MkDocs_tool/scripts/mkdockerize.sh" ]