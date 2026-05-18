#!/bin/bash

THRESHOLD=80
EMAIL="admin@example.com"

TOTAL=$(free -m | awk 'NR==2 {print $2}')
USED=$(free -m  | awk 'NR==2 {print $3}')
FREE=$(free -m  | awk 'NR==2 {print $4}')
MEM_USAGE=$(echo "scale=1; $USED * 100 / $TOTAL" | bc)

echo "========================="
echo "   MEMORY MONITOR"
echo "========================="
echo "Total  : ${TOTAL} MB"
echo "Used   : ${USED} MB"
echo "Free   : ${FREE} MB"
echo "Usage  : ${MEM_USAGE}%"
echo "Threshold : ${THRESHOLD}%"
echo "-------------------------"

if (( $(echo "$MEM_USAGE > $THRESHOLD" | bc -l) )); then
  echo "Status : ⚠ ALERT - MEMORY HIGH!"
  echo "Action : Email sent to $EMAIL"
  mail -s "Memory Alert" $EMAIL <<< "Memory usage is ${MEM_USAGE}%"
else
  echo "Status : ✔ NORMAL - No Alert"
  echo "Action : No email sent"
fi

echo "========================="
