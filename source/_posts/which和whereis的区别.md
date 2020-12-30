---
title: which和whereis的区别
date: 2020-12-30 11:48:31
tags: [linux, 总结]
---
### 示例
```
h@h-B360M-D2VX-SI:~$ cxfix
bash: cxfix: command not found
h@h-B360M-D2VX-SI:~$ which cxfix
h@h-B360M-D2VX-SI:~$ whereis cxfix
cxfix: /opt/cxoffice/bin/cxfix
```
### 总结
都是查找可执行文件，简单说，whereis查询更广，which查询默认的几个位置。
