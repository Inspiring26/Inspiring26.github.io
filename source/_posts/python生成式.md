---
title: python生成式
date: 2020-08-31 14:21:25
tags: [python, 方法, 总结]
---
### 1. 并列for循环其实是嵌套for循环
```
>>> [m + n for m in 'ABC' for n in 'XYZ']
['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']
```

### 2.if...else
if可以在for语句之前，也可以在for语句之后
在for语句之后，if是个筛选条件，不能加else。
在for语句之前的部分是表达式，形如
```
1 if 2％2==0 else 0
```
本来就是一个表达式。

总结：for语句之前是表达式，之后可加判断条件，仅限if，运行顺序是for--\>for后判断--\>(通过判断才运行表达式)
