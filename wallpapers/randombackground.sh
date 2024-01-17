#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the directory path where your .png files are located
directory=$script_dir

# Check if the directory exists
if [ -d "$directory" ]; then
    # Get a list of .png files in the directory
    png_files=("$directory"/*.jpg)
    
    # Check if there are any .png files
    if [ ${#png_files[@]} -gt 0 ]; then
        # Seed the random number generator with the current time
        RANDOM=$(date +%s)

        # Generate a random index to select a file
        random_index=$((RANDOM % ${#png_files[@]}))
        
        # Get the random .png file
        random_png="${png_files[$random_index]}"
        
        # Echo the random .png file name
        echo "Random .png file: $random_png"
                
        /usr/bin/feh --bg-scale $random_png
    else
        echo "No .png files found in the specified directory."
    fi
else
    echo "Directory not found: $directory"
fi

