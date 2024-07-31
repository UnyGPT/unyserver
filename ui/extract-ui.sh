#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

echo "SCRIPT_DIR: $SCRIPT_DIR"

CONFIG_SH="$SCRIPT_DIR/../config.sh"

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

LAST_RELEASE=$( ls --full-time ${PROJECT_NAME}_ui-* | awk '{print $6$7 " " $9}' | sort | awk '{print $2}' | tail -n 1 )

echo $LAST_RELEASE

unzip -o $LAST_RELEASE

echo "----------------------------------------------------------------------"

head release-manifest.json -n 10

echo "..."
