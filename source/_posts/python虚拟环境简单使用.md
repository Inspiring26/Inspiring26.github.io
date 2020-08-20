---
title: python虚拟环境简单使用
date: 2020-08-20 10:12:45
tags: [python, 方法]
---
### 安装virtualenv
```
pip3 install virtualenv
```
### 查看版本
```
virtualenv --version
```
如果版本大于20，默认不复制系统库

### 进入项目文件夹，创建虚拟环境
```
virtualenv venv
```
### 进入环境
```
source venv/bin/activate
```
### 完成使用后退出虚拟环境
```
deactivate
```

