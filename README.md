# Bulk-Rename

## Overview

This script renames all files in a specified folder based on a predefined pattern. It allows users to easily modify file names by replacing a specific pattern with a new one. The script also includes basic error handling and logs each renamed file for easy tracking.

## Usage:
1. **Set the Folder Path**: Define the path to the folder containing the files you want to rename by modifying the folder variable in `variables.conf`.

2. **Set the Pattern and Replacement**: Adjust the pattern variable to specify the text you want to replace, and the replacement variable to define the new text in `variables.conf`.

3. **Run the Script**: Execute the script **bulk_rename.sh** in a terminal. It will rename all files in the folder that match the defined pattern, replacing it with the new pattern.

## Example:

Before running, edit the `variables.conf` file to set the appropriate values:

```bash
# Set the folder path
folder="/path/to/your/folder"

# Set the pattern and replacement
pattern="old_pattern"
replacement="new_pattern"

# Run the script
./rename_files.sh       # Renames files according to variables.conf
./rename_files.sh -h    # Displays usage instructions
```
