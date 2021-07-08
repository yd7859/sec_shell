mkdir /var/local/sec
crontab -l >/var/local/sec/crontab_l.txt
cat /etc/cron.daily/logrotate >/var/local/sec/crontab_daily.txt
cat /etc/cron.hourly >/var/local/sec/crontab_hourly.txt
ls -l /etc/cron.weekly >/var/local/sec/crontab_weekly.txt
ls -l /etc/cron.monthly >/var/local/sec/crontab_monthly.txt
netstat -antl|grep LISTEN >/var/local/sec/port.txt
netstat -anul >>/var/local/sec/port.txt
cat /etc/rc.local >/var/local/sec/rc_local.txt
ls -l /etc/rc3.d/ >/var/local/sec/rcxd.txt
