---
title: pytorch保存模型和保存模型参数
date: 2019-10-11 13:27:37
tags: [pytorch,深度学习]
---
### 保存、加载模型
```
torch.save(modelname, 'model.pkl')
model = torch.load('model.pkl')
```
#### 特点
使用时不需要定义网络模型，同时也不方便调整网络结构

### 保存、加载模型参数
```
torch.save(modelname.state_dict(), 'params.pkl')
modelname.load_state_dict(torch.load('params.pkl'))
```
#### 特点
需要自己定义网络，并且其中的参数名称与结构要与保存的模型中的一致（可以定义部分网络，比如只使用VGG的前几层），相对灵活，便于对网络进行修改。