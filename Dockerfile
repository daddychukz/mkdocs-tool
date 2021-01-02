FROM python:3.7-alpine

LABEL MAINTAINER="Chukwukadibia Durugo"
LABEL application="MkDocs Tool"

RUN apk update

#install dependencies
RUN apk add --no-cache tar gcc gzip musl-dev && pip install mkdocs 

WORKDIR /MkDocs_tool

COPY mkdockerize.sh utils.sh /MkDocs_tool/scripts/

# make script executable
RUN chmod 755 /MkDocs_tool/scripts/mkdockerize.sh

EXPOSE 8000

ENTRYPOINT [ "/MkDocs_tool/scripts/mkdockerize.sh" ]