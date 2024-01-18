#!/bin/bash

current_connect=$(curl -s  -u hametric:khxHUNpQL9lz6S http://192.168.6.29:8404/metrics | grep "haproxy_process_current_connections" | grep -v "#" | awk '{ print $2 }')

max_connect=$(curl -s  -u hametric:khxHUNpQL9lz6S http://192.168.6.29:8404/metrics | grep "haproxy_process_max_connections" | grep -v "#" | awk '{ print $2 }')


if [[ $current_connect -lt $max_connect ]]
then
  echo "Ok. Current connections: $current_connect is lower max connections: $max_connect"
  exit 0;
else
  echo "Critical. Current connections: $current_connect is higher max connections: $max_connect"
  exit 2;
fi
