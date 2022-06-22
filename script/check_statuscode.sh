#! /bin/bash

echo -e "\e[1;31m------------------------------------------------------------"
echo -e "\e[1;32mstatus http"
echo -e "\e[1;31m------------------------------------------------------------"

while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} http://$LINE\n" "$LINE"
done < statuscode.txt

echo -e "\e[1;31m------------------------------------------------------------"
echo -e "\e[1;32mstatus https"
echo -e "\e[1;31m------------------------------------------------------------"

while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} https://$LINE\n" "$LINE"
done < statuscode.txt

# statuscode.txt là file list domain
