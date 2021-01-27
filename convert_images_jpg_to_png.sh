#!/bin/bash

convert_image() {
    cd ~/Documentos/Courses/Shell/imagens-livros

    if [ ! -d png ]
    then
        mkdir png
    fi

    for image in *.jpg
    do
        image_without_extension=$(ls $image | awk -F. '{ print $1 }')
        convert $image_without_extension.jpg png/$image_without_extension.png
    done
}

convert_image 2 > log_error.txt

if [ $? -eq 0 ]
then
    echo "Successful image conversion"
else
    echo "Failed image conversion"
fi
