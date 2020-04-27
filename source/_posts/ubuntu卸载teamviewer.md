---
title: ubuntu卸载teamviewer
date: 2019-10-12 09:57:20
tags: [ubuntu,teamviewer]
---
由于近期teamviewer后台服务器被黑，先卸载teamviewer。
[新闻链接](https://www.oschina.net/news/110507/apt41-teamviewer-was-hacked)
ubuntu下卸载指令：
```
apt --purge remove teamviewer
```
查看5938端口：
```
netstat -anp | grep 5938
```
如果没有结果就表示成功卸载。
