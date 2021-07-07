#/bin/bash

echo "-------------------------------------------------------------------------------------------"

echo "当前对外服务端口"
netstat -antl|grep LISTEN >tmp_port.txt
netstat -anul >>tmp_port.txt

file1=tmp_port.txt
file2=/var/local/sec/port.txt
diff $file1 $file2 -s


