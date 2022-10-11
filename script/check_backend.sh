#!/bin/bash
# nagios user execute command "sudo socat stdio /run/haproxy/admin.sock" without password
# Variable
FILE_ADMIN_HAPROXY="/var/run/haproxy/haproxy.sock"

# Programing
backend_down_status=`echo "show stat" | sudo socat stdio $FILE_ADMIN_HAPROXY | cut -d ',' -f 1,2,18,37,57 | egrep -i backend | egrep -i down`
backend_up_status=`echo "show stat" | sudo socat stdio $FILE_ADMIN_HAPROXY | cut -d ',' -f 1,2,18,37,57 | egrep -i backend | egrep -i up`

backend_member_down_status=`echo "show stat" | sudo socat stdio $FILE_ADMIN_HAPROXY | cut -d ',' -f 1,2,18,37,57 | egrep -v -i backend | egrep -i down`
backend_member_up_status=`echo "show stat" | sudo socat stdio $FILE_ADMIN_HAPROXY | cut -d ',' -f 1,2,18,37,57 | egrep -v -i backend | egrep -i up`

if [ "$backend_down_status" ]; then
    echo -e "----------CRITICAL----------\n$backend_down_status"
    echo -e "----------WARNING----------\n$backend_member_down_status"
    exit 2
elif [ "$backend_member_down_status" ]; then
    echo -e "----------WARNING----------\n$backend_member_down_status"
    exit 1
elif [ -z "$backend_member_down_status" ]; then
    echo -e "----------OK----------\nAll backends are up"
    exit 0
else
        echo -e "UNKNOWN"
    exit 3
fi
