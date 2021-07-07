---
title: python判断是不是在jupyter中
date: 2021-07-07 08:50:19
tags: [python, 方法]
---
### 在jupyter中判断
```
import os
os.environ['_']

'/usr/bin/jupyter'
```

### 在终端交互环境判断
```
>>> import os
>>> os.environ['_']
'/usr/bin/python3'

```

### 为了使在jupyter里写的程序方便导出来，可以这样
```
import os
if "jupyter" in os.environ['_']:
    from tqdm.notebook import tqdm
else:
    from tqdm import tqdm
```
