#/bin/bash

echo 检查自启动文件
cat /etc/rc.local	 > tmp_rc_local.txt

#比较当前，和原始正常文件，是否有多余项dd
file1=tmp_rc_local.txt
file2=/var/local/sec/rc_local.txt
echo /etc/rc.local:
diff $file1 $file2 -s


level=$(runlevel |cut -d " " -f 2)
echo 当前运行级别：$level
ls -l /etc/rc$level.d/	> tmp_rc_local.txt
file2=/var/local/sec/rcxd.txt
echo /etc/rc$level.d:
diff $file1 $file2 -s 

