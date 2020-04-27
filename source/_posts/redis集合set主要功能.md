---
title: redis集合set主要功能
date: 2019-10-24 11:45:32
tags: [redis]
---
### SADD
时间复杂度O(1)
往set里添加元素，已有则忽略。
### SCARD
查看指定key下的元素个数，这个比较常用
### SDIFF
```
SDIFF key1 key2
```
找出第一个key中不在第二个key里的元素
### SDIFFSTORE
```
SDIFFSTORE key key1 key2
```
将第一个key中不在第二个key的元素保存到新key下
### SINTER
```
SINTER key1 key2
```
找出两个key中共同的元素
### SINTERSTORE
```
SINTERSTORE key key1 key2
```
同理，保存这个共同的元素到新key
### SISMEMBER
字面意思 is member
查看是否在某个key里
```
SISMEMBER myset "one"
```
### SMEMBERS
查看key下的所以元素，元素不多时常用，如果是遍历这不是个好方法，用迭代的方法更好。
### SMOVE
将指定元素从一个key移动到另一个key
### SPOP
从set里随机的移除元素，注意是*随机的*
### SRANDMEMBER
从set里随机的获取一个或多个元素
### SREM
从set中移除指定元素，这个通常也是常用的
### SUNION
可以理解为合并两个set
### SUNIONSTORE
合并两个set并保存在新key下

