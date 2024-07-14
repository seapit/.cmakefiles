#!/bin/bash

# Directory to list
directory="/workspaces/cpp"

# List directories within the specified directory
directories=()
while IFS= read -r -d '' dir; do
    directories+=("$dir")
done < <(find "$directory" -maxdepth 1 -type d -not -path "$directory" -print0)

# Print the directories as JSON array
echo "${directories[@]}"