---
title: The type or namespace name 'Text' could not be found
date: 2020-04-22 10:05:01
tags: [unity, 方法]
---
这个问题的原因很可能是没有声明对应的namespaces，
在unity中使用UI构建物体，修改或调用其自带的脚本如Text等是需要先
```
using UnityEngine.UI;
```