#!/bin/bash

# Command line arguments
CMD_TYPE=$1
SELECTED_REPO=$2
MODULE_TYPE=$3
SELECTED_MODULE=$4
HEADER_NAME=$5

repo="${workspaceFolder}/${SELECTED_REPO}"

# Paths to template directories
temp_top_apps="${repo}/.cmakefiles/proj_structure/apps"
temp_top_libs="${repo}/.cmakefiles/proj_structure/libs"
temp_bot_app="${repo}/.cmakefiles/proj_structure/apps/App1"
temp_bot_lib="${repo}/.cmakefiles/proj_structure/libs/Lib1"

# Function to create and update the directory
createAndUpdateDir() {
  local createType=$1
  local name=$2
  local dest="${repo}/${createType}/${name}"
  echo "Creating new dir: ${dest}"

  #Create path
  case $createType in
  apps | libs)
    mkdir -p "${dest}"
    ;;
  *)
    echo "Unknown create dir arg for type: $createType"
    ;;
  esac

  #Copy files
  if [[ "$createType" == "libs" ]]; then
    echo "Copying template repo structure (libs) to ${repo}"
    cp "${temp_bot_lib}/"* "${dest}" "-R"
  elif [[ "$createType" == "apps" ]]; then
    echo "Copying template repo structure (apps) to ${repo}"
    cp "${temp_bot_app}/"* "${dest}" "-R"
  fi
  #get this script's location
  script_dir=$(dirname "$(readlink -f "$0")")
  "$script_dir/updateFiles.sh" "dir" "$dest" "$name"
  return 1
}

# Function to copy and update the header file
copyHdr() {
  local createType=$1
  local modName=$2
  local name=$3

  local dest="${repo}/${createType}/${modName}/inc/${modName}"

  case ${createType} in
  apps | libs)
    echo "Copying Template.hpp to ${dest}/${name}.hpp"
    cp "${temp_bot_lib}/inc/Lib1/Template.hpp" "${dest}/${name}.hpp"

    #get this script's location
    script_dir=$(dirname "$(readlink -f "$0")")
    "$script_dir/updateFiles.sh" "template" "$dest" "$name" "hpp"
    ;;
  *)
    echo "Unknown createType arg for type: ${modName} in copyHdr()"
    ;;
  esac
}

# Main command handling
case $CMD_TYPE in
init)
  # Initialize the repository
  echo "Copying template repo structure (apps) to ${repo}"
  cp "${temp_top_apps}" "${repo}" "-R"
  echo "Copying template repo structure (libs) to ${repo}"
  cp "${temp_top_libs}" "${repo}" "-R"
  ;;
newObj)
  # Create a new App or Lib
  createAndUpdateDir "${MODULE_TYPE}" "${SELECTED_MODULE}"
  ;;
newHdr)
  # Copy header file from template
  copyHdr "${MODULE_TYPE}" "${SELECTED_MODULE}" "${HEADER_NAME}"
  ;;
*)
  echo "Unknown command: $CMD_TYPE"
  ;;
esac
