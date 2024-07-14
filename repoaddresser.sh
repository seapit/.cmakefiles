#!/bin/bash

ARG1=$1
ARG2=$2

#printf "\nRepoaddresser.sh arg1: %s, arg2: %s, arg3: %s\n" "$1" "$2" "$3"

${workspaceFolder}/$2/.cmakefiles/repohelper.sh $1 $2 $3

# fi

