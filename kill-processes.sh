#!/bin/bash

# Show the processes:

ps aux | { for word in "$@"; do grep "$word"; done; } | grep -v kill-processes.sh | grep -v grep

# Find the processes and kill them:

ps aux | { for word in "$@"; do grep "$word"; done; } | grep -v kill-processes.sh | grep -v grep | awk '{print $2}' | xargs -r kill -9
