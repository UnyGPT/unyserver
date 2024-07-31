#!/bin/bash

# Find the processes and kill them

ps aux | grep api | grep -v grep | awk '{print $2}'

ps aux | grep api | grep -v grep | awk '{print $2}' | xargs -r kill -9
