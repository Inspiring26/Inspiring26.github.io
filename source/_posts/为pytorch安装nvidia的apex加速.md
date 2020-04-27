---
title: 为pytorch安装nvidia的apex加速
date: 2019-10-10 14:05:57
tags: [nvidia,pytorch]
---
三个指令，不需要配置环境变量
```
$ git clone https://github.com/NVIDIA/apex
$ cd apex
$ pip3 install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
```