---
title: 服务器上部署hexo镜像或者个人其他镜像
date: 2021-07-02 08:32:44
tags: [hexo, docker, 部署, 方法]
---
### 写在开始前
这不是理想的方法，理想的方法是使用私有镜像仓库push pull,并且docker提供的有部署私有仓库的镜像叫registry。
这是本地创建镜像的记录。

### 步骤
```
如果把文件夹及Dockerfile复制到服务器上
sudo docker build -t hexoblog:v1.0 .
docker run -dit -p 4000:8080 hexoblog:v1.0
ssh-keygen -t  rsa
cat /root/.ssh/id_rsa.pub
添加到github
setsid sh autoPull.sh
```
