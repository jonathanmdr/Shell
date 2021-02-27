#!/bin/bash

set -e

BASE_PATH="$HOME/Documentos/Courses/Shell/imagens-livros"

convert_image() {
    cd "$BASE_PATH"

    if [ ! -d png ]; then
        mkdir png
    fi

    for image in *.jpg
    do
        image_without_extension=$(find "$image" | awk -F. '{ print $1 }')
        convert "$image_without_extension".jpg png/"$image_without_extension".png
    done
}

convert_image 2 > log_error.txt

if [ "$?" -eq 0 ]; then
    echo "Successful image conversion"
else
    echo "Failed image conversion"
fi
