---
title: unity创建滚动条
date: 2020-04-08 14:05:34
tags: [unity, 方法]
---
在遮挡图片同级创建一个scrollbar，
调整他的位置及滑动方向，一般选第三个bottom to top，
然后在遮蔽图片的scroll rect组件中有一个vertical Scrollbar区域来添加竖向滑动。

结构：
-- 背景图片
-- -- 遮蔽图片
-- -- -- 要显示的内容
-- -- Scrollbar