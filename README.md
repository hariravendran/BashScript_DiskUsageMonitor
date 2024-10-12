# Disk Usage Monitor

## Overview

The **Disk Usage Monitor** is a simple Bash script that monitors the disk usage of the root filesystem and sends a warning if the usage exceeds a specified threshold. This can help system administrators keep track of disk space and prevent issues related to low disk availability.

## Features

- Checks the current disk usage percentage for the root filesystem.
- Sends a warning log message if the usage exceeds the defined threshold.
- Easy to use command-line interface.

## Requirements

- Bash shell
- `df` and `awk` utilities (typically pre-installed on Unix-like systems)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/disk_usage_monitor.git
   cd disk_usage_monitor
   ```

2. Make the script executable:

   ```bash
   chmod +x disk_usage_monitor.sh
   ```

## Usage

Run the script with the following command:

```bash
./disk_usage_monitor.sh -t <threshold_percentage>
```

### Options

- `-t`: Specify the threshold percentage (0-100) for disk usage. A warning will be logged if the current usage exceeds this value.

### Example

To set a threshold of 80%:

```bash
./disk_usage_monitor.sh -t 80
```

## Logging

The script logs messages with timestamps to the console. You can modify the logging function to write logs to a file or send notifications as needed.

