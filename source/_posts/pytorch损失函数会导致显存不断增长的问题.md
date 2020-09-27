---
title: pytorch损失函数会导致显存不断增长的问题
date: 2020-09-27 15:40:01
tags: [python, pytorch, 方法]
---
### 分析
如果已经把模型和变量放到显存中了，每个epoch计算的损失值也是在显存中的，即.cuda()的类型。
如果我们计算总损失的变量是.cpu()类型的，没次迭代的时候计算到的的.cuda()格式变量是不会释放的，从而会导致显存不断增加。
### 解决方法
1.转换为.cpu()再累加
实际代码并不难使用.cpu(),而是.item()
```
loss = criterion(labels,outputs).item()
totalloss+=loss

或

loss = criterion(labels,outputs)
totalloss+=loss.item()
```
如果使用.cpu(),只是在内存中生成了一份，显存中的并未释放。
2.声明.cuda()变量
