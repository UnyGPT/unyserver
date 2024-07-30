#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

echo "SCRIPT_DIR: $SCRIPT_DIR"

CONFIG_SH="$SCRIPT_DIR/config.sh"

echo "CONFIG_SH: $CONFIG_SH"

# Check if the configuration file exists
if [ ! -f "$CONFIG_SH" ]; then
  echo "** Configuration file $CONFIG_SH not found!"
  exit 1
fi

echo "================================================================="

set -x

source "$CONFIG_SH"

mkdir -p "$PROJECT_LOG_DIR"

mkdir -p "$PROJECT_API_DIR"

mkdir -p "$PROJECT_UI_DIR"

mkdir -p "$PROJECT_CACHE_DIR"

cd "$PROJECT_DIR"

set +x

echo "================================================================="

ls -al
