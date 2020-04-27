---
title: redis全局访问
date: 2019-10-24 10:58:02
tags: [redis]
---
要修改配置bind只能在配置文件中修改
修改指令
```
sudo vim /etc/redis/redis.conf

```
在4%左右的位置将原bind修改为：
```
#bind 127.0.0.1 ::1
bind 0.0.0.0

```
重启redis
```
/etc/init.d/redis-server restart

```