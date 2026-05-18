#!/bin/bash 
#Purpose - Monitor cpu.
#Owner - Nithin Reddy
#Modification Date - 16/05/2026
#!/bin/bash 
#!/bin/bash

THRESHOLD=80
EMAIL="admin@example.com"

echo "========================="
echo "    CPU MONITOR SCRIPT"
echo "========================="
echo "Threshold : ${THRESHOLD}%"
echo "Email     : $EMAIL"
echo "Timestamp : $(date '+%Y-%m-%d %H:%M:%S')"
echo "Hostname  : $(hostname)"
echo "-------------------------"

# Get CPU usage
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{for(i=1;i<=NF;i++) if($i~/id/){val=$(i-1); gsub(/%/,"",val); print val; exit}}')
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc | awk '{printf "%.1f", $1}')

echo "CPU Idle  : ${CPU_IDLE}%"
echo "CPU Usage : ${CPU_USAGE}%"
echo "-------------------------"
echo "Top 5 CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6
echo "-------------------------"

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
  echo "Status    : ⚠ ALERT - CPU HIGH!"
  echo "Action    : Email sent to $EMAIL"
  mail -s "ALERT: CPU usage ${CPU_USAGE}% on $(hostname)" $EMAIL <<< "CPU usage is ${CPU_USAGE}% which exceeded ${THRESHOLD}%"
else
  echo "Status    : ✔ NORMAL - No Alert"
  echo "Action    : No email sent"
fi

echo "========================="
 
ggdg
gg        # go to first line
dG        # delete everything to last line

