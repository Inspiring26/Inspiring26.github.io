---
title: golang统一处理err
date: 2021-01-14 10:50:46
tags: [golang, 方法]
---
程序写完，一堆nil看着难受，以后统一这么写吧
```
func FuckErr(err error){
    if err!=nil{
        panic(err)
    }
}
```
