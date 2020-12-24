---
title: pyecharts展示请求量
date: 2020-12-24 15:01:36
tags: [python, echarts, 方法]
---
### 效果图
![](2020-12-24_14-58.png)

### 代码，直接从jupyter notebook导出为md格式

```python
import os
import pandas as pd
import numpy as np
import pyecharts.options as opts
from pyecharts.charts import Line
# https://gallery.pyecharts.org/#/Line/basic_area_chart
```


```python
# 请求量
os.system("find . -name 'stat20201223.rec'|xargs grep '\\.'|cut -d '.' -f4,4|cut -c 16-19|sort|uniq -c|sort -n > tmpres1.txt")
```




    0




```python
# 点击量
# os.system("find . -name 'stat20201223.rec'|xargs grep 'c$'|cut -d '.' -f4,4|cut -c 16-19|sort|uniq -c|sort -n > tmpres1.txt")
```


```python
os.system("tail -n 1440 tmpres1.txt > tmpres2.txt")
xdata,ydata=[],[]
with open("tmpres2.txt","r") as f:
    tmp=f.readline().split(" ")
    while len(tmp)>1:
        ydata.append(int(tmp[-2]))
        xdata.append(int(tmp[-1].replace("\n","")))
        tmp=f.readline().split(" ")
    
df = pd.DataFrame(np.array([xdata,ydata]).T)
df=df.sort_values(by=[0,1],ascending=True,ignore_index=True)
df[0]=df[0].astype(str)
xd=df[0].tolist()
yd=df[1].tolist()
```


```python
c = (
    Line(init_opts=opts.InitOpts(width="1000px"))
    .add_xaxis(xd)
    .add_yaxis("20201223 每分钟请求量", yd, areastyle_opts=opts.AreaStyleOpts(opacity=0.5))
    .set_global_opts(
        tooltip_opts=opts.TooltipOpts(is_show=False),
        yaxis_opts=opts.AxisOpts(
            type_="value",
            axistick_opts=opts.AxisTickOpts(is_show=True),
            splitline_opts=opts.SplitLineOpts(is_show=True),
        ),
        xaxis_opts=opts.AxisOpts(type_="category", boundary_gap=False),
    )
#     .set_global_opts(title_opts=opts.TitleOpts(title="Line-面积图"))
    .render("line_area_style.html")
)
```

### 总结
以后可以更加方便的导出jupyter notebook代码。
