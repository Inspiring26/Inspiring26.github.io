---
title: unity2D分辨率适配
date: 2020-05-14 10:02:41
tags: [unity, 方法]
---
假如你以375*667的分辨率做的游戏，
现在要适配1080*1920分辨率的机器（这个分辨率是目前比较主流的分辨率）。

不用一个个元素的修改，
也有一个前提，如果想图不糊，你是把1080*1920的图放在了375*667的框里，这样放大才不糊。

具体扩大分辨率的方法是：
在Canvas的Canvas Scaler 里将mode选择Scale with Screen，
第二行的默认分辨率写成你实际开发过程中的分辨率，本例中是375*667。
然后去game窗口将比例调成16:9(9:16)或其他分辨率，就可以看到真实的显示效果。







老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)
