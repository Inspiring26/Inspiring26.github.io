---
title: Dockerfile几个技巧
date: 2021-07-07 08:59:52
tags: [docker, 经验]
---
在用Dockerfile构建镜像时，有以下几个技巧

#### 先只写到copy字段，然后进去逐步运行，可运行后再在Dockerfile里写

#### 有错误的镜像，直接将版本号递增，等最终完成后在一次性清理

#### 在每个项目目录里可以建一个Dockerfile文件夹，打包后到其他地方解压就可以build并运行，可以把run指令写在Dockerfile文件注释里
