#!/bin/bash

log_directory="/var/log/haproxy"

# Nguong 18GB
threshold=18874368

current=$(du -s "$log_directory" | awk '{print $1}')

if [ "$current" -lt "$threshold" ]; then
    echo "OK"
    exit 0;
else
    echo "/var/log/haproxy > 18GB. Deletion is in progress ..."  
    rm -rf "$log_directory"/haproxy.log.*
    exit 2;
fi
