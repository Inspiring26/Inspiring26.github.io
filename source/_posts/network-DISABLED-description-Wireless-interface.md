---
title: 'network DISABLED description: Wireless interface'
date: 2020-12-16 11:21:43
tags: [linux, 方法]
---
linux打开无线网卡
### 查看
```
h@h-B360M-D2VX-SI:~/Downloads/wicd$ lshw -C network
WARNING: you should run this program as super-user.
  *-network                 
       description: Ethernet interface
       product: RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
       vendor: Realtek Semiconductor Co., Ltd.
       physical id: 0
       bus info: pci@0000:02:00.0
       logical name: enp2s0
       version: 16
       serial: e0:d5:5e:ca:e7:d7
       size: 100Mbit/s
       capacity: 1Gbit/s
       width: 64 bits
       clock: 33MHz
       capabilities: bus_master cap_list ethernet physical tp mii 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation
       configuration: autonegotiation=on broadcast=yes driver=r8169 duplex=full firmware=rtl8168h-2_0.0.2 02/26/15 ip=192.168.2.38 latency=0 link=yes multicast=yes port=MII speed=100Mbit/s
       resources: irq:16 ioport:3000(size=256) memory:a5204000-a5204fff memory:a5200000-a5203fff
  *-network DISABLED
       description: Wireless interface
       physical id: 1
       bus info: usb@1:3
       logical name: wlx983f9f1816c5
       serial: 98:3f:9f:18:16:c5
       capabilities: ethernet physical wireless
       configuration: broadcast=yes driver=rt2800usb driverversion=5.4.0-54-generic firmware=N/A link=no multicast=yes wireless=IEEE 802.11
WARNING: output may be incomplete or inaccurate, you should run this program as super-user.

```
### 找到名字后开启
```
sudo ifconfig wlx983f9f1816c5 up
```

### 再查看，已经开启
```
h@h-B360M-D2VX-SI:~/Downloads/wicd$ lshw -C network
WARNING: you should run this program as super-user.
  *-network                 
       description: Ethernet interface
       product: RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
       vendor: Realtek Semiconductor Co., Ltd.
       physical id: 0
       bus info: pci@0000:02:00.0
       logical name: enp2s0
       version: 16
       serial: e0:d5:5e:ca:e7:d7
       size: 100Mbit/s
       capacity: 1Gbit/s
       width: 64 bits
       clock: 33MHz
       capabilities: bus_master cap_list ethernet physical tp mii 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation
       configuration: autonegotiation=on broadcast=yes driver=r8169 duplex=full firmware=rtl8168h-2_0.0.2 02/26/15 ip=192.168.2.38 latency=0 link=yes multicast=yes port=MII speed=100Mbit/s
       resources: irq:16 ioport:3000(size=256) memory:a5204000-a5204fff memory:a5200000-a5203fff
  *-network
       description: Wireless interface
       physical id: 1
       bus info: usb@1:3
       logical name: wlx983f9f1816c5
       serial: 98:3f:9f:18:16:c5
       capabilities: ethernet physical wireless
       configuration: broadcast=yes driver=rt2800usb driverversion=5.4.0-54-generic firmware=0.36 link=no multicast=yes wireless=IEEE 802.11
WARNING: output may be incomplete or inaccurate, you should run this program as super-user.

```
### 查看网络信息
```
h@h-B360M-D2VX-SI:~/Downloads/wicd$ ifconfig
enp2s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.2.38  netmask 255.255.252.0  broadcast 192.168.3.255
        inet6 fe80::9a45:2081:a371:efdd  prefixlen 64  scopeid 0x20<link>
        ether e0:d5:5e:ca:e7:d7  txqueuelen 1000  (Ethernet)
        RX packets 54246037  bytes 22551243144 (22.5 GB)
        RX errors 0  dropped 4864651  overruns 0  frame 0
        TX packets 10198222  bytes 2698013990 (2.6 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 1215066  bytes 663870515 (663.8 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1215066  bytes 663870515 (663.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlx983f9f1816c5: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether 98:3f:9f:18:16:c5  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
已经开启，接下来就可以配合create\_ap创建热点
