---
title: unity脚本修改数据无效问题
date: 2020-05-12 11:14:00
tags: [unity, 方法]
---
unity中修改脚本数据后经常会发现运行时并没有使用修改后的数据，
尤其是数组数据等。

这时需要在脚本对应的inspector里点击齿轮，选择reset，此后就会使用脚本里的数据。

需要经常对比二者数据是否一致，所以较好的方法是将数据初始化在Start()函数里。







老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)
