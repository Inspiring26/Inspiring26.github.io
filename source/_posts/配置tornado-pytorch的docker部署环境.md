---
title: 配置tornado+pytorch的docker部署环境
date: 2019-10-28 11:04:52
tags: [pytorch,tornado,redis,docker]
---
### 拉去指定docker镜像（目前pytorch支持到pytorch1.3，python3.7）
```
docker pull python:3.7
```
### 运行容器
```
docker run -dit python:3.7
```
### 进入容器
```
docker ps
#59fe58579fd2        python:3.7          "bash"              35 minutes ago 
docker exec -it 59fe bash
```
### 配置环境
```
python -V
#Python 3.7.5
pip3 instll -i https://pypi.tuna.tsinghua.edu.cn/simple torch==1.3.0+cpu torchvision==0.4.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

pip3 instll -i https://pypi.tuna.tsinghua.edu.cn/simple tornado redis pillow efficientnet_pytorch
```
此外，py文件中torch.load()要添加
```
,map_location=torch.device('cpu')
```
从而运行在cpu环境下。
### 安装redis数据库
apt不能用临时源，且为了安装最新版本，从源文件编译安装
```
wget -c http://download.redis.io/releases/redis-5.0.5.tar.gz

tar xzf redis-5.0.5.tar.gz
cd redis-5.0.5
make
```
### 启动redis
```
cd src/
nohup ./redis-server &
./redis-cli
```
