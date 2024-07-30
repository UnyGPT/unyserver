#!/bin/bash

# Get the total RAM in kilobytes and convert it to megabytes
total_ram_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
total_ram_mb=$(echo "$total_ram_kb / 1024" | bc)

echo "$total_ram_mb"
