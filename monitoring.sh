#!/bin/bash
sleeptime=5
duration=3600
start=$(date +%s)
end=$((start + duration))
current=$start
echo "Date: $(date)" >> /opt/monitoring.txt
while [ $current -lt $end ]
do
    
    mem=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
    disk=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
    cpu=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')

    echo "$(date +%T) - Memory: $mem | Disk: $disk | CPU: $cpu"
    
    echo "$(date +%T) - Memory: $mem | Disk: $disk | CPU: $cpu" >> /opt/monitoring.txt

    
    sleep $sleeptime

    
    current=$(date +%s)
done

