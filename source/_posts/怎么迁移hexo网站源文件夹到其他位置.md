---
title: 怎么迁移hexo网站源文件夹到其他位置
date: 2019-10-18 15:08:16
tags: [hexo]
---
只需将node文件夹复制/移动到其他位置就可以了。
比如我讲node文件夹从Downloads文件夹移动到～主目录下，并删除了文件夹名字中的版本号，复制的话可以正常运行，但是会重新生成hello world文章，可以通过将这个文章转换成草稿解决。
移动的话，需要在~/.bashrc中重新export一下/path/node/bin
然后source ~/.bashrc使之生效

不管复制还是移动都建议修改成新的位置

