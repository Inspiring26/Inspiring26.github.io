---
title: train_test_split的变更
date: 2019-10-11 14:25:01
tags: [sklearn]
---
sklearn的划分数据集工具train_test_split，由sklearn.cross_validation.train_test_split变更为sklearn.model_selection.train_test_split
```
trainset, testset = train_test_split(img_data, test_size = 0.2)
```
或
```
X_train,X_test, y_train, y_test =train_test_split(train_data,train_target,test_size=0.2, random_state=0)
```

train_data：去除label的数据集！！！！
train_target：label集合！！！！
test_size：样本占比，如果是整数的话就是样本的数量
random_state：是随机数的种子。
随机数种子：其实就是该组随机数的编号，在需要重复试验的时候，保证得到一组一样的随机数。比如你每次都填1，其他参数一样的情况下你得到的随机数组是一样的。但填0或不填，每次都会不一样。