#!/bin/bash

# Source the output from find_git_root.sh
echo "$1 $2"

"/workspace/cpp/$2/.cmakefiles/repohelper.sh $1"

# # Check if the variables are set
if [[ "$1" == "init" ]]; then
echo "init"
#  cp "$2/$REPO_NAME/.cmakefiles/templates/* /workspaces/cpp/$2 -R"

elif [[ "$1" == "app" ]]; then
echo "app"
#  cp "$2/$REPO_NAME/.cmakefiles/templates/Modules/App1* /workspaces/cpp/$2/Modules/Module1 -R"

elif [[ "$1" == "module" ]]; then
echo "module"
#  cp "$2/$REPO_NAME/.cmakefiles/templates/Apps/App1* /workspaces/cpp/$2/Apps/App1 -R"

else
  echo "Called task from invalid start directory (you are not in a valid repo)"
fi

# fi

