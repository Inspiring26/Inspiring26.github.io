---
title: docker_runtime_nvidia找不到文件问题
date: 2019-10-09 19:17:54
tags: [nvidia,cuda,docker]
---
[https://github.com/NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

打开以上链接安装一下以下指令
```
# Add the package repositories
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

$ sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
$ sudo systemctl restart docker


# On debian based distributions: Ubuntu / Debian
$ sudo apt-get update
$ sudo apt-get --only-upgrade install docker-ce nvidia-docker2
$ sudo systemctl restart docker

# All of the following options will continue working
#$ docker run --gpus all nvidia/cuda:9.0-base nvidia-smi
$ docker run --runtime nvidia nvidia/cuda:9.0-base nvidia-smi
```