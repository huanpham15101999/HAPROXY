#! /bin/bash 

echo -e "\e[1;31m------------------------------------------------------------"
echo -e "\e[1;32mGen config Haproxy"
echo -e "\e[1;31m------------------------------------------------------------"

echo "Nhap domain:"
read a
echo "So luong Backend:"
read b
declare -a array
for ((i=1;i<=b;i++))
do
    echo "Nhap Backend $i:"
    read array[$i]
done

echo -e "\e[1;32m------------------------------------------------------------"
echo "http-request redirect prefix https://$a code 301 if { hdr(host) -i $a }
use_backend http_$a if { hdr(host) -i $a }
backend http_$a
        mode http
        balance roundrobin"
for i in ${array[@]}
do
    echo "        server $i $i check inter 2000 rise 2 fall 10"
done
echo -e "\e[1;32m------------------------------------------------------------"
