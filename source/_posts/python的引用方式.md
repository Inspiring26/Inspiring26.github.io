---
title: python的引用方式
date: 2019-11-01 10:56:32
tags: [python]
---
```
from data import aclass
```
data是当前目录下的文件夹
aclass 在data文件夹里的\_\_init\_\_.py文件里
\_\_init\_\_.py的作用是可以看作是aclass文件夹的基本/默认py文件，有它就可以把data文件夹看作一个py文件。
另一个好处是，在\_\_init\_\_.py使用from .aae import bb，这样就把data文件夹下的所有类聚合到一起了。
