---
title: python的glob模块
date: 2019-10-21 15:50:07
tags: [python]
---
python自带的glob模块可以获取指定文件夹的文件，可以使用简单的通配符去匹配。
返回的结果只包含文件名的列表，不包含文件夹。
```
>>> import glob
>>> pics = glob.glob("*.jpg")
>>> pics[:2]
['6300509598986346813_n.jpg', '120A2FD38AAC66414265A657BCFDA175.jpg']
>>> len(pics)
15
```
如此一来，用python处理文件夹内的文件就非常方便了。

支持通配符操作，\*,?,[]这三个通配符，代表0个或多个字符，?代表一个字符，[]匹配指定范围内的字符，如[0-9]匹配数字。

此外，调用glob.iglob可以返回一个迭代器。
```
f = glob.iglob()
```
使用通配符的一个示例：
```
>>> import glob
>>> glob.glob('./[0-9].*')
['./1.gif', './2.txt']
>>> glob.glob('*.gif')
['1.gif', 'card.gif']
>>> glob.glob('?.gif')
['1.gif']
```
