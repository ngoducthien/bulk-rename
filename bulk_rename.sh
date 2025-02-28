#!/bin/bash

# Load variables from the external file
source variables.conf

# Function to display usage
usage() {
  echo "Usage: $0 [-h]"
  echo
  echo "This script renames files in a specified folder by replacing a pattern in filenames."
  echo
  echo "Configuration is stored in 'variables.conf':"
  echo "  folder=\"/path/to/your/folder\"   # Folder containing files"
  echo "  pattern=\"old_pattern\"           # Text to replace"
  echo "  replacement=\"new_pattern\"       # New text for replacement"
  echo
  echo "Run the script without arguments after setting 'variables.conf':"
  echo "  ./bulk_rename.sh"
  exit 0
}

# Check for help flag
if [[ "$1" == "-h" ]]; then
  usage
fi

# Check if the folder is set
if [[ -z "$folder" || -z "$pattern" || -z "$replacement" ]]; then
  echo "Error: Missing required variables in variables.conf"
  exit 1
fi

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
