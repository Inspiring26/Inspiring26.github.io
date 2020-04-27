---
title: pytorch之torch.utils.data.DataLoader
date: 2019-10-17 15:32:10
tags: [pytorch]
---
带入：
```
from torch.utils.data import DataLoader
```
该类的基本参数：
```
class torch.utils.data.DataLoader(dataset, batch_size=1, shuffle=False, sampler=None, num_workers=0, collate_fn=<function default_collate>, pin_memory=False, drop_last=False)

```
数据加载器。组合数据集和采样器，并在数据集上提供单进程或多进程迭代器。

参数：
```
dataset (Dataset) – 加载数据的数据集。
batch_size (int, optional) – 每个batch加载多少个样本(默认: 1)。
shuffle (bool, optional) – 设置为True时会在每个epoch重新打乱数据(默认: False).
sampler (Sampler, optional) – 定义从数据集中提取样本的策略。如果指定，则忽略shuffle参数。
num_workers (int, optional) – 用多少个子进程加载数据。0表示数据将在主进程中加载(默认: 0)
collate_fn (callable, optional) –
pin_memory (bool, optional) –
drop_last (bool, optional) – 如果数据集大小不能被batch size整除，则设置为True后可删除最后一个不完整的batch。如果设为False并且数据集的大小不能被batch size整除，则最后一个batch将更小。(默认: False)
```

### 总结
主要用来将数据组织成可迭代的数据，同时打乱数据、指定批大小。