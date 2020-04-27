---
title: unity脚本里的this和获取Scrollbar里的滑动值
date: 2020-04-15 15:10:01
tags: [unity, 方法]
---
### 在脚本里使用this替代GameObject.Find("")，可以让一个脚本在多个相似功能的游戏体上使用，this指挂载的那个游戏体。

### 通过
```
this.GetComponent<Scrollbar>().value
```
就可以获得Scrollbar的滑动值。
