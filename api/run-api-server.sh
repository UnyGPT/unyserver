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

## -allow-request-letsencrypt-certificate

export DART_VM_OPTIONS=--verbose_gc,--old_gen_heap_size=1500

./$API_SERVER_EXE api-prod-gcp-valid.yaml --port 80 --address 0 -cookieless -letsencrypt -letsencrypt-production >> /var/log/$PROJECT_NAME/api_server.log  2>&1

