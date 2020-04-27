---
title: python将大文件夹拆分成小文件夹
date: 2020-03-17 16:13:02
tags: [python, 方法]
---

```
import os
os.system("mkdir pic_move1;mkdir pic_move2")
plist = next(os.walk("pic_move"))[2]
print(len(plist))
for i in range(5000):
    os.system("mv ./pic_move/"+plist[i]+" ./pic_move1/")
```
依次类推完成转移

