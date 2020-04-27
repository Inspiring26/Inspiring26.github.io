---
title: shell脚本if基础的整数、字符串比较
date: 2019-11-21 11:20:46
tags: [shell,方法]
---
### 整数比较
等于
```
"$a" -eq "$b" ] #不加引号也可以的
```
不等于
```
if [ "$a" -ne "$b" ]
```
大于
```
if [ "$a" -gt "$b" ]
```

### 字符串比较
等于
```
if [ "$a" = "$b" ]
if [ "$a" == "$b" ]#两种都可以，应该要加引号的，没测试
```
不等于
```
if [ "$a"x != "$b"x ]

```
还可以用通配符的
```
if [[ "123" = "12"* ]];then echo "=";fi
=
if [[ "123" = 12* ]];then echo "=";fi
=
#通配符匹配的时候尽量用双括号，具体使用时自己先验证以下
```







老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)