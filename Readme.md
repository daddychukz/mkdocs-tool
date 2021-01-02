# Mkdocs Tool

A docker image to encapsulate [mkdocs](http://www.mkdocs.org/) tool without you having to install mkdocs locally

## Requirements

- Docker: Install docker and have it running in your working environment

## Producing the Website

- Clone this repository
- Ensure you already have the mkdocs project/folder ready and obtain the path.
- Open up a terminal/shell environment and navigate to the directory of this repositiory
- Build the image with the command `docker build -t <image name> .`
- Edit the `produce.sh`script, supply values for the variables `container_mount_root`, `container_name`, `mkdocs_project_dir`, and `image_name` with the desired path to mount container to mkdocs folder, name of the docker container, mkdocs project directory path in your filesystem, and the docker image name respectively. Example is as below:

```bash
$ #variables
container_mount_root='/MkDocs_tool'
container_name='mkdocs-project'
mkdocs_project_dir='/Users/me/Documents/my-project'
image_name=mkdocs
```

- Save and execute the below command from the terminal to build/produce the website:

```bash
$ bash produce.sh
```

This command will first remove the docker container previously created, build the website and send a compressed project.tar.gz file containing a mkdocs generated site to the stdout.

## Runing the Website

- Edit the `server.sh` script and replace `<image name>` with the name of the docker image already built
- Execute the below command to serve the website:

```bash
$ bash serve.sh
```

The above script mounts the repository directory to the container mount point `/MkDocs_tool/my-site`, extracts the compressed tar.gz file produced from the `produce` command step above, and use mkdocs to internally serve the website on port 8000.
Browse to http://localhost:8000 to view the website.

## Jenkins

There is a `Jenkinsfile` at the repository root that executes both the Build step and Test step to serve the site.
