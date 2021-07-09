#/bin/bash

echo 检查历史命令
history 
echo  安装软件命令
(history |grep install ;history |grep make ; history | grep rpm)
echo ssh相关 
history |grep ssh 

echo  其他危险操作
(history |grep chmod ;history |grep rm ; history | grep wget)


