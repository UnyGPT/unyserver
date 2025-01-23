#!/bin/bash

cd /home/foo/gatekeeper

ACCESS_KEY="123abc"

gatekeeper --port 2243 --allowed-ports 8080 -verbose --access-key - <<EOF
$ACCESS_KEY
EOF
