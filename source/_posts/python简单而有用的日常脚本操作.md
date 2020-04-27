---
title: python简单而有用的日常脚本操作
date: 2019-11-27 16:04:33
tags: [python,技巧]
---
### 获取文件夹内所有文件名
```
import os
next(os.walk('.'))[2]
```
### 移动文件等shell操作
```
import os
os.system("mv aa bb")
```
### 多线程
实际使用中可以通过htop看到，执行一个处理时只会把一个cpu线程核心用满，想充分利用cpu和节省时间，就要多用多线程。
用起来非常简单，建议传入参数，以便分段同时执行
```
import threading
t1 = threading.Thread(target=handle, args=(1,len(namelist)//2),name='1')
t1.run()
```
举个用例
```
>>> def handle(s,d):
...     for i in range(s,d):
...         im = Image.open(namelist[i])
...         (width, height) = (im.width/max(im.width,im.height)*2000,im.height/max(im.width,im.height)*2000)
...         im_re = im.resize(( int(width), int(height) ))
...         im_re.save("../hands3/"+namelist[i])
... 
>>> t1 = threading.Thread(target=handle, args=(1,len(namelist)//2),name='1')
>>> t1.start()
>>> t2 = threading.Thread(target=handle, args=(len(namelist)//2,len(namelist)),name='2')
>>> t2.start()
```






老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)