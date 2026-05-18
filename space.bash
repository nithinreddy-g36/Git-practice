#!/bin/bash

THRESHOLD=80
EMAIL="admin@example.com"

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

echo "========================="
echo "   DISK SPACE MONITOR"
echo "========================="
echo "Disk Usage : ${DISK_USAGE}%"
echo "Threshold  : ${THRESHOLD}%"
echo "-------------------------"

if [[ $DISK_USAGE -gt $THRESHOLD ]]; then
  echo "Status     : ⚠ ALERT - DISK HIGH!"
  echo "Action     : Email sent to $EMAIL"
  mail -s "Disk Alert" $EMAIL <<< "Disk usage is ${DISK_USAGE}%"
else
  echo "Status     : ✔ NORMAL - No Alert"
  echo "Action     : No email sent"
fi

echo "========================="
