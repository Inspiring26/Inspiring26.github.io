---
title: python装饰器
date: 2020-09-23 16:54:52
tags: [python, 总结]
---
装饰器
```
def foo():  
    print 'in foo()'  
   
# 定义一个计时器，传入一个，并返回另一个附加了计时功能的方法  
def timeit(func):  
       
    # 定义一个内嵌的包装函数，给传入的函数加上计时功能的包装  
    def wrapper():  
        start = time.clock()  
        func()  
        end =time.clock()  
        print 'Time Elapsed:', end - start  
       
    # 将包装后的函数返回  
    return wrapper  
```
的实际使用是
```
foo = timeit(foo)
```
简写为
```
@timeit
def foo()
```
很好理解：新foo等于
```
def wrapper():  
    start = time.clock()  
    foo() # 原foo()函数  
    end =time.clock()  
    print 'Time Elapsed:', end - start 

```
### 总结
就是经过装饰器，把原函数传到新函数了。在新函数中又定义了一个嵌套函数，其实最终返回的结果就是这个嵌套函数。

