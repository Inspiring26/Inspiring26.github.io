---
layout: hexo
title: create_ap配置热点及随系统启动
date: 2020-12-16 11:12:19
tags: [方法, linux]
---
### 配置
```
sudo vim /etc/create_ap.conf
```
### 修改
```
WIFI_IFACE=wlx983f9f1816c5
INTERNET_IFACE=enp2s0
SSID=hhh
PASSPHRASE=****#密码
```
### 开启、关闭、开机启动
```
sudo systemctl start create_ap # 开启热点
sudo systemctl stop create_ap # 关闭热点
sudo systemctl enable create_ap.service # 开机启动
```
```
h@h-B360M-D2VX-SI:~/Github/blog$ sudo systemctl enable create_ap.service
Created symlink /etc/systemd/system/multi-user.target.wants/create_ap.service → /usr/lib/systemd/system/create_ap.service.

```
