---
title: linux将内容移出交换区或开关交换区
date: 2020-11-23 10:27:35
tags: [linux, 方法]
---
```
# 查看交换区文件
➜  h2 swapon
NAME      TYPE SIZE   USED PRIO
/swapfile file   2G 729.6M   -2
# 关闭所有的
➜  h2 swapoff -a
# 挂载指定的交换文件
➜  h2 swapon /swapfile 
➜  h2
```
