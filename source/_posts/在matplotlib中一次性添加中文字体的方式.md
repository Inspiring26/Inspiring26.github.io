---
title: 在matplotlib中一次性添加中文字体的方式
date: 2020-12-23 17:51:56
tags: [python, 方法]
---
这是一个临时添加中文或其他字体的方式，永久添加可能会有各种问题，这个是一定有效的。
代码：

```
import matplotlib  
from matplotlib.font_manager import *  
import matplotlib.pyplot as plt 
myfont = FontProperties(fname='/home/h/Downloads/SimHei.ttf',size=10)
matplotlib.rcParams['axes.unicode_minus']=False 

x=[*range(10)]
y=[*range(10,20)]
plt.title("中国",fontproperties=myfont)
plt.scatter(x,y)
```
效果：
![pic](2020-12-23_17-50.png)
