---
title: jupyter日常测性能
date: 2021-04-15 16:15:17
tags: [python, 方法]
---
在jupyter中日常测试不同表达方式的执行效率，进而做取舍时，直接新开一行以
```
%%timeit
```
开头即可

### 示例
```
way1=LossFunc()
way1=way1.cuda()
```
```
%%timeit
tmp=way1(torch.rand(10000,1),torch.rand(10000,1))
```
