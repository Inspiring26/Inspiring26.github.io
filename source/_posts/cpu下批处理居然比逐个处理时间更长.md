---
title: cpu下批处理居然比逐个处理时间更长
date: 2019-10-28 15:32:26
tags: [pytorch,深度学习]
---
测试在cpu下一次预测一个图片和一次预测两个消耗时间的对比。
实验中有两个模型，也就是说每个预测里面预测了两次。
![](screenshot_69.png)
实验部分代码：
```
async def predictHandler3():
    global pic_dict,pic_dict_res
    keylist = list(pic_dict.keys())
    keylist2=list(pic_dict.keys())*2
    print("keylist",keylist)
    print("keylist2",keylist2)

    time1 = time.time()
    img = [transform(pic_dict[_]).numpy().tolist() for _ in keylist]
    img = torch.FloatTensor(img).cpu()
    with torch.no_grad():
        outputs1 = palmmodel(img)
        outputs2 = handmodel(img)
    time2 = time.time()
    print(time2-time1)

    time3 = time.time()
    img = [transform(pic_dict[_]).numpy().tolist() for _ in keylist2]
    img = torch.FloatTensor(img).cpu()
    with torch.no_grad():
        outputs1 = palmmodel(img)
        outputs2 = handmodel(img)
    time4 = time.time()
    print(time4-time3)
```
然而在gpu上则快非常多。
![](screenshot_70.png)
### 结论
在cpu下进行推理不用考虑使用批处理。
在gpu下使用批处理提升巨大，在必要的情况下可以考虑。
