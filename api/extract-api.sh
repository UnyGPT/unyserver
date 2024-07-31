#!/bin/bash

CONFIG_SH="~/.unyserver-config.sh"

echo "CONFIG_SH: $CONFIG_SH"

# Check if the configuration file exists
if [ ! -f "$CONFIG_SH" ]; then
  echo "** Configuration file $CONFIG_SH not found!"
  exit 1
fi

echo "================================================================="

set -x

source "$CONFIG_SH"

rm -rf ./packages

LAST_RELEASE=$( ls --full-time ${PROJECT_NAME}_api-* | awk '{print $6$7 " " $9}' | sort | awk '{print $2}' | tail -n 1 )

echo $LAST_RELEASE

unzip -o $LAST_RELEASE

./setup-api_server.sh
