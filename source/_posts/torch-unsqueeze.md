---
title: torch.unsqueeze
date: 2019-10-15 14:02:13
tags: [pytorch]
---
torch.unsqueeze()的作用是增加一个维度，常用的是将单张图片增加一个维度。这样才可以传入模型。
```
torch.unsqueeze(img,0)
```