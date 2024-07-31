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

gsutil ls -l "gs://$GCS_BUCKET_RELEASES/${PROJECT_NAME}_api/${PROJECT_NAME}_api*" | sort -k 2 | awk '{print $3}' | grep "gs:/"
