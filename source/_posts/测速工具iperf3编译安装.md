---
title: 测速工具iperf3编译安装
date: 2020-06-09 16:30:54
tags: [方法]
---
### 下载
```
wget -c https://iperf.fr/download/source/iperf-3.1.3-source.tar.gz
```

### 解压编译
```
tar -zxvf iperf-3.1.3-source.tar.gz
cd iperf-3.1.3/
./configure
make
sudo su
make install
```
### 修复一个小问题
```
iperf3
ldconfig
```

### 运行
```
# 服务端
iperf3 -s

# 客户端
iperf3 -c 127.0.0.1 -t 10
# 或
iperf3 -c 192.168.1.114 -t 10
```
根据测试本地还是测试多机通信决定
