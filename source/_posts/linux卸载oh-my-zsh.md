---
title: linux卸载oh_my_zsh
date: 2020-11-19 14:33:16
tags: [linux, 方法]
---
### 卸载
```
➜  ~ uninstall_oh_my_zsh
Are you sure you want to remove Oh My Zsh? [y/N] y
Removing ~/.oh-my-zsh
Looking for original zsh config...
Switching your shell back to '/bin/bash':
Password: 
Thanks for trying out Oh My Zsh. It's been uninstalled.
Don't forget to restart your terminal!
```

### 切换or not
```
sudo chsh -s /bin/bash
```
