---
title: pandas选取特定行和排除特定行
date: 2019-10-11 11:24:22
tags: [python,pandas]
---
pandas只有isin()方法，没有isnotin()方法。
我们要选取特定行，只需
```
df[df.<列名>.isin(["",""])]
```
要排除特定行时，需要间接的修改isin的参数列表
```
# 错误的
isin_list = list(set(df["列名"])).remove("").remove("")
df[df.<列名>.isin(isin_list)]
```
注意，即使列名是中文，在第二行的筛选中也不能加引号，正确的是
```
# remove使用错误
isin_list = list(set(df["列名"])).remove("").remove("")
df[df.列名.isin(isin_list)]
```
### 注意
remove()对列表处理返回结果NoneType类型的，也就是说不能用赋值的方式去传递结果，而是在列表上直接操作
```
list.remove("")
```
同时，因为结果是NoneType类型，也不能个连续使用.remove("")。
所有返回结果是NoneType类型的都不能**赋值**及**连续使用**。
一个好的解决办法是使用生成式
```
[list.remove(_) for _ in anotherlist]
```
当有多个list要移除相同的元素时可以使用
```
[(isin_list1.remove(_),isin_list2.remove(_)) for _ in ["",""]]
```
而不可以使用
```
[isin_list1.remove(_),isin_list2.remove(_) for _ in ["",""]]
```
**这是因为生成式一个元素里含有多个子元素时，必须要用列表或者元组等表示为整体上的一个元素**
