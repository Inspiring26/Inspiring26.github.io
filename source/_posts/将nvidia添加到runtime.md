---
title: 将nvidia添加到runtime
date: 2020-03-16 13:08:14
tags: [方法, nvidia, docker]
---
要使docker容器能调用本地的gpu,有三种种方法。
一是，安装nvidia-docker，该方法已被官方舍弃，地址为[https://github.com/NVIDIA/nvidia-docker#upgrading-with-nvidia-docker2-deprecated](https://github.com/NVIDIA/nvidia-docker#upgrading-with-nvidia-docker2-deprecated)
二是，安装nvidia-container-toolkit，后添加--gpus参数来使用，地址为:
安装[https://github.com/NVIDIA/nvidia-docker#ubuntu-16041804-debian-jessiestretchbuster](https://github.com/NVIDIA/nvidia-docker#ubuntu-16041804-debian-jessiestretchbuster)
使用[https://github.com/NVIDIA/nvidia-docker#usage](https://github.com/NVIDIA/nvidia-docker#usage)
三是，安装nvidia-container-runtime，在首次运行时添加--runtime=nvidia参数，后续启动、结束都不需要再加。
安装使用流程为：
```
apt-get install nvidia-container-runtime

tee /etc/docker/daemon.json <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF

docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi #正常就可以了
```