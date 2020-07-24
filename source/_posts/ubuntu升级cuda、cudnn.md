---
title: ubuntu升级cuda、cudnn
date: 2020-07-24 11:19:26
tags: [ubuntu, cuda, cudnn, 升级, 方法]
---
升级python大版本后，需要重新安装多个库，包括pytorch相关的库。

### 1.查看已有的cuda
```
ls /usr/local/cuda*
```
cuda是带版本号cuda的软链

### 2.使用bin目录下自带脚本卸载
```
sudo /usr/local/cuda/bin/uninstall_*.pl
```

### 3.删除剩余文件
```
ls /usr/local/cuda*
sudo rm -rf /usr/local/cuda*
```

### 4.下载对应版本cuda、cudnn，注意是对应不是最新
```
# cuda toolkit  下载run文件
https://developer.nvidia.com/cuda-toolkit-archive
# cuDNN
https://developer.nvidia.com/rdp/cudnn-archive
# 同时参考pytorch的版本要求
https://pytorch.org/get-started/locally/
```

### 5.安装cuda
```
# 通常除了驱动都安装
sudo sh cuda_*_linux.run
```

### 6.修改环境变量
```
# vim ~/.bashrc

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH=$PATH:/usr/local/cuda/bin
export CUDA_HOME=$CUDA_HOME:/usr/local/cuda
```
有软链直接修改成cuda就可以了，不用加版本号

### 7.升级cudnn
```
tar -zxvf cudnn*.tgz

sudo cp include/cudnn.h /usr/local/cuda/include/
sudo cp lib64/lib* /usr/local/cuda/lib64/
# 在新文件夹建立软链
cd  /usr/local/cuda/lib64/
sudo chmod +r libcudnn.so.7.0.5
sudo ln -sf libcudnn.so.7.0.5 libcudnn.so.7  
sudo ln -sf libcudnn.so.7 libcudnn.so     
sudo ldconfig
```

### 8.OVER



