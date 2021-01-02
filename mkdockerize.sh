#!/bin/sh

source ${PWD}/scripts/utils.sh

# Function to produce/build the website
produce() {

	#validate if local path is supplied in argument
    if [[ -z "$1" ]]; then
		error "Enter path to the local directory that contains the Mkdocs project."
	fi

	#validate project exists before building website
    if [[ -d $1 ]]; then
		cd $1
		mkdocs build
		echo "dev_addr: 0.0.0.0:8000" >> mkdocs.yml
		tar -czvf project.tar.gz .
		mv project.tar.gz ../
		rm -rf site
		success "Build Succeeded..."
	fi
}

# Function to run the website
serve() {
	cd /MkDocs_tool/my-site
	mkdir project
	cat project.tar.gz | tar xzf - -C project
	cd project
	mkdocs serve
}

main() {
    command="$1"
    local_dir="$2"

    if [ "$command" = "produce" ];
    then
        produce $local_dir
    elif [ "$command" = "serve" ];
    then
        serve
	else
		error "Provide either 'produce' or 'serve' entrypoint command"
    fi

}

main $1 $2