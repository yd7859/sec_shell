#/bin/bash

level=$(runlevel |cut -d " " -f 2)
echo 当前运行级别：$level
echo 当前开启的服务：
systemctl list-unit-files |grep enabled

echo "查看是否开启了xinetd服务:"
if ps -elf |grep xinet |grep -v "grep xinet";then
  echo ">>>xinetd服务正在运行"
else
  echo ">>>xinetd服务未开启"
fi

echo  "查看是否开启了ssh服务:"
if service sshd status | grep -E "listening on|active \(running\)"; then
  echo ">>>SSH服务已开启"
else
  echo ">>>SSH服务未开启"
fi

echo "查看是否开启了Telnet服务:"
if more /etc/xinetd.d/telnetd 2>&1|grep -E "disable=no"; then
  echo ">>>Telnet服务已开启"
else
  echo ">>>Telnet服务未开启"
fi

ps axu | grep iptables | grep -v grep || ps axu | grep firewalld | grep -v grep 
if [ $? == 0 ];then
  echo ">>>防火墙已启用"
iptables -nvL --line-numbers
else
  echo ">>>防火墙未启用"
fi

echo "查看系统SSH远程访问设置策略(hosts.allow允许列表):"
if more /etc/hosts.allow | grep -E "sshd"; then
  echo ">>>远程访问策略已设置-"
else
  echo ">>>远程访问策略未设置"
fi
