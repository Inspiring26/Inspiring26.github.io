---
title: ubuntu18.04部署hexo
date: 2020-05-20 10:30:07
tags: [ubuntu, hexo,方法]
---
### ubuntu安装node
参考连接：
[https://github.com/nodesource/distributions/blob/master/README.md](https://github.com/nodesource/distributions/blob/master/README.md)
指令：
```
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs
```
### 查看版本
```
node -v
npm -v
```

### 安装hexo
```
npm install -g hexo-cli
```

### 查看hexo自带功能
```
hexo
```
可能会没有server参数

### 新建文章
```
hexo n alitset
vim source/_posts/alitest.md

```
### 逐步部署查找问题
```
hexo clean
hexo generate
hexo deploy
```

### 处理ERROR Deployer not found: git 错误
```
npm install --save hexo-deployer-git
```

### 配置git邮箱和用户名信息
```
git config --global user.email 1xxxx@qq.com
git config --global user.name wxxx

```

### 尝试部署
```
sd deploy.sh 
```
### 查看hexo功能
此时可能出现server参数了
```
hexo
```

### 启动服务到默认端口或指定端口
```
hexo server
或
hexo server -p 80
```
更多hexo信息参考：
[https://hexo.io/zh-cn/docs/server.html](https://hexo.io/zh-cn/docs/server.html)
### 后台运行
```
setsid hexo server -p 80
```


