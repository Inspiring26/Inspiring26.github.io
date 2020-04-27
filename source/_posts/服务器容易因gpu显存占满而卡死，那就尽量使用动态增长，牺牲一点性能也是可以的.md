---
title: 服务器容易因gpu显存占满而卡死，那就尽量使用动态增长，牺牲一点性能也是可以的
date: 2019-10-09 19:16:48
tags: [keras,深度学习]
---
动态增长代码：
```
import keras.backend.tensorflow_backend as KTF
import tensorflow as tf
config = tf.ConfigProto()
config.gpu_options.allow_growth=True  
sess = tf.Session(config=config)
KTF.set_session(sess)
```