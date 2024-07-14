#!/bin/bash

# Directory to list
directory="$1"

# Ensure the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory '$directory' does not exist."
    exit 1
fi

# List directories within the specified directory
directories=()
while IFS= read -r -d '' dir; do
    directories+=("$dir")
done < <(find "$directory" -maxdepth 1 -type d -not -path "$directory" -print0)

# Print the directories as JSON array
echo "${directories[@]}"