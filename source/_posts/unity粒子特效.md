---
title: unity粒子特效
date: 2020-05-21 14:07:13
tags: [unity, 方法]
---
### 控制方向
默认是发散的，把Rect Transform里的Rotation为（90，0，0），方向就是朝下。

### 控制喷射粒子的长度
逐渐调整粒子系统主面版的Start Lifetime数值，可以看到火焰长度的变化

### 控制粒子体积变化
激活Size over Lifetime，点击面板上方打开编辑器，即可调整体积百分比随时间变化

### 调整粒子的频率或者说间隔
激活Emission，调整单位时间生成粒子的数量RateOverTime即可


