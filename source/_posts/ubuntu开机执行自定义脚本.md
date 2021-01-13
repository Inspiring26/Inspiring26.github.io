---
title: ubuntu开机执行自定义脚本
date: 2021-01-13 18:02:01
tags: [ubuntu, 方法]
---
### 准备工作
切换到root。
没有的文件自己创建新的。

### 创建或修改rc-local.service
vim /etc/systemd/system/rc-local.service

```
[Unit] 
Description=/etc/rc.local Compatibility 
ConditionPathExists=/etc/rc.local 

[Service] 
Type=forking 
ExecStart=/etc/rc.local start 
TimeoutSec=0 
StandardOutput=tty 
RemainAfterExit=yes 
SysVStartPriority=99 

[Install]
WantedBy=multi-user.target
```
### 穿件或修改对应的rc.local
vim  /etc/rc.local

```
#!/bin/sh -e 
## rc.local

# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other 
# value on error. 
# In order to enable or disable this script just change the execution  bits. 
# By default this script does nothing. 

#start script

cd /home/h2/stat\_data
python3 switchControl.py >> control.log &

#end script

exit 0
```
### 加权限
```
chmod +x /etc/rc.local
```

### 开启服务
```
systemctl enable rc-local
```

### 运行
```
systemctl start rc-local.service
```

### 查看当前运行状态
```
systemctl status rc-local.service
```

### 总结
从上面配置可以看出，/etc/systemd/system/下的服务名可以随意设定。
里面对应的local文件路径要写对。
然后看开启服务、运行服务、查看状态即可。
