#!/bin/bash

# Source the output from find_git_root.sh
echo "$1 $2"

# # Check if the variables are set
if [[ "$1" == "init" ]]; then
echo "init"
#  cp "$2/$REPO_NAME/.cmakefiles/templates/* $1/$REPO_NAME/ -R"

elif [[ "$1" == "app" ]]; then
echo "app"
#  cp "$2/$REPO_NAME/.cmakefiles/templates/Modules/App1* $1/$REPO_NAME/Modules/Module1 -R"

elif [[ "$1" == "module" ]]; then
echo "module"
#  cp "$2/$REPO_NAME/.cmakefiles/templates/Apps/App1* $1/$REPO_NAME/Apps/App1 -R"

else
  echo "Called task from invalid start directory (you are not in a valid repo)"
fi

# # Perform additional actions based on the repo name and whether it starts with a dot

# ARG1 = $1

# if [["$ARG1" == "init"]]; then
#     cp "$2/$REPO_NAME/.cmakefiles/templates/* $1/$REPO_NAME/ -R"

# elif [["$ARG1" == "module"]]; then
#     cp "$2/$REPO_NAME/.cmakefiles/templates/Modules/App1* $1/$REPO_NAME/Modules/Module1 -R"

# elif [["$ARG1" == "app"]]; then
#     cp "$2/$REPO_NAME/.cmakefiles/templates/Apps/App1* $1/$REPO_NAME/Apps/App1 -R"

# else
#  echo "Invalid option passed: $ARG1"
#  exit 1

# fi

