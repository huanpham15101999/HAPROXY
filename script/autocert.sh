#!/bin/sh

unzip '*.zip' > /dev/null 2>&1 && rm -rf *.zip

for i in `ls`; do mv "$i" "`echo $i | tr '[A-Z]' '[a-z]' | tr '_' '.'`" 2>/dev/null; done

while read LINE; do
  cat star.$LINE.key.nopass star.$LINE.crt star.$LINE.ca-bundle > star.$LINE.pem
  echo -ne "\e[1;36mstar.$LINE.pem "
  openssl x509 -noout -enddate -in star.$LINE.pem
done < listcert.txt

mkdir -p pem
cp *.pem pem

#
while read LINE; do
  echo -n "{{ " > $LINE
  echo -n "$LINE" | tr '.' '_' >> $LINE
  echo " }}" >> $LINE
done < listcert.txt
#
