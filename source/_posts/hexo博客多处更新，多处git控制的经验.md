---
title: hexo博客多处更新，多处git控制的经验
date: 2020-04-28 11:14:52
tags: [git,hexo,同步,多终端,方法]
---
### 背景
在ubuntu主机上有一个hexo的完整环境，可以发布更新博客。
### 目标
在ubuntu、MBA、树莓派等设备上都可以进行博客更新，并且数据一致
（本文章是在MBA上完成）
### 步骤
#### 第一,推送到gitgub
在ubuntu上hexo根目录，
```
git checkout -b source #创建新分支source
git add -A
git commit -m "init blog"
git remote add origin git@github.com:{username}/{username}.github.io.git
git push origin source #本地origin推到source
```
单独推送主题文件夹：
```
cd theme/next/
git init
git add -A
git commit -m "first commit"
git remote add origin git@github.com:{username}/{username}.theme.next.git #这个仓库是新建的，专门用来存放改动过的主题next
git push -u origin master
```
#### 第二，安装node环境
MBA：
```
brew install node.js
npm install -g hexo-cli
```
其他端类似，就是安装node和hexo

### 第三，pull
MBA:
```
git clone git@github.com:{username}/{username}.github.io.git
git checkout source
git pull #这两部是切换分支，和拉去改分支文件，其实就是个切换，文件提前一起拉下来了
cd theme
git clone git@github.com:{username}/{username}.theme.next.git
mv theme.next next
cd ..
hexo s
```
到次应该可以正常运行了

### 总结
要git clone某个分支：
```
git clone git@github.com:{username}/{username}.github.io.git
git checkout source
git pull
```
仓库中有仓库，也就是说.git文件夹的子文件夹还要.git时，
在处理上层.git时，会忽略下层的，只保留了个文件夹名
