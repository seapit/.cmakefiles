#!/bin/bash

# Source the output from find_git_root.sh

# # Check if the variables are set
if [[ "$1" == "init" ]]; then
#  cp "/workspaces/cpp/$2/.cmakefiles/templates/* /workspaces/cpp/$2 -R"

elif [[ "$1" == "app" ]]; then
#  cp "/workspaces/cpp/$2/.cmakefiles/templates/Modules/App1* /workspaces/cpp/$2/Modules/Module1 -R"

elif [[ "$1" == "module" ]]; then
#  cp "/workspaces/cpp/$2/.cmakefiles/templates/Apps/App1* /workspaces/cpp/$2/Apps/App1 -R"

else
  echo "Called task from invalid start directory (you are not in a valid repo)"
fi

# fi


