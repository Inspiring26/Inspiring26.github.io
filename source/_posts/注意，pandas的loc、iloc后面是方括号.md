---
title: 注意，pandas的loc、iloc后面是方括号
date: 2019-11-19 11:21:51
tags: [pandas]
---
df = ...
loc和iloc是直接读取行的
区别在iloc参数是数字，loc参数是字符串

读取列的话，有三种，分别是. [] 上面两种的应用
df.0
df[0]
df.loc[:,[]] df.iloc[:,[]] #内部的方括号中不能用切片，可以列举。外部的可以用切片





老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)