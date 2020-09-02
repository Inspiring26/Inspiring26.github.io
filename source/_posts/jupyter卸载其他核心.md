---
title: jupyter卸载其他核心
date: 2020-09-02 11:06:11
tags: [jupyter, 方法]
---
### 查看
```
➜  ~ jupyter kernelspec list
Available kernels:
  javascript    /home/h/.local/share/jupyter/kernels/javascript
  python3       /home/h/.local/share/jupyter/kernels/python3

```

### 卸载
```
➜  ~ jupyter kernelspec remove javascript
Kernel specs to remove:
  javascript          	/home/h/.local/share/jupyter/kernels/javascript
Remove 1 kernel specs [y/N]: y
[RemoveKernelSpec] Removed /home/h/.local/share/jupyter/kernels/javascript
```
