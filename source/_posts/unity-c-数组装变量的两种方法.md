---
title: 'unity/c#数组装变量的两种方法'
date: 2020-04-17 10:44:47
tags: [unity, 方法]
---
一开始想详细写，后因全栈开发较忙，搁置了一段时间，现简单描述一下
### 方法一
#### 使用打印功能擦看出对应的类型AudioClip、Rigidbody2D等
#### 直接用他们申明数组，多维的用下面之类的格式
```
public Rigidbody2D[,] R2D = new Rigidbody2D[10,27];
```
#### 注意不能对太底层的申明，因为那就是深拷贝了，无法达到引用的目的
深浅拷贝可以看这里![https://blog.csdn.net/u014771617/article/details/45398955](https://blog.csdn.net/u014771617/article/details/45398955)

### 方法二
#### 使用object声明，
#### 之后再对数组进行转型，如下
```
newlsit = (AudioClip[])someList;
```
