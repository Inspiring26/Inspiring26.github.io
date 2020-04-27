---
title: unity播放视频，方法二
date: 2020-04-03 14:42:54
tags: [unity, 方法]
---
### 首先在画布游戏体里创建一个rawImage。
解释一下：
为什么要在画布游戏体里创建？
因为画可以理解成一个容器，其他ui元素都填充到该容器中。
如果你直接创建rawImage，系统会自动创建一个canvas，并把rawImage放在canvas下。
当然你也可以先船舰canvas，再选中它创建rawImage，效果是一样的。

另外，你加到canvas的组件并不会直接显示，而是在rawImage中设置的窗口里显示。
你把video palyer挂到canvas或rawImage上都可以，但显示窗口由rawImage决定。

「只有放在画布下的子物体才参与ui的渲染。」
![](1.0.png)

### 在画布中将宽、高调整为500、500，在Raw Image（script）里将新建的材质拉进去。
![](2.0.png)

材质随意新建一个就可以。
![](2.1.png)

### 将Video player组件添加到canvas或rawImage，感觉添加到后者更合理，将视频和材质都拉到对应的位置，渲染模式设置为rander texture。
![](3.0.png)

### 播放即可看到效果，视频、声音都有。
![](4.0.png)
