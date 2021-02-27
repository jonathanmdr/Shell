#!/bin/bash

cd "$HOME/Documentos/Courses/Shell/apache-log" || exit 1

filter() {
    cat apache.log | grep "$1"
}

to_upper() {    
    echo "$(echo "$1" | awk '{ print toupper($1) }')"
}

if [ -z "$1" ]; then
    while [ -z "$parameter" ]
    do
        read -p "Inform a parameter for filter: (GET/POST/PUT/DELETE) -> " parameter
        parameter_upper=$(to_upper "$parameter")
    done
else
    parameter_upper=$(to_upper "$1")
fi

case "$parameter_upper" in
    GET)
    filter GET
    ;;

    POST)
    filter POST
    ;;

    PUT)
    filter PUT
    ;;

    DELETE)
    filter DELETE
    ;;

    *)
        echo "Parameter does not valid"
    ;;
esac