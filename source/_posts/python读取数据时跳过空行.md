---
title: python读取数据时跳过空行
date: 2019-10-10 15:20:35
tags:  python
---
```
for line in f:
    if not line:
        continue
```
小技巧，增加程序的健壮性。