---
title: unity发布webgl和android不能返回值、调用函数的原因
date: 2020-05-14 17:18:20
tags: [unity, 方法]
---
所有的这些原因，无法进入游戏、无法打开成功/失败结束页面等
主要是因为调用和litjson相关的函数了。

使用这种需要引入dll的方法，一定要注意查清楚在各个平台的打包问题。

所以要左多平台发布，尤其是有webgl，尽量使用unity自带的工具实现。







老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)
