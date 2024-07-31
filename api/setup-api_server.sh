#!/bin/bash

chmod 755 api_server
sudo setcap 'cap_net_bind_service=+ep' api_server
