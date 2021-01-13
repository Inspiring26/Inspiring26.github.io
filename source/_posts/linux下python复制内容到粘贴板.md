---
title: linux下python复制内容到粘贴板
date: 2021-01-13 16:52:19
tags: [linux, python, 方法]
---
### 安装pyperclip库
```
pip3 install pyperclip
```
### 安装xclip
```
sudo apt install xclip
```
### 和粘贴板交互
```
import pyperclip
# 复制到粘贴板
pyperclip.copy('test')
# 从粘贴板复制
pyperclip.paste()
```

