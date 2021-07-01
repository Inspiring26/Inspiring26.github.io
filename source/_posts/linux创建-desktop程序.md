---
title: linux创建.desktop程序
date: 2021-07-01 18:03:24
tags: [linux, manjaro, 方法]
---
### 1.确定程序可以双击执行

### 2.创建.desktop文件
主要是填写文件位置和添加图片

```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/home/h/下载/VNC-Viewer-6.21.406-Linux-x64/vncviewer
Name=vnc view
Icon=/home/h/下载/VNC-Viewer-6.21.406-Linux-x64/icons/vncviewer48x48.png
```
### 3.复制到/usr/share/applications
```
sudo cp vncview.desktop /usr/share/applications/
```
### 4.至此可以在系统里搜到app

