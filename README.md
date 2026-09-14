# System Monitor Script

A simple Bash script that provides a quick snapshot of your system's vital statistics, including CPU usage, memory usage, disk usage, and the top 5 memory-consuming processes.

## Features

- **CPU Usage**: Displays current overall CPU utilization percentage
- **Memory Usage**: Shows total, used, and free memory in MB
- **Disk Usage**: Displays disk usage information for the root filesystem
- **Top 5 Processes**: Lists the top 5 processes by memory consumption

## Requirements

- Linux-based operating system
- Bash shell
- Standard Unix utilities: `ps`, `free`, `df`, `awk`, `head`

## Usage

### Make the script executable

```bash
chmod +x system_monitor.sh
```

### Run the script

```bash
./system_monitor.sh
```

Or run it directly with Bash:

```bash
bash system_monitor.sh
```

## Output Example

```
====================
 SYSTEM MONITOR
====================

   CPU USAGE
====================
Current CPU Usage: 12.5%

  MEMORY USAGE
====================
Total Memory: 8192 MB
Used Memory: 4096 MB
Free Memory: 2048 MB

   DISK USAGE
====================
Filesystem      Size       Used       Avail      Use%       Mounted
/dev/sda1       100G       45G        50G        45%        /

 TOP 5 PROCESSES BY MEMORY USAGE
=======================================================
USER            PID        COMMAND                  %MEM
root            1234       firefox                  15.2
user            5678       chrome                   12.8
...
```

## Script Structure

| Function | Description |
|----------|-------------|
| `current_cpu_usage()` | Calculates and displays total CPU usage |
| `current_memory_usage()` | Displays total, used, and free memory |
| `get_disk_usage()` | Shows disk usage for the root partition |
| `top_5_process_by_mem()` | Lists the top 5 processes by memory usage |

## Installation (Optional)

To run the script from anywhere, move it to a directory in your PATH:

```bash
sudo mv system_monitor.sh /usr/local/bin/system_monitor
sudo chmod +x /usr/local/bin/system_monitor
```

Then run it with:

```bash
system_monitor
```

## Scheduling with Cron (Optional)

To run the monitor periodically, add it to your crontab:

```bash
crontab -e
```

Example: Run every hour and log output

```cron
0 * * * * /path/to/system_monitor.sh >> /var/log/system_monitor.log 2>&1
```

## Notes

- The script uses `set -eu` to exit immediately on errors or unset variables, ensuring reliable execution.
- CPU usage is calculated as the sum of `%cpu` across all processes, which may differ slightly from other monitoring tools.
- Memory values are reported in megabytes (MB).

## License

This script is provided as-is for personal and educational use. Feel free to modify and distribute as needed.
