#! /bin/bash

# 【题目要求】
# 计算一下linux系统所有进程占用内存大小的和

# 【核心要点】
#1、ps、awk命令
# ps aux 命令的输出被传递给 grep 命令进行过滤，排除包含 ‘TIME COMMAND’ 的行。
# 然后，过滤后的结果被传递给 awk 命令，提取第 6 列，并打印输出

# 2、算术运算符
# ((expression)) 或
# let <arithmetic expression>

# 【代码实现】
sum=0

for n in $(ps aux |grep -v 'TIME COMMAND'|awk '{print $6}')
do
	# ((sum=sum+$n))
	sum=$((sum+$n))
	# let sum=sum+$n
	# let sum=$sum+$n
done

echo "total process mem sum=$sum"


