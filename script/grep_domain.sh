cat grepdomain.txt |grep 'hdr(host)'| awk '{split($0,a,"-i"); print a[2]}'|tr -d '}'| tr ' ' '\n' | grep '\S'| sort -u
# grepdomain.txt là file config Haproxy
