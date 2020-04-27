---
title: 在node交互模式下怎么导入tf
date: 2019-11-13 10:49:56
tags: [node.js]
---

```
import * as tf from '@tensorflow/tfjs';
```
等方式会在\*处报错

正确的导入方式是使用require()
```
const tf = require('@tensorflow/tfjs-node');

```
或者
```
const tf = require('@tensorflow/tfjs-node');

```
也可以导入gpu版的







老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)

