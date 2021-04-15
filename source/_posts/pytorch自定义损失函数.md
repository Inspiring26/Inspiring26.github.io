---
title: pytorch自定义损失函数
date: 2021-04-15 16:40:39
tags: [pytorch, 方法]
---
在深度学习中有时需要使用自定义损失函数，或者为了更好的理解各个环节而使用自定义损失函数。
在pytorch中自定义损失函数实现的比较简单，就像实现一个小型网络一样。
### 代码
```
class LossFunc(nn.Module):
    def __init__(self):
        super(LossFunc, self).__init__()        
    def forward(self, prelist, ylist):
        dif=torch.abs(prelist-ylist)
        coef=ylist.clone()
        coef[coef>=0.5]=2
        coef[coef<0.5]=1
        dif=torch.mul(dif,coef)       
        return torch.sum(dif)//ylist.size()[0]
mylossfunc=LossFunc()
mylossfunc=mylossfunc.cuda()
```
这是一个自己写的 均差，相当于均方误差没有求平方。
写的时候注意尽量求平均的，不要导致返回的结果过大，可以类比着已有的损失函数，做部分修改。
