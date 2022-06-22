C1: Dung lenh 
curl -o /dev/null -s -w 'Total: %{time_total}s\n' http://103.107.180.235/
C2: Tao file curl-format.txt
     time_namelookup:  %{time_namelookup}\n
        time_connect:  %{time_connect}\n
     time_appconnect:  %{time_appconnect}\n
    time_pretransfer:  %{time_pretransfer}\n
       time_redirect:  %{time_redirect}\n
  time_starttransfer:  %{time_starttransfer}\n
                     ----------\n
          time_total:  %{time_total}\n          
Dung lenh
curl -w "@curl-format.txt" -o /dev/null -s "http://103.107.180.235/"
