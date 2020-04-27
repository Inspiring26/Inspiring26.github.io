---
title: hexo开启busuanzi阅读量统计
date: 2019-10-10 18:39:13
tags: hexo
---
在next主题6以上的版本的配置文件_config.yml中，有
```javascript
busuanzi_count:
  enable: false
  total_visitors: true
  total_visitors_icon: user
  total_views: true
  total_views_icon: eye
  post_views: true
  post_views_icon: eye
```
参数。
将其中的enable 参数改成true即可。
在本地测试环境数值会很大，部署到线上就正常了。