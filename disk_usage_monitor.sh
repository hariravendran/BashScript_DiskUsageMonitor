#!/bin/bash

# Script Name: disk_usage_monitor.sh
# Description: Monitors disk usage and sends a warning if usage exceeds the specified threshold.
# Usage: ./disk_usage_monitor.sh -t threshold_percentage

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# Error handling function
error_exit() {
    log "ERROR: $1"
    exit 1
}

# Parse command-line arguments
parse_args() {
    while getopts ":t:" opt; do
        case $opt in
            t) threshold="$OPTARG" ;;
            *) error_exit "Invalid option: -$OPTARG" ;;
        esac
    done

    if [[ -z "$threshold" ]]; then
        error_exit "Threshold percentage is required."
    fi
}

# Check disk usage
check_disk_usage() {
    log "INFO: Checking disk usage..."

    # Get the current disk usage percentage for the root filesystem
    usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

    log "INFO: Current disk usage is at $usage%."

    if (( usage >= threshold )); then
        log "WARNING: Disk usage has exceeded the threshold of $threshold%!"
        # You can add notification logic here, e.g., send an email or alert.
    else
        log "INFO: Disk usage is within safe limits."
    fi
}

# Main function
main() {
    parse_args "$@"
    check_disk_usage
}

# Run the script
main "$@"
