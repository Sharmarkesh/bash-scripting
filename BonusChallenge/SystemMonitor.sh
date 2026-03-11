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

# Function to get CPU usage
get_cpu_usage() {
  top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
  }

# Function to get memory usage
get_memory_usage() { 
    free -h | awk 'NR==3{printf "Used: %s / Total: %s / free: %s\n" , $3, $2,$4 }'
}

# Function to get disk usage
get_disk_usage() {
    df -h | grep '/' | awk '{print $5}'
}

get_top_5_processMem(){
echo " Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 

}
# Main monitoring function
monitor_system() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    local cpu_usage=$(get_cpu_usage)
    local memory_usage=$(get_memory_usage)
    local disk_usage=$(get_disk_usage)
    local top_mem=$(get_top_5_processMem) 
    
    echo "$timestamp - CPU:$cpu_usage, Memory:$memory_usage, Disk:$disk_usage" >> "$LOG_FILE"
    echo ""
    echo "Top 5 Processes by Memory Usage"
    echo "$top_mem" >> "$LOG_FILE"
}

# Run the monitoring function
monitor_system
