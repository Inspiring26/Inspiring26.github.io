---
title: pytorch将张量加载到gpu显存时，cpu内存会增加2G左右
date: 2020-09-27 18:19:41
tags: [pytorch, 分析]
---
第一次将张量等转移到gpu时，cpu内存会增加2G，这是正常现象，是cuda和pytorch初始化共同导致的。
同一个程序只有第一次操作时会增加。
更多信息参考pytorch的issues
[地址](https://github.com/pytorch/pytorch/issues/12873)
