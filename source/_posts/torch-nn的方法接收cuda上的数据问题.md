---
title: torch.nn的方法接收cuda上的数据问题
date: 2020-12-16 16:27:20
tags: [pytorch, 方法]
---
在测试一些nn的方法时，比如Embedding，是不能接收cuda上的数据的，所以只能用来测试不在显存中的数据。
测试通过后，只需在出具传入网络前加载在显存，同时将网络转到gpu类型：
```
testnet.to(torch.device("cuda:0"))
```
也可以不断用小的模型去测试，但是不太方便，不建议。
