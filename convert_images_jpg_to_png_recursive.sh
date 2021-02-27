#!/bin/bash

set -e

BASE_PATH="$HOME/Documentos/Courses/Shell/imagens-novos-livros"

function convert_image() {
    local path_image=$1
    local -r image_without_extension=$(find "$path_image" | awk -F.jpg '{ print $1 }')
    convert "$image_without_extension".jpg "$image_without_extension".png
}

function directory_scan() {
    cd "$1" || exit 1

    local path_file    
    
    for file in *
    do
        path_file=$(find "$BASE_PATH" -name "$file")
        if [ -d "$path_file" ]; then
            directory_scan "$path_file"
        else
            convert_image "$path_file"
        fi
    done
}

directory_scan "$BASE_PATH"

if [ "$?" -eq 0 ]; then
    echo "Successful image conversion"
else
    echo "Failed image conversion"
fi