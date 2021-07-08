#/bin/bash

#获取系统版本
sys_version=`uname -r |cut -d "l" -f 2 |cut -d "." -f 1`
#cat /etc/centos-release |cut -d " " -f 4
echo 系统版本$sys_version
iscent6=$(echo $sys_version | grep "6_")

if [[ "$result" != "" ]];then
    echo "centos6"
else
    echo "centos7 /centos8"
fi

echo "-------------------------------------------------------------------------------------------"

echo "内存状态情况："
vmstat 2 3


echo "内存占用情况："
summemory=$(free -h |grep "Mem:" | awk '{print $2}')
freememory=$(free -h |grep "Mem:" | awk '{print $4}')
usagememory=$(free -h |grep "Mem:" | awk '{print $3}')
uptime=$(uptime | awk '{print $2" "$3" "$4" "$5}' | sed 's/,$//g')
loadavg=$(uptime | awk '{print $9" "$10" "$11" "$12" "$13}')

echo "总内存大小:           $summemory"
echo "已使用内存大小:       $usagememory"
echo "可使用内存大小:       $freememory"
echo "系统运行时间:         $uptime"
echo "系统负载:             $loadavg"
echo "-------------------------------------------------------------------------------------------"
echo "磁盘使用率："
df -h | awk -F "[ ]+" 'NR!=1{print $5,$6}'

echo "-------------------------------------------------------------------------------------------"
echo "僵尸进程:"
ps -ef | grep zombie | grep -v grep
if [ $? == 1 ];then
    echo ">>>无僵尸进程"
else
    echo ">>>有僵尸进程"
fi
echo "耗CPU最多的进程:"
ps auxf |sort -nr -k 3 |head -5
echo "耗内存最多的进程:"
ps auxf |sort -nr -k 4 |head -5

echo  "当前建立的连接:"
netstat -n| grep  '^tcp'

echo "网卡流量信息"
#watch -n 1 "ifconfig ens32"

eth0=ens32
echo  -e    "流量进入--流量传出    "

while true; do
	old_in=$(cat /proc/net/dev |grep $eth0 |awk '{print $2}')
	old_out=$(cat /proc/net/dev |grep $eth0 |awk '{print $10}')
	sleep 1
	new_in=$(cat /proc/net/dev |grep $eth0 |awk '{print $2}')
	new_out=$(cat /proc/net/dev |grep $eth0 |awk '{print $10}')
	in=$(printf "%.1f%s" "$((($new_in-$old_in)/1024))" "KB/s")
	out=$(printf "%.1f%s" "$((($new_out-$old_out)/1024))" "KB/s")
	echo "$in $out"
done

