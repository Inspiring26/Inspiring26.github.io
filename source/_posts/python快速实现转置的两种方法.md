---
title: python快速实现转置的两种方法
date: 2019-10-22 16:34:31
tags: [python]
---
一个比较少用但是要知道的是python自带的函数reversed
```
>>> aa=[1,2,3,4,5]
>>> reversed(aa)
<list_reverseiterator object at 0x7f1e06712978>
>>> list(reversed(aa))
[5, 4, 3, 2, 1]

```
第二个是修改步长为-1
```
>>> aa[::-1]
[5, 4, 3, 2, 1]

```