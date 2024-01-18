#!/bin/bash

ip_list=("123.30.53.23" "123.30.53.24" "123.30.53.25" "123.30.53.26" "123.30.53.27")
ip_failed=()
count=0

for ip in "${ip_list[@]}"; do 
	(timeout 0.1 nc -zv $ip 80 && timeout 0.1 nc -zv $ip 443) > /dev/null 2>&1

	if [ $? -eq 0 ]; then
		((count++))
	else 
		ip_failed+=($ip) 
	fi
done

if [ $count -eq 5 ]; then
	echo "OK"
	exit 0
else 
	echo "Failed to connect port 80 or 443: ${ip_failed[@]}"
	exit 2
fi
