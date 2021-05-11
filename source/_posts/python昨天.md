---
title: python昨天
date: 2021-05-11 11:42:57
tags: [python, 方法]
---
python获取昨天日期
```
>>> import datetime
>>> datetime.date.today() + datetime.timedelta(-1)
datetime.date(2021, 5, 10)
>>> (datetime.date.today() + datetime.timedelta(-1)).strftime("%Y%m%d")
'20210510'
```
