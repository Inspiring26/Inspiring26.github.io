---
title: 安装nvidia-docker
date: 2019-10-30 16:20:39
tags: [docker,nvidia]
---
```
sudo su
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

apt-get update && apt-get install -y nvidia-container-toolkit
systemctl restart docker
```
以上是在ubuntu18.04，外部已配好cuda环境。
