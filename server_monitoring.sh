#!/bin/bash

SERVER_URL="http://localhost"
EMAIL_FROM="my.email@gmail.com"

http_status_code=$(curl --write-out %{http_code} --silent --output /dev/null $SERVER_URL)

send_email_alert() {
    mail -s "[DEVOPS-Alerts] Server Alura Multilidae is down" $EMAIL_FROM<<EOF
    The server does is not responding HTTP status OK.     
    Actual Status HTTP: $http_status_code

    Restarting the server automatically.

    By: DEVOPS-Alerts
EOF
}

if [ $http_status_code -ne 200 ]
then
    send_email_alert $http_status_code

    systemctl restart apache2    
fi