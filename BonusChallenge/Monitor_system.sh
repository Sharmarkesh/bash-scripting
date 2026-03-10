#!/bin/bash

# ============================================================
#  Create a script  for System Monitor
# ============================================================
#Create a script that displays:
#Current CPU usage
#Memory usage (total, used, free)
#Disk usage
#Top 5 processes by memory
#Save the output to a log file with timestamp

# File to log the results
LOG_FILE="system_monitor.txt"

# Get disk usage %
#USAGE=$(df -h / | grep '/' | awk '{print $5}' | sed 's/%//')
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
#MEMORY=$(free  | awk '/Mem/ {printf("%.2f"), $3/$2 *100}')
#memUsage=$(free -h | awk '$NF=="/"{printf "Used: %s / Total: %s\n", $3, $2}')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
#CPU=$( top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"})

echo "Current tine:$TIMESTAMP - CPU: $CPU, Memory: $memUsage, Disk: $DISK" , "Top 5 processes by memory usage:" ps -eo pid,comm,%mem --sort=-%mem | head -n 6>> "$LOG_FILE"


#echo "Top 5  process by memory"
#ps -eo pid,ppid,cmd,%mem,%cpu,rss --sort=-%mem | head -n 6
#ps -l | head -n 6

#echo "Top 5 processes by memory usage:"
#ps -l %mem  | head -n 6
