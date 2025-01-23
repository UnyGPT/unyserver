#!/bin/bash

cd /home/foo/gatekeeper

ACCESS_KEY="123abc"

gatekeeper --port 2243 --allowed-ports 8080 --access-key - >> /var/log/foo/gatekeeper.log  2>&1  <<EOF
$ACCESS_KEY
EOF
