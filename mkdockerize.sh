#!/bin/sh

source ${PWD}/scripts/utils.sh

produce() {

    if [[ -z "$1" ]]; then
		error "Enter path to the local directory that contains the Mkdocs project."
	fi

    if [[ -d $1 ]]; then
		cd $1
		mkdocs build
		tar -czvf project.tar.gz .
		mv project.tar.gz ../
		success "Build Succeeded..."
	fi
}

serve() {
	cd /MkDocs_tool/my-site
	rm rf site
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