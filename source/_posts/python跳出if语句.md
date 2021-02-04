---
title: python跳出if语句
date: 2021-02-04 14:39:00
tags: [python, 方法]
---
### 前言
喜欢在循环、函数里使用多个单行的if判断，如果true直接跳出。
类似常用的传值类型判断。
类似以下：
```
def func(a):
    if a=="":print("empty value");return
    if a%10==0:print("err vaule");return

for i in range(100):
    if key1 not in dict1:print("err key");continue
    if dict1[key1]=="":print("empty value");continue
```
这种句式的好处是逻辑非常清晰。

但是有时要在if里嵌套if，因为它不是函数也不是循环，就无法正常退出。
例如：
```
if 存在文件a:
    if 存在a文件昨天日期的备份：结束
    备份a并加上昨天的日期
```

当然可以用if...else解决，但是结构就不那么清晰

### 我的多此一举的解决方法
为了达到我的逐行判断、逻辑清晰的目的，我决定这么使用:
```
for i in range(1):
    if 不存在a：print("不存在a");continue
    if 存在a文件昨天日期的备份:continue
    备份a并加上昨天的日期
```

整体结构很简单。
相当于在备份a前加了两个判断。

我讨厌大规模的for循环、嵌套for循环，但却喜欢1的for循环。

