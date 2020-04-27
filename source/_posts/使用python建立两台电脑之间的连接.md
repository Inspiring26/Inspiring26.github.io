---
title: 使用python建立两台电脑之间的连接
date: 2019-11-05 14:27:44
tags: [python,socket]
---
只需要使用python的socket库就可以建立两台电脑的数据通信
### 选择主机和端口
选择一个电脑以它的端口作为交换的点，所有的数据都往这个点发送，或从这个点获取。
通常选服务器的端口作交换数据的地点，当然选客户端的端口也完全不影响。
比如我选的是服务器的端口，需要在server.bind() 里传入
```
("192.168.2.38",5016)
```
一旦一个使用bind绑定本机ip和端口了，另一个电脑只需要使用client.connect(),传入相同参数元组建立连接就可以了
```
("192.168.2.38",5016)
```
这时使用
```
netstat -anp | grep 5016
```
指令查看端口情况就可以看到一个ip在监听该ip下的这个端口，另一个ip的某个端口在和该端口建立了连接
```
tcp        0      0 192.168.2.38:5016       0.0.0.0:*               LISTEN      16062/python3       
tcp        0      0 192.168.2.38:5016       192.168.3.43:56202      ESTABLISHED 16062/python3       

```
上面结果的意思是：
0.0.0.0:\*，也就是本机在监听192.168.2.38:5016
192.168.3.43:56202和192.168.2.38:5016建立了连接
### 建立连接&发送接收信息
服务器和客户端的控制变量是通过
```
server = socket.socket()
或
client = socket.socket()
```
建立的。
服务器段使用server.listen()监听端口，使用conn,addr=server.accept()确认连接，使用data = conn.recv(1024)接收数据，使用conn.send()发送数据。

客户端少一条，在三次握手中它只主动发起一次请求。
客户端使用client.connect(())建立连接，使用client.recv(1024)接收数据，使用client.send()发送数据。
### 完整代码
```
import socket
server = socket.socket()
server.bind(("192.168.1.105",6969)) #绑定要监听的端口port
server.listen() # 监听
print('waiting the call')
conn,addr = server.accept() # 等电话打进来，并且返回连接对象，
print(conn)
print('the call has comming')
data = conn.recv(1024) #接收客户端的消息，这里是一个字符串
print('data:',data.decode()) # 将接受的数据进行解码
conn.send(data.upper()) # 将字符串变成大写后发生给客户端

```
```
import socket
client = socket.socket() # 有一些默认参数，即可使用ipv4，这一句是声明socket类型和返回socket连接对象
client.connect(("192.168.1.105",6969)) # 建立连接：传入服务器端IP号和要连接的应用程序的端口号
#client.send(b'Hello') # 这里只能发生字节流信息，否则报错
client.send('我是Hello'.encode(encoding='utf-8')) # 需要变成utf-8编码形式
data = client.recv(1024) #客户端可以接收服务器端的消息
print(data.decode())
client.close()
```

