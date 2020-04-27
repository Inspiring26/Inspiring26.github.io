---
title: unity2D朝向目标的方法
date: 2020-04-17 09:42:16
tags: [unity, 方法]
---
以火箭始终朝向砖块为例
```
Vector3 dir = brickList[target%10].transform.position - rocket.transform.position;
float angle = Mathf.Atan2(dir.y,dir.x) * Mathf.Rad2Deg;
rocket.transform.rotation = Quaternion.AngleAxis(270+angle, Vector3.forward);
```
### Mathf.Atan2
反正弦函数，输入两个参数：y轴长度、x轴长度
如Mathf.Atan2(1,1)的值为0.7853982，约是3.14除以4。

### Mathf.Rad2Deg
弧度到度的转化常量，等于360/（PI\*2）
还有一个相反的函数Mathf.Deg2Rad

### Quaternion.AngleAxis
Quaternion是unity中的四元数，
```
//transform沿y轴旋转30度 
transform.rotation = Quaternion.AngleAxis(30, Vector3.up); 
//transform沿z轴旋转30度 
transform.rotation = Quaternion.AngleAxis(30, Vector3.forward); 
//transform沿x轴旋转30度 
transform.rotation = Quaternion.AngleAxis(30, Vector3.left); 
```
