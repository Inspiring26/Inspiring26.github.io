---
title: ubuntu环境变量
date: 2019-10-18 14:54:29
tags: [ubuntu]
---
### 作用于当前终端
```
export CLASS_PATH=./***/lib:/***/lib
```
### 作用于当前用户
```
vim ~/.bashrc

export CLASS_PATH=./***/lib:/***/lib
```
如果想立即生效
```
 source ~/.bashrc
```
