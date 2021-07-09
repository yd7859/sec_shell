#/bin/bash

echo "-------------------------------------------------------------------------------------------"
#正常登录IP段
sec_net=192.168.

echo 当前登录用户信息:
who

echo "最近系统登录用户 信息:"
last| grep -v `echo $sec_net`


echo "用户错误登陆列表:"
#cat /var/log/audit/audit.log |grep failed |cut -d "=" -f 14|cut -d " " -f 1

lastb | head > /dev/null
if [ $? == 1 ];then
    echo "无用户错误登陆"
else
    lastb | head 
fi

echo "ssh错误尝试ip及次数:"
    more /var/log/audit/audit.log|awk '/failed/{print $(NF-3)}' |sort|uniq -c|awk '{print ">>>登入失败的IP和尝试次数: "$2"="$1"次";}'

