---
title: 在使用PIL读取图片后最好都加一个转换成RGB的函数，保证是三通道
date: 2019-10-29 09:30:49
tags: [PIL,深度学习]
---
有些图片打开了不是三通道，会导致输入数据维度不匹配，最好加一个转换，已经是RGB的就不会转换，因此也不影响速度。
```
imgtmp = Image.open(img_data).convert("RGB")
```
