---
title: 安装nodejs、npm、hexo
date: 2021-05-24 18:07:25
tags: [方法]
---
### 去nodejs官方网站下载安装包
[官方地址](https://nodejs.org/en/download/)
比如下载Linux Binaries (x64)版

### 参考下载页面下的链接安装
比如参考名为Installing Node.js via binary archive的链接
[安装流程页面](https://github.com/nodejs/help/wiki/Installation)

修改VERSION为下载安装包版本后，按1、2、3、4步骤完成nodejs、npm安装
```
1.Unzip the binary archive to any directory you wanna install Node, I use /usr/local/lib/nodejs
 VERSION=v10.15.0
 DISTRO=linux-x64
 sudo mkdir -p /usr/local/lib/nodejs
 sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs 
2.Set the environment variable ~/.profile, add below to the end
# Nodejs
VERSION=v10.15.0
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
3.Refresh profile
. ~/.profile
4.Test installation using
$ node -v

$ npm version

$ npx -v
```
### 安装hexo
```
npm install -g hexo-cli
```
之后执行hexo，显示正常即完成安装。

