#!/bin/sh

#variables
container_mount_root=""
container_name=""
mkdocs_project_dir=""
image_name=""

#remove container
docker container rm $container_name

rm -rf project project.tar.gz &&
docker run -it -v ${mkdocs_project_dir}:${container_mount_root}/my-project --name ${container_name} $image_name produce ${container_mount_root}/my-project &&

#copy created tar file
docker cp ${container_name}:/${container_mount_root}/project.tar.gz . 