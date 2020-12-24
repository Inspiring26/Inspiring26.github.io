---
title: shell快速计算加减乘除
date: 2020-12-24 10:54:41
tags: [shell, 方法]
---
```
h@h-B360M-D2VX-SI:~/Github/blog/source/_posts$ `expr 1 + 1`
bash: 2: command not found
h@h-B360M-D2VX-SI:~/Github/blog/source/_posts$ $((1+1))
bash: 2: command not found
```
需要注意的是，使用第一种方法符号和数字间必须要加空格。
