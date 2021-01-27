#!/bin/bash

if [ ! -d log ]
then
    mkdir log
fi

process_analyzer() {
    pid_processes=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

    for pid in $pid_processes
    do
        local process_name=$(ps -p $pid -o comm=)
        echo -n $(date +%F,%H:%M:%S,) >> log/$process_name.log
        local process_size=$(ps -p $pid -o size | grep [0-9])
        echo "$(bc <<< "scale=2;$process_size/1024") MB" >> log/$process_name.log
    done
}

process_analyzer

if [ $? -eq 0 ]
then
    echo "Successful process analyzer execution"
else
    echo "Failed process analyzer execution"
fi