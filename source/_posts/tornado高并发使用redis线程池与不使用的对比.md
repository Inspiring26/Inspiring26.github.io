---
title: tornado高并发使用redis线程池与不使用的对比
date: 2019-10-24 11:20:06
tags: [tornado,python,redis,siege]
---
使用的是siege进行的压测：
![不使用线程池](screenshot_67.png)
![使用线程池](screenshot_68.png)

从图上可以看到对于高并发使用线程池后在各项响应时间上都有提升的。
可见在高并发，尤其是和tornado搭配使用的时候务必使用redis且用线程池。
tornado和redis有很多相似的地方比如都是单线程，都是非阻塞IO。
它两个应该配合使用，应该作为在相应方面的主要工具，毕竟速度越快越好。