---
title: pytorch怎么finetuning
date: 2019-10-15 14:27:24
tags: [pytorch, finetuning]
---
可以在加载模型后，直接修改最后一层的结构。
### 加载模型并查看网络结构

```
from torchvision import models
model=models.resnet18(pretrained=True)
model
```
部分结果为：
```
(layer4): Sequential(
    (0): BasicBlock(
      (conv1): Conv2d(256, 512, kernel_size=(3, 3), stride=(2, 2), padding=(1, 1), bias=False)
      (bn1): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      (relu): ReLU(inplace)
      (conv2): Conv2d(512, 512, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1), bias=False)
      (bn2): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      (downsample): Sequential(
        (0): Conv2d(256, 512, kernel_size=(1, 1), stride=(2, 2), bias=False)
        (1): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      )
    )
    (1): BasicBlock(
      (conv1): Conv2d(512, 512, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1), bias=False)
      (bn1): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      (relu): ReLU(inplace)
      (conv2): Conv2d(512, 512, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1), bias=False)
      (bn2): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
    )
  )
  (avgpool): AdaptiveAvgPool2d(output_size=(1, 1))
  (fc): Linear(in_features=512, out_features=1000, bias=True)

```

### 修改最后一层

```
import torch.nn as nn
model.fc=nn.Linear(512,100,bias=True)
model
```
修改后：
```
(layer4): Sequential(
    (0): BasicBlock(
      (conv1): Conv2d(256, 512, kernel_size=(3, 3), stride=(2, 2), padding=(1, 1), bias=False)
      (bn1): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      (relu): ReLU(inplace)
      (conv2): Conv2d(512, 512, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1), bias=False)
      (bn2): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      (downsample): Sequential(
        (0): Conv2d(256, 512, kernel_size=(1, 1), stride=(2, 2), bias=False)
        (1): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      )
    )
    (1): BasicBlock(
      (conv1): Conv2d(512, 512, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1), bias=False)
      (bn1): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
      (relu): ReLU(inplace)
      (conv2): Conv2d(512, 512, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1), bias=False)
      (bn2): BatchNorm2d(512, eps=1e-05, momentum=0.1, affine=True, track_running_stats=True)
    )
  )
  (avgpool): AdaptiveAvgPool2d(output_size=(1, 1))
  (fc): Linear(in_features=512, out_features=100, bias=True)

```
### 设置转换图片参数
```
from torchvision import transforms
transform=transforms.Compose([transforms.Resize(224),transforms.ToTensor(),transforms.Normalize((0.5,0.5,0.5),(0.5,0.5,0.5))])
```
### 加载pytorch自带数据
```
import torch
import torchvision

train_set=torchvision.datasets.CIFAR100(root='./data', train=True, download=True, transform=transform)
trainloader=torch.utils.data.DataLoader(train_set,batch_size=32,shuffle=True,num_workers=0)

test_set=torchvision.datasets.CIFAR100(root="./data",train=False,download=True,transform=transform)
testloader=torch.utils.data.DataLoader(test_set,batch_size=32,shuffle=True,num_workers=0)

classes = ('plane', 'car', 'bird', 'cat', 'deer', 'dog', 'frog', 'horse', 'ship', 'truck')
```
### 设置模型的训练参数，finetuning时学习率小一点
```
from torch import optim

net=model.cuda()
criterion=nn.CrossEntropyLoss()
optimizer=optim.SGD(net.parameters(),lr=0.001,momentum=0.9)
```
### 训练
```
from torch.autograd import Variable
import time

for epoch in range(100):
    start = time.time()
    running_loss=0
    for i,data in enumerate(trainloader,0):
        image,label=data

        image=image.cuda()
        label=label.cuda()
        image=Variable(image)
        label=Variable(label)

        optimizer.zero_grad()

        outputs=net(image)
        loss=criterion(outputs,label)

        loss.backward()
        optimizer.step()

        running_loss+=loss.data

        if i%100==99:
            end=time.time()
            print ('[epoch %d,imgs %5d] loss: %.7f  time: %0.3f s'%(epoch+1,(i+1)*32,running_loss/100,(end-start)))
            start=time.time()
            running_loss=0
print ("finish training")
```
