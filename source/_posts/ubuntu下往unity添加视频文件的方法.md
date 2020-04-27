---
title: ubuntu下往unity添加视频文件的方法
date: 2020-04-03 14:10:27
tags: [unity, ubuntu, 方法]
---
### 直接添加mp4等文件失败的原因是
unity需要使用quicktime player作为视频的播放器。
mac自带，windows可以安装，linux不好处理。

### 解决方法
用ffmpeg将视频转换成unity自身支持的ogv格式。
指令：
```
ffmpeg -i video.mp4 vode.ogv
```
再次导入即可成功。
