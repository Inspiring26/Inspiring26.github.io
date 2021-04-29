---
title: python3列表、元组、字典序列化反序列化
date: 2021-04-29 11:32:32
tags: [python, 方法]
---
序列化，反序列化分别使用json.dumps()、json.loads()。

列表：序列化后是str，反序列化是list
元组：序列化后是str，反序列化是list
字典：序列化后是str，反序列化是dict

### 示例
```
>>> import json
>>> tmp=[1,2,3]
>>> jtmp=json.dumps(tmp)
>>> type(jtmp)
<class 'str'>
>>> type(json.loads(jtmp))
<class 'list'>
>>> 
>>> tmp=(1,2,3)
>>> jtmp=json.dumps(tmp)
>>> type(jtmp)
<class 'str'>
>>> type(json.loads(jtmp))
<class 'list'>
>>> 
>>> tmp={1:1,2:2}
>>> jtmp=json.dumps(tmp)
>>> type(jtmp)
<class 'str'>
>>> type(json.loads(jtmp))
<class 'dict'>

```
