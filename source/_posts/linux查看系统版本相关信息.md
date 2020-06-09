---
title: linux查看系统版本相关信息
date: 2020-06-09 14:26:31
tags: [linux, 方法]
---
### 仅内核版本
```
uname -a
```
### 内核版本、gcc版本
```
cat /proc/version
``` 
命令很简单，可以记住

### 查看系统版本代号
```
lsb_release -a
```
也很简单要记住
