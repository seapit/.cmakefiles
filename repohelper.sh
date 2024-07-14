#!/bin/bash

# # Check if the variables are set
if [[ "$1" == "init" ]]; then
  #printf "\nrepohelper.init\n"
  cp "/workspaces/cpp/$2/.cmakefiles/templates/* "/workspaces/cpp/$2" -R"

elif [[ "$1" == "app" ]]; then
  #printf "\nrepohelper.app\n"
  cp "/workspaces/cpp/$2/.cmakefiles/templates/Apps/App1/" "/workspaces/cpp/$2/Apps/$3" "-R"

elif [[ "$1" == "module" ]]; then
  #printf "\nrepohelper.module\n"
  cp "/workspaces/cpp/$2/.cmakefiles/templates/Modules/Module1/" "/workspaces/cpp/$2/Modules/$3" "-R"
else
  echo "Called task from invalid start directory (you are not in a valid repo)"
fi

# fi


