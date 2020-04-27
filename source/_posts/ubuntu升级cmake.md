---
title: ubuntu升级cmake
date: 2019-11-14 14:05:05
tags: [ubuntu,cmake]
---
### 去github下载最新版本或要升级的版本

[https://github.com/Kitware/CMake/releases](https://github.com/Kitware/CMake/releases)
这里有所有的发布版

可以下载一个sh文件，运行sh文件相当于解压，比如cmake-3.15.5-Linux-x86_64.sh
wget下载特别慢，chrome插件chrono下载速度很快，其实在很多下载上它都更快，在可能的情况下尽量选它。

### 解压
```
sh cmake-3.15.5-Linux-x86_64.sh
```
### 移动
```
sudo mv cmake-3.15.5-Linux-x86_64 /opt/cmake-3.15.5
```
需要管理员权限
### 建立软连接
```
sudo ln -sf /opt/cmake-3.15.5/bin/* /usr/bin/

```
同样，管理员权限
### 验证
```
$cmake --version
cmake version 3.15.5

CMake suite maintained and supported by Kitware (kitware.com/cmake).

```