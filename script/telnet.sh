#!/bin/bash
while read LINE; do
  timeout 0.1 nc -vz  $LINE
done < telnet.txt
# telnet.txt là file list IP & Port
