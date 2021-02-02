#!/bin/bash

EMAIL_FROM="my.email@gmail.com"

total_memory=$(free | grep -i mem | awk '{ print $2 }')
used_memory=$(free | grep -i mem | awk '{ print $3 }')
percentage_memory_using=$(bc <<< "scale=2; $used_memory/$total_memory * 100" | awk -F. '{ print $1 }')

send_email_alert() {
    mail -s "[DEVOPS-Alerts] Server Alura Multilidae is with high memory consumption" $EMAIL_FROM<<EOF
    The server does is with high memory consumption.
    Actual memory usage: $(free -h | grep -i mem | awk '{ print $3 }')
    Total memory: $(free -h | grep -i mem | awk '{ print $2 }')

    By: DEVOPS-Alerts
EOF
}

if [ $percentage_memory_using -gt 50 ]
then
    send_email_alert 
fi