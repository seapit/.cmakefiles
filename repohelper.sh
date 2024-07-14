#!/bin/bash

# # Check if the variables are set
if [[ "$1" == "init" ]]; then
  #printf "\nrepohelper.init\n"
  #printf "/workspaces/cpp/%s/.cmakefiles/templates/* /workspaces/cpp/%s/ -R\n" $2 $2 
  #mkdir -p "/workspaces/cpp/$2/apps" && mkdir -p "/workspaces/cpp/$2/libs"
  cp "/workspaces/cpp/$2/.cmakefiles/templates/apps" "/workspaces/cpp/$2" "-R"
  cp "/workspaces/cpp/$2/.cmakefiles/templates/libs" "/workspaces/cpp/$2" "-R"

elif [[ "$1" == "app" ]]; then
  #printf "\nrepohelper.app\n"
  mkdir -p "/workspaces/cpp/$2/apps/$3"
  cp "/workspaces/cpp/$2/.cmakefiles/templates/apps/App1/" "/workspaces/cpp/$2/apps/$3" "-R"

elif [[ "$1" == "module" ]]; then
  #printf "\nrepohelper.module\n"
  mkdir -p "/workspaces/cpp/$2/libs/$3"
  cp "/workspaces/cpp/$2/.cmakefiles/templates/libs/Module1/" "/workspaces/cpp/$2/libs/$3" "-R"

elif [[ "$1" == "copy" ]]; then
  #printf "\nrepohelper.module\n"
  cp "/workspaces/cpp/$2/$3" "/workspaces/cpp/$2/libs/$3" "-R"


else
  echo "Called task from invalid start directory (you are not in a valid repo)"
fi

# fi


