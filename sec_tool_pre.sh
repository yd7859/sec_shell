if [ -d "/var/local/sec" ];
then 
    echo "目录已存在,更新配置文件。。。"
else
    mkdir /var/local/sec
fi

crontab -l >/var/local/sec/crontab_l.txt
ls -l /etc/cron.daily/ >/var/local/sec/crontab_daily.txt
ls -l /etc/cron.hourly >/var/local/sec/crontab_hourly.txt
ls -l /etc/cron.weekly >/var/local/sec/crontab_weekly.txt
ls -l /etc/cron.monthly >/var/local/sec/crontab_monthly.txt
netstat -ntlup > /var/local/sec/port.txt
cat /etc/rc.local >/var/local/sec/rc_local.txt
ls -l /etc/rc3.d/ >/var/local/sec/rcxd.txt
ls -l /bin > /var/local/sec/bin.txt
ls -l /usr/bin > /var/local/sec/usrbin.txt
ls -l /usr/sbin > /var/local/sec/usrsbin.txt

echo "配置文件更新完成。"
