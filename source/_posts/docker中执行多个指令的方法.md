---
title: docker中执行多个指令的方法
date: 2019-10-28 17:19:02
tags: [docker]
---
在Dockerfile中这么写：
```
FROM face_pytorch:latest

WORKDIR /face_version1

EXPOSE 5015

CMD ["sh","auto.sh"]
```
在auto.sh中设置多个要执行的命令，如启动redis、运行程序、定期保存文件
```
nohup ./redis-5.0.5/src/redis-server > myredis.txt 2>&1 &
echo "nohup redis-server complete!"
nohup python palm_re_v3.py > mypalmpy.txt 2>&1 &
echo "nohup python palm_re_v3.py complete!"
thetime=$(date "+%H%M") # the time is UTC0 not UTC8
while true
do
	thetime=$(date "+%M")
	if [ $thetime = '00' ]
	then
		echo "save pics every hour"
		python save_palm_pics.py
	fi

done
```
