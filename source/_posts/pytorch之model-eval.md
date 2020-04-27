---
title: pytorch之model.eval
date: 2019-10-18 15:25:28
tags: [pytorch]
---
在测试模型是需要用model.eval()使模型变为测试模式，
主要是针对dropout和batch normalization在训练时和测试时不一样的情况

其实这么看来，加不加都可以，一般还是加上。
