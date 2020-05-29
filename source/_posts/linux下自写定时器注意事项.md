---
title: linux下自写定时器注意事项
date: 2020-05-29 10:22:24
tags: [linux, ubuntu, 方法]
---
linux下可以方便的自写定时器脚本。
常用的是每60秒判断一下时间。
以每5分钟git pull一次为例。
需要计算分钟数对5的余数为0.
但是可能会出现一个03%5的情况，这时候脚本计算会出错。
可以通过对分钟值加10来避免。
简单的脚本如下：
```
while true
do
	thetime=$(date "+%M")
	thetime2=`expr $thetime + 10`
	remainder=$(($thetime2%5))
	if [ $remainder = '0' ]
	then
		cd ~/blog;sh gitpull.sh
		date
		sleep 60s
	else
		sleep 60s
	fi
done

```
shell脚本中以0开头的数字如08，和其他数字相加的时候往往会出现问题，需要先自己在终端下实验成功。
上面使用expr的方式是可行的。

### 需要注意的是，如果脚本语法有不严谨的地方，计算出错会导致整个脚本终止掉，这就是有时莫名停止的原因
