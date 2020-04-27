---
title: pytorch把load的数据map到cpu上
date: 2019-10-30 17:58:43
tags: [pytorch]
---
```
checkpoint = torch.load("checkpoint.pth", map_location=torch.device('cpu'))
model.load_state_dict(checkpoint["state_dict"])
```
第二句更具情况可有可无。
