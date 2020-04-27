---
title: tornado从tornado.web.RequestHandler类继承下来的Handler类的一些基本方法
date: 2019-10-23 11:27:47
tags: [python,tornado]
---
```
Most of the work of a Tornado web application is done in subclasses of RequestHandler. 
```
Tornado Web应用程序的大部分工作都是在RequestHandler的子类中完成的。
```
The main entry point for a handler subclass is a method named after the HTTP method being handled:get(), post(), etc.
```
处理程序子类的主要入口点是以处理HTTP方法命名的方法：get(), post()等。
```
Each handler may define one or more of these methods to handle different HTTP actions.
```
每个处理程序可以定义一个或多个这些方法来处理不同的HTTP操作。
```
As described above, these methods will be called with arguments corresponding to the capturing groups of the routing rule that matched.
```
如上所述，将使用与匹配的路由规则的捕获组相对应的参数来调用这些方法。

```
Within a handler, call methods such as RequestHandler.render or RequestHandler.write to produce a response.
```
在处理程序中，调用诸如RequestHandler.render或RequestHandler.write之类的方法以产生响应。
### ender()
```
render() loads a Template by name and renders it with the given arguments.
```
render（）按名称加载模板，并使用给定的参数进行渲染。
### write()
```
write() is used for non-template-based output; it accepts strings, bytes, and dictionaries (dicts will be encoded as JSON).
```
write（）用于基于非模板的输出；它接受字符串，字节和字典（字典将被编码为JSON）。

```
Many methods in RequestHandler are designed to be overridden in subclasses and be used throughout the application. It is common to define a BaseHandler class that overrides methods such as write_error and get_current_user and then subclass your own BaseHandler instead of RequestHandler for all your specific handlers.
```
RequestHandler中的许多方法被设计为在子类中重写，并在整个应用程序中使用。定义一个BaseHandler类来覆盖诸如write_error和get_current_user之类的方法是很常见的，然后为您所有的特定处理程序创建您自己的BaseHandler而不是RequestHandler的子类。