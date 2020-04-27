---
title: pandas删除含NaN的行
date: 2019-10-11 11:07:49
tags: [python,pandas]
---
DataFrame下面有一个dropna函数可以去掉所有含NaN的行。
```
df1.head()
```
![](screenshot.png)

```
df1.dropna().head()
```
![](screenshot_1.png)