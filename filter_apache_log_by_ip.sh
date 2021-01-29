#!/bin/bash

regex_valid_ip_address="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

cd ./apache-log

if [[ $1 =~ $regex_valid_ip_address ]]
then
    cat apache.log | grep $1
    if [ $? -ne 0 ]
    then
        echo "IP address does not exist in file"
    fi
else
    echo "IP address does not valid"
fi