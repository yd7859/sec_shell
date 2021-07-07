#/bin/bash

echo "-------------------------------------------------------------------------------------------"
#正常登录IP段
sec_net=192.168.

echo 当前登录用户信息
who

echo "最近系统登录用户 信息"
last| grep -v `echo $sec_net`

echo "尝试登录系统的ip "
cat /var/log/audit/audit.log |grep failed |cut -d "=" -f 14|cut -d " " -f 1

