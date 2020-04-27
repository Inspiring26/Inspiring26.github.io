---
title: pytorch基本模型
date: 2019-10-18 10:34:43
tags: [pytorch,写写画画]
---
一个基本的线性回归模型
```
class LinearRegression(nn.Module):
    def __init__(self):
        super(LinearRegression,self).__init__()
        self.linear = nn.Linear(1,1)#一个输入一个输出，此外隐藏一个偏差，y=ax+b
    
    def forward(self,x):
        out = self.linear(x)
        return out

model = LinearRegression()
```
至此一个最简单的pytorch模型就定义完了。
