---
title: 多出编辑更新hexo博客方法
date: 2020-05-06 14:20:18
tags: [hexo,方法,git]
---
### 首先在原博客处建立分支，将hexo后端文件同步到github
如source分支
hexo建立的blog，一开始是没有git init的，这一点记不清了也没验证。
要把源文件更新到github的话，先git init，然后建立、切换分支，提交，添加远程git仓库地址，推送本地到远程。
代码如下：
```

git init
git checkout -b source
git add -A
git commit -m "init blog"
git remote add origin git@github.com:{username}/{username}.github.io.git
git push origin source
```
在这以后是可以切换master和source分支的。

### 在树莓派上配置环境
#### 安装node
使用二进制代码安装比较好，也不需要编译.
先去node.js官方网站下载：https://nodejs.org/zh-cn/download/
代码如下：
```
wget -c https://nodejs.org/dist/v12.16.3/node-v12.16.3-linux-armv7l.tar.xz
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-v12.16.3-linux-armv7l.tar.xz -C /usr/local/lib/nodejs
cd ~
sudo echo "export PATH=/usr/local/lib/nodejs/node-v12.16.3-linux-armv7l/bin:$PATH" >> .bashrc
source .bashrc
```
然后，用hexo -v ;npm -v 验证版本。
#### 安装hexo
以管理员权限安装hexo
```
sudo npm install -g hexo-cli
```
#### git clone 远程仓库
```
git clone git@XXX
# 切换到新分支
# 这里需要新建并切换
git checkout -b source origin/source
```
#### 切换到blog文件夹运行hexo
运行hexo，这时回报错，根据提示再次安装
```
npm install hexo --save
npm audit fix
```
#### 去专门的仓库拉去主题（这一步也可以改成将主题下的.git文件删除，一次拉去源文件和主题的）
```
cd theme
rm -r next
git clone git@XXX
cd ..
```
### 验证
#### 创建新文章

```
hexo n "测试文章"
vim source/_posts/测试文章.md
```
#### 将两处连接添加到文章末尾（希望在文末追加一些固定文字时才需要此步骤）
```
cat links.txt >> source/_posts/多出编辑更新hexo博客方法.md
```
#### 验证本地运行
```
hexo s
```
#### 验证远程推送到github page
```
sh deploy.sh
```
### 验证成功后可以推送源文件的更新到github的source分支
```
git push
```







老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)
