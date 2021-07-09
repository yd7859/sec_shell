#/bin/bash

echo 检查自启动文件
ls -l  /usr/bin	 > tmp_bin.txt

#比较当前，和原始正常文件，是否有多余项dd
file1=tmp_bin.txt
file2=/var/local/sec/usrbin.txt
echo /usr/bin:
diff $file1 $file2 -s


ls -l /usr/sbin	> tmp_bin.txt
file2=/var/local/sec/usrsbin.txt
echo /usr/sbin:
diff $file1 $file2 -s 

ls -l /bin > tmp_bin.txt
file2=/var/local/sec/bin.txt
echo /bin:
diff $file1 $file2 -s

rm -rf tmp_bin.txt
