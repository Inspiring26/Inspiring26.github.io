---
title: mac使用expect自动输入
date: 2021-01-28 17:41:42
tags: [Mac, 方法]
---
### 说明
以ssh登陆自动输入密码为例

###
```
#!/usr/bin/expect
spawn ssh -p 1*** pi@***.cn

expect "*password:*" { send "J***\r";interact }
```
password:前后星号是通配符，其后位置是隐藏了个人信息。
