---
title: python生成随机字符串
date: 2021-03-24 13:16:42
tags: [python, 方法]
---
### 方法
1.大小写字母
```
>>> import random, string
>>> "".join(random.sample(string.ascii_letters,9))
'HkJdpZclC'
```

2.大小字母+数字（字母开头）
```
>>> import random, string
>>> "".join(random.sample(string.ascii_letters,1)+random.sample(string.ascii_letters+string.digits,9))
'CX41uNHykR'
```

### 元素拆解
```
>>> string.ascii_letters
'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
>>> string.digits
'0123456789'
>>> random.sample('123456789', 4)
['7', '8', '5', '4']
```

