#!/bin/bash
for cert in `ls | grep ".key" | awk '{split($0,a,".key"); print a[1]}'`
do
  cat $cert.key $cert.cer > $cert.pem
  sed -i '/^subject/d;/^issuer/d;/^$/d' $cert.pem
  echo -ne "\e[0;36m$cert.pem "  
  checkdate=$(openssl x509 -noout -enddate -in $cert.pem)
  echo -ne "\e[0;31m$checkdate\n"
done

if [ ! -d pemfolder ]
then
  mkdir -p pemfolder
else
  rm -rf pemfolder/*
fi

mv *.pem pemfolder

echo -ne "\e[0;32mAll pem file is in pemfolder\n"
