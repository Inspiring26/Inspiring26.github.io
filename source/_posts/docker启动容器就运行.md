---
title: docker启动容器就运行
date: 2021-07-02 08:20:02
tags: [docker, 方法]
---
### 目标
执行
```
docker run -dit -p 4001:8080 hexoblog:v1.0
```
就创建容器并运行blog服务

### CMD方式
Dockerfile里的CMD指令是会被docker run后面加的指令覆盖的。
并且，多个CMD只会执行最后一个。
使用方式：
```
CMD ["hexo", "s", "-p", "8080", "&"]
```
正常，启动就运行。

```
CMD hexo s -p 8080 &
```
这种直接写shell语句是无法正常运行的。

### ENTRYPOINT方式
ENTRYPOINT是一种不会被docker run 后面指令覆盖的方式。
使用方式：
```
ENTRYPOINT ["hexo", "s", "-p", "8080", "&"]
```


