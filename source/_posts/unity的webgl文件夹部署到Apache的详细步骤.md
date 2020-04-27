---
title: unity的webgl文件夹部署到Apache的详细步骤
date: 2020-04-17 14:09:27
tags: [unity, Apache, 方法]
---
在网上找了半天就没有一个把unity发布为webgl，并部署到Apache的详细方法。
所以自己写一个

### 发布为webgl
在unity窗口file->build setting->
选中webgl；
至少选中一个场景；
webgl右侧什么都不选；
然后build and run；
![](1.0.png)

编译结束会在本地浏览器打开网页，要保证这一步哪呢个通说明游戏没问题。

### 部署到Apache
#### 安装apache
以ubuntu下为例：
```
apache2 -version //验证有没有

sudo apt update
sudo apt install apache2
apache2 -version //验证是否安装成功

//配置UFW防火墙
sudo ufw app list
//包含以下信息
Apache
Apache Full
Apache Secure
CUPS
OpenSSH


sudo ufw allow 'Apache'

//验证Apache服务是否正在运行。
//其实我在这一项有些功能没有正常运行，但是并没影响后面webgl的运行
sudo systemctl status apache2

//可以查看本地ip 方便复制使用
hostname -I

```
在浏览器里打开，可以看到apache的默认页面；
找到www/html信息的位置；
以管理员权限修改index.html文件名；
以管理员权限将webgl的Build、TemplateData、index.html文件复制到/var/www/html/下
```
sudo cp -r ./* /var/www/html/
```
![](2.0.png)

打开localhost
![](2.1.png)
