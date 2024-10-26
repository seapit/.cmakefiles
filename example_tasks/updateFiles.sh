#!/bin/bash

# Arguments
INPUT_PATH="$2"
INPUT_NAME="$3"
INPUT_TYPE="$4"

# Constants
repo="${workspaceFolder}/$2"
CPP="cpp"
HPP="hpp"

# Function to update the template file with a new class name
updateTest() {
  local dir_path=$1
  local new_name=$2
  local new_name_upper=$(echo "$new_name" | tr '[:lower:]' '[:upper:]')
  local type=$3

  pushd "$dir_path" >/dev/null

  echo "Renaming test_lib1.${type} to test_${new_name}.${type}"
  mv "test_lib1.${type}" "test_${new_name}.${type}"

  echo "Updating template test contents"
  sed -i "s/Lib1/$new_name/g" "test_${new_name}.${type}"
  sed -i "s/LIB1__/${new_name_upper}__/g" "test_${new_name}.${type}"

  echo "$new_name unit test file updated"
  popd >/dev/null
  return 1
}

# Function to update the template file with a new class name
updateTemplate() {
  local dir_path=$1
  local new_name=$2
  local new_name_upper=$(echo "$new_name" | tr '[:lower:]' '[:upper:]')
  local type=$3

  pushd "$dir_path" >/dev/null

  echo "Renaming Template.${type} to ${new_name}.${type}"
  mv "Template.${type}" "${new_name}.${type}"

  if [[ "$type" == "hpp" ]]; then
    echo "Updating template header contents"
    sed -i "s/Lib1/$new_name/g" "${new_name}.${type}"
    sed -i "s/LIB1__/${new_name_upper}__/g" "${new_name}.${type}"
    sed -i "s/App1/$new_name/g" "${new_name}.${type}"
    sed -i "s/APP1__/${new_name_upper}__/g" "${new_name}.${type}"
  else
    echo "Updating template source contents"
    sed -i "s|//#include \"Lib1/Template.hpp\"|#include \"$new_name/$new_name.hpp\"|g" "${new_name}.${type}"
  fi

  popd >/dev/null
  return 1
}

# Function to update the directory with the template files
updateDirectory() {
  local dest_dir=$1
  local name=$2

  echo "Renaming ${dest_dir}/inc/Lib1 to ${dest_dir}/inc/${name}"
  mv "${dest_dir}/inc/Lib1" "${dest_dir}/inc/${name}"

  # Update the template files
  updateTemplate "${dest_dir}/inc/${name}" "$name" "$HPP"
  updateTemplate "${dest_dir}/src" "$name" "$CPP"
  updateTest "${dest_dir}/test" "$name" "$CPP"

  echo "${name}'s files updated"
  return 1
}

# Main command handling
case $1 in
dir)
  # Initialize the repository
  updateDirectory "$INPUT_PATH" "$INPUT_NAME" "$INPUT_TYPE"
  ;;
template)
  updateTemplate "$INPUT_PATH" "$INPUT_NAME" "$INPUT_TYPE"
  ;;
*)
  echo "Unknown command: $1"
  ;;
esac
