---
title: pytorch的torchvision.datasets.ImageFolder
date: 2019-10-17 15:11:03
tags: [pytorch]
---
导入：
```
from torchvision.datasets import ImageFolder
```
常用的参数有：
```
ImageFolder(root="root folder path", [transform, target_transform])
```
方括号是可选参数
通常使用transform，target_transform是对标签进行变换
```
from torchvision import transforms

transform=transforms.Compose([transforms.Resize(224),transforms.ToTensor(),transforms.Normalize((0.5,0.5,0.5),(0.5,0.5,0.5))])
metadata=ImageFolder(root="/home/h/models/公司项目/4.手掌手相识别/左右手数据", transform=transform)
```
它有三个成员变量：
```
.classes - 用一个list保存 类名
.class_to_idx - 类名对应的 索引
.imgs - 保存(img-path, class) tuple的list
```
效果分别如下：
```
['右手', '左手']


{'右手': 0, '左手': 1}


[('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_03PqxLsHfb.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_07K5FrWykv.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_08qhgOx7tF.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_09FOfDraXb.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_09wPmeWrE2.png', 0),
```
直接打印metadata可以看到大致信息：
```
Dataset ImageFolder
    Number of datapoints: 5858
    Root Location: /home/h/models/公司项目/4.手掌手相识别/左右手数据
    Transforms (if any): Compose(
                             Resize(size=224, interpolation=PIL.Image.BILINEAR)
                             ToTensor()
                             Normalize(mean=(0.5, 0.5, 0.5), std=(0.5, 0.5, 0.5))
                         )
    Target Transforms (if any): None
```
### 补充
由
```
[('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_03PqxLsHfb.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_07K5FrWykv.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_08qhgOx7tF.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_09FOfDraXb.png', 0),
 ('/home/h/models/公司项目/4.手掌手相识别/左右手数据/右手/palm_09wPmeWrE2.png', 0),
```
可知，ImageFolder保存的是地址list不是具体图片，这就占用的内存就很小。
下一步也是迭代一批图片才读取那批图片。