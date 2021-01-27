#!/bin/bash

BASE_PATH="~/Documentos/Courses/Shell/imagens-novos-livros"

convert_image() {
    local path_image=$1
    local image_without_extension=$(ls $path_image | awk -F.jpg '{ print $1 }')
    convert $image_without_extension.jpg $image_without_extension.png
}

directory_scan() {
    cd $1
    for file in *
    do
        local path_file=$(find $BASE_PATH -name $file)
        if [ -d $path_file ]
        then
            directory_scan $path_file
        else
            convert_image $path_file
        fi
    done
}

directory_scan $BASE_PATH

if [ $? -eq 0 ]
then
    echo "Successful image conversion"
else
    echo "Failed image conversion"
fi