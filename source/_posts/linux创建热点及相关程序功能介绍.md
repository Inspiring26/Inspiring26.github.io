---
title: linux创建热点及相关程序功能介绍
date: 2020-12-30 17:50:49
tags: [linux, ubuntu, 方法]
---
### 前言
我的150Mbs的RT3070l无线网卡，通过create\_ap创建的热点下载速度在500-700k，而且首次打开网页很慢。
今天集中解决一下这个问题。
create\_ap仓库已经停止维护，在其页面上推荐了一个图形界面的分支。
名字叫[linux-wifi-hotspot](https://github.com/lakinduakash/linux-wifi-hotspot)。
也可以叫 WiFi hotspot(linux搜索里显示的)，
也可以叫 wihotspot (终端启动的指令)。
下载、安装后，网络上也没找到详细的介绍。
下面介绍下界面各个功能的含义，及对应效果。

### 界面
![2020-12-30\_17-49.png](2020-12-30_17-49.png)

### 功能
SSID 热点的名字
Password 密码
Open 选中则不使用密码
WiFi interfaces 建立热点的无线网卡
Internet interfaces 机器上联网的网卡
Frequency band 根据无线网卡功能选，5G快距离近
Hidden 隐藏网络
Use psk 加密的一个选项，可不勾
Set mac 只有设置的mac才能连接
No virt 不使用虚拟化接口功能，经过测试，不选网速更快
Channel 取值范围在1-11，我的只有在7及以下才可使用，越大网速越快
Mac Filter 添加mac的设备无法连接
80211n 80211ac ac比n更快，支持ac就选ac

### 效果
下载局域网网盘文件：
在安卓iqoo z1下可以达到4.2M/s
在iPhone12下可以3.6M/s

