---
title: ubuntu升级python版本详细流程
date: 2020-07-23 18:26:59
tags: [ubuntu, python, 方法]
---
### 本方法使用的是apt安装

### 1.搜索ppa,找到可用的源

### 2.在launchpad.net里搜索python3

### 3.建议找到一个叫Jonathon F的用户，他编译的包比较可靠。可以进入他的主页找到他发布的python的各个版本。

### 4.以python3.8为例，打开对应页面

### 5.里面有这样的添加ppa的指令
```
sudo add-apt-repository ppa:jonathonf/python-3.8
sudo apt-get update
```

### 6.添加、更新完后安装
```
sudo apt install python3.8
```

### 7.查看目前有的python版本
```
$ ls /usr/bin/pytho*
/usr/bin/python              /usr/bin/python3.6
/usr/bin/python2             /usr/bin/python3.6-config
/usr/bin/python2.7           /usr/bin/python3.6m
/usr/bin/python2.7-config    /usr/bin/python3.6m-config
/usr/bin/python2-config      /usr/bin/python3.8
/usr/bin/python2-jsonschema  /usr/bin/python3-config
/usr/bin/python2-pbr         /usr/bin/python3m
/usr/bin/python2-wsdump      /usr/bin/python3m-config
/usr/bin/python3             /usr/bin/python-config

```

### 8.删除老版本
```
sudo rm /usr/bin/python3.6
```

### 9.删除原来的软链接
```
sudo rm /usr/bin/python3
```

### 10.创建新的软链接
```
sudo ln -s /usr/bin/python3.8 /usr/bin/python3
```

### 11.可能需要重新安装pip
```
wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
sudo python3 get-pip.py
```

### 12.pip3 list 会发现有很多库消失了，需要重新安装。OVER
