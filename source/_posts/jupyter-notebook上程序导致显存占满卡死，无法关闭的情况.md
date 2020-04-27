---
title: jupyter_notebook上程序导致显存占满卡死，无法关闭的情况
date: 2019-10-09 16:47:47
tags: [深度学习,jupyter]
---
1.当在jupyter notebook中调试程序导致程序无法关闭时，可以使用```ps -aux|grep python```来排查
2.当发现多个和jupyter notebook相关的进程时，应该考虑进程号靠后的，靠前的时启动jupyter notebook程序的进程。```kill -9 [进程号]```后成功释放显存。如下图所示：
![](screenshot_61.png)
### 关于kill -9
默认参数下，kill 发送SIGTERM（15）信号给进程，告诉进程，你需要被关闭，请自行停止运行并退出。
kill -9 发送SIGKILL信号给进程，告诉进程，你被终结了，请立刻退出。
因此 kill - 9 表示强制杀死该进程,同时接收这个信号的进程在收到这个信号时不能执行任何清理。
### 更新
```
nvidia-smi
```
哪个占的多kill -9 哪个