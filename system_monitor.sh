#!/bin/bash
# A simple system monitor script to display CPU and memory usage

set -eu  # Exit immediately if a command exits with a non-zero status or if an unset variable is used

# Function to get current CPU usage
current_cpu_usage() {
    # Get overall system CPU utilization percentage
    cpu_usage=$(ps -eo %cpu --no-headers| awk '{sum+=$1} END {print sum}')

    echo -e "\n"
    echo -e "   CPU USAGE"
    echo -e "===================="
    echo -e "Current CPU Usage: $cpu_usage%"

}

# function to get current memory usage
current_memory_usage() {
    # Get total and used memory in MB
    total_mem=$(free -m | awk 'NR==2 {print $2}')
    used_mem=$(free -m | awk 'NR==2 {print $3}')
    free_mem=$(free -m | awk 'NR==2 {print $4}')

    echo -e "\n"
    echo -e "  MEMORY USAGE"
    echo -e "===================="
    echo "Total Memory: $total_mem MB"
    echo "Used Memory: $used_mem MB"
    echo "Free Memory: $free_mem MB"
    }

# function to get disk usage
get_disk_usage() {
    echo -e "\n"
    echo -e "   DISK USAGE"
    echo -e "===================="
    df -h / | awk 'NR==1 {printf "%-15s %-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, $6} NR==2 {printf "%-15s %-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, $6}'
}

# function to get top 5 processes by Memory Usage
top_5_process_by_mem() {
    echo -e "\n"
    echo -e " TOP 5 PROCESSES BY MEMORY USAGE"
    echo -e "======================================================="
echo -e "USER            PID        COMMAND                  %MEM"
    ps -eo user,pid,comm,%mem --sort=-%mem --no-headers | head -5 | awk '{printf "%-15s %-10s %-25s %-10s\n", $1, $2, $3, $4}'
}

# Main script execution
echo -e "\n===================="
echo -e " SYSTEM MONITOR"
echo -e "===================="

current_cpu_usage
current_memory_usage
get_disk_usage
top_5_process_by_mem
