#!/bin/bash

#可以先将引号去掉

#将那一列调到后面

#有电话重输入到一个文件,并去掉含有订单号的行
awk -F, '$7!="" {print$0}' $1 | sort -n -k 1 -t , > phone.txt
sed -i '1d' ./phone.txt

#无电话的重输入到一个文件
sed '1d' $1 | awk -F, '$7=="" {print$0}' $1 | sort -n -k 1 -t , > no_phone.txt

#然后输入无号码的订单号，查询后再插入电话
sed '1d' $1 | awk -F, '$7=="" {print$1}' OFS='\t' $1 | sort > order_with_no_phone.txt

#两个文件合并
