# Mkdocs Tool

A docker image to encapsulate [mkdocs](http://www.mkdocs.org/) tool without you having to install mkdocs locally

## Requirements

- Docker: Install docker and have it running in your working environment

## Producing the Website

- Clone this repository
- Ensure you already have the mkdocs project/folder ready and obtain the path.
- Open up a terminal/shell environment and navigate to the directory of this repositiory
- Edit the `produce.sh`script, replace `local mkdocs folder`, `container mount point`, and `container name` with the mkdocs project directory path in your filesystem, desired path to mount container to mkdocs folder, and name of the docker container respectively. Exacmple is as below:

```bash
$ docker container rm mkdocs-project
rm -rf project project.tar.gz &&
docker run -it -v /Users/me/Documents/my-project:/MkDocs_tool/my-project --name mkdocs-project mkdocs produce /MkDocs_tool/my-project &&
docker cp mkdocs-project:/MkDocs_tool/project.tar.gz .
```

- Save and execute the below command from the terminal to build/produce the website:

```bash
$ bash produce.sh
```

This command will first remove the docker container previously created, build the website and send a compressed project.tar.gz file containing a mkdocs generated site to the stdout.

## Runing the Website

- Execute the below command to serve the website:

```bash
$ bash serve.sh
```
The above script mounts the repository directory to the container mount point `/MkDocs_tool/my-site`, extracts the compressed tar.gz file produced from the `produce` command step above, and use mkdocs to internally serve the website on port 8000. 
Browse to http://localhost:8000 to view the website.

## Jenkins

There is a `Jenkinsfile` at the repository root that executes both the Build step and Test step to serve the site.
