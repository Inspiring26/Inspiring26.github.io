---
title: python多进程
date: 2020-09-23 16:45:43
tags: [python, 总结]
---
### 简单粗暴的方法
```
f1 = Process(target=func1,args=(q1res,))
f2 = Process(target=func2,args=(q2res,))

f1.start()
f2.start()
f1.join()
f2.join()
```

### 简单处理多进程
```
ps=[]
for i in [fanca, funcb]
    p=Process(target=i)
    ps.append(p)

for i in range(2):
    ps[i].start()

for i in range(2):
    ps[i].join()
```

### 使用进程池处理多进程
```
ps = Pool(3)
for p in [write_showDF, write_clickDF, write_textLinks]:
    ps.apply(p)
ps.close()
ps.join()
```

### 进程间通信
以第一种形式，且子进程间无交互为例
```
q1res = mp.Queue()
q2res = mp.Queue()
f1 = Process(target=func1,args=(q1res,))
f2 = Process(target=func2,args=(q2res,))

f1.start()
f2.start()
f1.join()
f2.join()
rec_cec_df,norm_cec_df=q1res.get(),q2res.get()
```
