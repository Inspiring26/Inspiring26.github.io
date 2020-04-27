---
title: 'pandas的usecols不能指定[A,B,C]'
date: 2019-10-11 11:00:42
tags: [python,pandas]
---
pandas的usecols不能指定["A","B","C"].
如果使用列表的话，需要指定对应的索引数值，如
```
sheet_name="Sheet3",usecols=[1,6]
sheet_name="人工打标签(新)",usecols=[1,2]
```
