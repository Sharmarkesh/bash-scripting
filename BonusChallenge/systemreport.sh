#!/bin/bash
# ============================================================
#  System Monitor Script
# ============================================================
# Displays:
#   - Current CPU usage
#   - Memory usage (total, used, free)
#   - Disk usage
#   - Top 5 processes by memory
#   - Saves output to a log file with timestamp
# ============================================================

# File to log the results
LOG_FILE="system_monitor.txt"

# ------------------------------------------------------------
# Function to get CPU usage
# ------------------------------------------------------------
get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" \
        | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' \
        | awk '{printf "%.1f%%", 100 - $1}'
}

# ------------------------------------------------------------
# Function to get memory usage (total, used, free)
# ------------------------------------------------------------
get_memory_usage() {
    vm_stat -m | awk 'NR==2 {
        printf "Total: %dMB | Used: %dMB (%.1f%%) | Free: %dMB",
        $2, $3, ($3/$2)*100, $4
    }'
}

# ------------------------------------------------------------
# Function to get disk usage
# ------------------------------------------------------------
get_disk_usage() {
    df -h | awk 'NR==1 || /^\// {
        printf "  %-25s %-6s %-6s %-6s %s\n", $1, $2, $3, $4, $5
    }'
}

# ------------------------------------------------------------
# Function to get top 5 processes by memory
# ------------------------------------------------------------
get_top_5_processMem() {
    echo ""
    echo "  Top 5 Processes by Memory Usage:"
    echo ""
    ps -eo pid,comm,%mem,%cpu --sort=-%mem \
        | awk 'NR==1 {printf "  %-8s %-20s %-8s %-8s\n", $1,$2,$3,$4}
               NR>1 && NR<=6 {printf "  %-8s %-20s %-8s %-8s\n", $1,$2,$3,$4}'
}

# ------------------------------------------------------------
# Main monitoring function
# ------------------------------------------------------------
monitor_system() {
    local timestamp
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    local cpu_usage
    local memory_usage
    local disk_usage
    local top_mem

    cpu_usage=$(get_cpu_usage)
    memory_usage=$(get_memory_usage)
    disk_usage=$(get_disk_usage)
    top_mem=$(get_top_5_processMem)

    # Build report — tee prints to terminal AND appends to log file
    {
        echo "============================================================"
        echo "  SYSTEM MONITOR REPORT"
        echo "  Timestamp : $timestamp"
        echo "============================================================"
        echo ""
        echo "  CPU USAGE"
        echo "  └─ $cpu_usage"
        echo ""
        echo "  MEMORY USAGE"
        echo "  └─ $memory_usage"
        echo ""
        echo "  DISK USAGE"
        echo "$disk_usage"
        echo "$top_mem"
        echo ""
        echo "============================================================"
        echo ""
    } | tee -a "$LOG_FILE"

    echo "  ✔  Report saved to: $LOG_FILE"
    echo ""
}

# Run the monitoring function
monitor_system