#!/bin/bash

ARG1=$1
ARG2=$2

printf "\nRepoaddresser.sh arg1: %s, arg2: %s\n" "$1" "$2"

/workspaces/cpp/$2/.cmakefiles/repohelper.sh $ARG1 $ARG2

# fi

