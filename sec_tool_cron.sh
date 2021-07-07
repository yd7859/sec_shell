#/bin/bash

echo 检查定时执行文件
crontab -l >tmp_crontab.txt

#比较当前，和原始正常文件，是否有多余项目
file1=tmp_crontab.txt
file2=/var/local/sec/crontab_l.txt
diff $file1 $file2 -s

ls -l /etc/crontab | grep '^#' >tmp_crontab.txt

file2=/var/local/sec/crontab.txt
diff $file1 $file2 -s


ls -l /etc/cron.daily >tmp_crontab.txt


file2=/var/local/sec/crontab_daily.txt
diff $file1 $file2 -s

ls -l /etc/cron.hourly>tmp_crontab.txt


file2=/var/local/sec/crontab_hourly.txt
diff $file1 $file2 -s

ls -l /etc/cron.monthly>tmp_crontab.txt


file2=/var/local/sec/crontab_monthly.txt
diff $file1 $file2 -s

ls -l /etc/cron.weekly>tmp_crontab.txt

file2=/var/local/sec/crontab_weekly.txt
diff $file1 $file2 -s


