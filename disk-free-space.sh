#!/bin/bash

# Get the free space in kilobytes and convert it to megabytes
free_space=$(df --output=avail / | tail -n 1)
free_space_mb=$(echo "$free_space / 1024" | bc)

echo "$free_space_mb"
