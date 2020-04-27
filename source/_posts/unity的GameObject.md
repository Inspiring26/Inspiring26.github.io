---
title: unity的GameObject
date: 2020-04-13 16:41:26
tags: [unity, 方法]
---
```
GameObject.Find("Bricks1").GetComponent<MakeBricksMove>().enabled=true;
```
可以调用很多游戏体，但是不能调用没激活的游戏体。
要调用没预先没激活的游戏体，需要用public声明引用。