#!/bin/bash

cd /home/foo/gatekeeper


ACCESS_KEY="123abc"


while true; do
    
    gatekeeper --port 2243 --allowed-ports 8080 --access-key $ACCESS_KEY >> /var/log/foo/gatekeeper.log  2>&1

    if [ $? -ne 0 ]; then
        echo "** Gatekeeper Server crashed! Restarting..."
    else
        break
    fi

done