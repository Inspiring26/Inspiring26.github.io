---
title: 百度、google、bing收录github pages站点
date: 2019-10-12 18:03:15
tags: [hexo,GitHub Pages]
---
由于Github Pages禁止的原因，百度、google、bing等搜索引擎都是不收录hexo-Github Pages创建的站点的，需要分别去每个搜索引擎提交站点。
### 百度
在themes/next/\_config.yml中将google-site-verification和baidu-site-verification、bing-site-verification的值设置为true。

打开百度的站点提交地址
[http://ziyuan.baidu.com/site/index](http://ziyuan.baidu.com/site/index)

一步步下去，由于hexo会修改根目录文件，文件验证会有问题，选择html标签验证。

修改```themes/next/layout/_partials/head/head.swig```中的元数据，baidu-site-verification对应的值。（ 一会儿google还要修改一次，bing目前没修改不知道有没有影响）

然后```sh deploy.sh```部署验证就可以了。

### Google
goole的方式类似，注意资源类型选**网址前缀**
地址：
[https://www.google.com/webmasters/tools/home?hl=zh-CN](https://www.google.com/webmasters/tools/home?hl=zh-CN)
### bing
用google帐号登录后可直接导入google的认证。
地址：
[https://www.bing.com/webmaster/home/mysites](https://www.bing.com/webmaster/home/mysites)

### 文章参考地址(关于站点地图的信息见这个链接)
[https://blog.csdn.net/qq_32454537/article/details/79482914](https://blog.csdn.net/qq_32454537/article/details/79482914)

### 10.14更新
文件验证方式或许可以把文件放在public文件夹(未验证)，因为pubic文件夹下的文件不会被修改。
另外，由此可知：通过在public文件夹下放置文件、文件夹，就行成了一个类似ftp的下载站点。
另外2，由于放在github pages上，速度依然不快，但是只要本地服务运行就可以本地访问，这就很快了。
另外3，可以简单的运行hexo服务建立文件下载服务(需要输入完整的文件名，不可以查看目录)。

### 10.22更新
bing不要忘了提交sitemap。
