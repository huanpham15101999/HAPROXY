#! /bin/bash
echo "Nhap Domain: "
read a
echo "Nhap VIP: "
read b
echo | openssl s_client -servername $a -connect $b:443 2>/dev/null | openssl x509 -noout -dates
