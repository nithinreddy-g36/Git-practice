#!/bin/bash
#Purpose : Nginx service is running
#Owner: Nithin Reddy
#Date: 15/05/2026
# Check if Nginx service is running
if systemctl is-active --quiet nginx
then
    echo "Nginx service is already running."
else
    echo "Nginx service is not running."

    # Start Nginx service
    systemctl start nginx

    echo "Nginx service started successfully."
fi

