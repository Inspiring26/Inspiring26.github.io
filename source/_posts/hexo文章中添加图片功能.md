---
title: hexo文章中添加图片功能
date: 2019-10-09 15:50:04
tags:
---
1.修改根目录_config.yml:将post_asset_folder: false改为post_asset_folder: true

2.安装插件:```npm install https://github.com/CodeFalling/hexo-asset-image -- save```

3.在运行```hexo n  ```创建新文章时会生成对应的文件夹，将图片放入文件夹。

4.使用 ```![](图片名字.图片格式)``` 插入图片。

示例:
![](1122.png)