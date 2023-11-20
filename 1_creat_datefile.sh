#! /bin/bash

# 【题目要求】
# 请按照这样的日期格式（xxxx-xx-xx）每日生成一个文件，
# 例如生成的文件名为2017-12-20.log，
# 并且把磁盘的使用情况写到到这个文件中

# 【核心要点】
#1、获取日期格式
#date +%F 格式为2023-11-18
#date +%F_%H%M%S 格式为2023-11-18_173710
#date +%Y%m%d_%H%M%S 格式为 2023-11-18_173710

#2、命令替换
# 方式1：$(cmd)
# 方式2：`cmd`

#3、find命令
# -name: 按照文件名进行匹配搜索。
# 示例：find /path/to/directory -name "filename"
# -type: 按照文件类型进行匹配搜索。
# 示例：find /path/to/directory -type f（匹配普通文件）；find /path/to/directory -type d（匹配目录）
# -mtime: 按照文件的最后修改时间进行匹配搜索。
# 示例：find /path/to/directory -mtime +7（匹配最后修改时间超过7天的文件）
# -size: 按照文件大小进行匹配搜索。
# 示例：find /path/to/directory -size +10M（匹配大于10兆字节的文件）
# -user: 按照文件所有者进行匹配搜索。
# 示例：find /path/to/directory -user username（匹配所有者为指定用户的文件）
# -group: 按照文件所属用户组进行匹配搜索。
# 示例：find /path/to/directory -group groupname（匹配所属用户组为指定组的文件）
# -perm: 按照文件的权限进行匹配搜索。
# 示例：find /path/to/directory -perm 644（匹配权限为644的文件）
# -exec: 对搜索到的文件执行指定的命令。
# 示例：find /path/to/directory -name "*.txt" -exec rm {} \;（删除所有扩展名为 .txt 的文件）


# 【代码实现】
d=$(date +%F)
# d=`date +%F_%H%M%S`
dir="$(pwd)/disklog"

# 创建文件
if [ ! -d $dir ]
then
	mkdir $dir
fi
df -h > $dir/$d.log

# 遍历打印文件
for file in $(find $dir/* -name "*log")
do
	echo $file
done

# 删除最后修改时间超过1年的文件
# xargs 命令用于将标准输入作为参数传递给后续的命令
find $dir/ -mtime +365 |xargs rm




