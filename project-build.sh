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

sudo mkdir -p "$PROJECT_LOG_DIR"
sudo chown "$PROJECT_NAME:$PROJECT_NAME" "$PROJECT_LOG_DIR"

cp "$CONFIG_SH" ~/.unyserver-config.sh

mkdir -p "$PROJECT_API_DIR"

cp $SCRIPT_DIR/api/*.sh "$PROJECT_API_DIR/"

mkdir -p "$PROJECT_UI_DIR"

cp $SCRIPT_DIR/ui/*.sh "$PROJECT_UI_DIR/"

mkdir -p "$PROJECT_CACHE_DIR"

cd "$PROJECT_DIR"

set +x

echo "================================================================="

ls -al
