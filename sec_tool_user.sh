#/bin/bash



echo "/etc/passwd最后修改时间："
ls -l /etc/passwd | cut -d " " -f 6-9

echo "具有登录权限的用户"
cat /etc/passwd | grep '/bin/bash'

echo "空密码的用户"
cat /etc/shadow |  cut -d ":" -f 1-3|grep ::| cut -d ":" -f 1


echo "特权用户账号"
awk -F: '$3==0 {print $1}' /etc/passwd
