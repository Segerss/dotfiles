#!/bin/bash

pathtocheck=$(find . -type f,d -name '*' | fzf) 
file_info=$(stat -c "%F" "$pathtocheck")

if [ "$file_info" = "directory" ]; then
    cd $pathtocheck
elif [ "$file_info" = "regular file" ]; then
    file_directory=$(dirname "$pathtocheck")
    cd $file_directory
else
    echo "Something went very wrong"
fi
