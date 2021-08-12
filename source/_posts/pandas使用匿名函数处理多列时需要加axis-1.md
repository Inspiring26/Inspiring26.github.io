---
title: pandas使用匿名函数处理多列时需要加axis=1
date: 2021-08-12 03:07:23
tags: [python, pandas, 方法]
---
pandas在结合多列数据产生新列时，匿名函数的传入参数还是一个，表达式中要使用时需要加上指定字段，当传如的多于一列时需要加axis。
只有一列时可加可不加。
```
for k in title_dict:
    tmpDF[k.replace("$$","json")]=tmpDF["event_kv_json"].apply(lambda x:json.loads(x).get(k,""))
```

```
tmpDF["custom"]=tmpDF["event_kv_json"].apply(lambda x: json.dumps({_:json.loads(x)[_] for _ in json.loads(x) if not _.startswith("$$")}))
```

```
tmpdf2["umid_diff2"]=tmpdf2[["point","umid_diff"]].apply(lambda x:True if x["point"]=="s" else x["umid_diff"]  ,axis=1)
```
