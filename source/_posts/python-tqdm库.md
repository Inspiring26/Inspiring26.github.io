---
title: python tqdm库
date: 2019-10-10 15:32:12
tags: python
---
Tqdm 是 Python 进度条库，可以在 Python 长循环中添加一个进度提示信息用法：tqdm(iterator)
### 可以用trange替代range
```
# 方法1：
import time
from tqdm import tqdm  

for i in tqdm(range(100)):  
    time.sleep(0.01)

# 方法2：
import time
from tqdm import trange

for i in trange(100):
    time.sleep(0.01) 
```
结果：
```
100%|██████████| 100/100 [00:01<00:00, 97.03it/s]
100%|██████████| 100/100 [00:01<00:00, 97.30it/s]
```
### 可以为进度条设置描述
相当于下面的```"Processing %s"```是额外加载每一行的
```
import time
from tqdm import tqdm

pbar = tqdm(["a", "b", "c", "d"])  
for char in pbar:  
    pbar.set_description("Processing %s" % char)
    time.sleep(1)
#pbar.close()  不需要
```
结果：
```
Processing d: 100%|██████████| 4/4 [00:04<00:00,  1.00s/it]
```

### 使用update()控制更新频率
```
import time
from tqdm import tqdm

# 一共200个，每次更新10，一共更新20次
with tqdm(total=200) as pbar:
  for i in range(20):
    pbar.update(10) 
    time.sleep(0.1)

#方法2：
pbar = tqdm(total=200)  
for i in range(20):  
    pbar.update(10)
    time.sleep(0.1)

# with is also optional (you can just assign tqdm() to a variable, but in this case don't forget to del or close() at the end
pbar.close()
```
结果：
```
100%|██████████| 200/200 [00:01<00:00, 98.18it/s] 
100%|██████████| 200/200 [00:01<00:00, 98.02it/s] 
```
用了with就不用在结束时使用close，没用with的情况下还要额外使用close()的。

### 参考链接
1.[https://github.com/tqdm/tqdm](https://github.com/tqdm/tqdm)
2.[https://www.jianshu.com/p/21cf48be6bf6](https://www.jianshu.com/p/21cf48be6bf6)