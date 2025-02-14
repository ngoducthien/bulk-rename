#!/bin/bash

# Define the folder containing the files
folder="/path/to/your/folder"

# Define the pattern to be replaced and the replacement
pattern="old_pattern"
replacement="new_pattern"

# Change to the specified folder
cd "$folder" || { echo "Directory not found: $folder"; exit 1; }

# Loop through all files and rename them based on the defined pattern
for f in *.*; do
  # Check if the file name contains the pattern to avoid unnecessary renaming
  if [[ "$f" == *"$pattern"* ]]; then
    # Rename the file by replacing the pattern with the new replacement
    new_name=$(echo "$f" | sed "s/$pattern/$replacement/")
    mv "$f" "$new_name"
    echo "Renamed: $f -> $new_name"
  fi
done

# List the files after renaming
ls -l
