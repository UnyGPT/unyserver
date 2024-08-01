#!/bin/bash

CONFIG_SH="$HOME/.unyserver-config.sh"

echo "CONFIG_SH: $CONFIG_SH"

# Check if the configuration file exists
if [ ! -f "$CONFIG_SH" ]; then
  echo "** Configuration file $CONFIG_SH not found!"
  exit 1
fi

echo "================================================================="

set -x

source "$CONFIG_SH"

cd "$PROJECT_API_DIR";

chmod 755 $API_SERVER_EXE
sudo setcap 'cap_net_bind_service=+ep' $API_SERVER_EXE
