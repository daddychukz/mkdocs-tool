#!/bin/sh
set -e

BOLD='\e[1m'
RED='\e[31m'
GREEN='\e[92m'
NC='\e[0m'

error() {
    printf "\n${BOLD}${RED}====> $(echo $@ )  ${NC}\n"; exit 1
}

success () {
    printf "\n${BOLD}${GREEN}====> $(echo $@ ) ${NC}\n"
}