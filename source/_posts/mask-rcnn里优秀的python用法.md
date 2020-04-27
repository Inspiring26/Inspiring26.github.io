---
title: mask rcnn里优秀的python用法
date: 2019-11-21 14:41:37
tags: [python,技巧]
---
### 获取绝对路径
```
os.path.abspath("../")
```
### 联合路径或文件
```
os.path.join(ROOT_DIR, "samples/coco/")
os.path.join(ROOT_DIR, "mask_rcnn_coco.h5")
```
### 如果不存在就下载或创建
```
if not os.path.exists(COCO_MODEL_PATH):
    utils.download_trained_weights(COCO_MODEL_PATH)
```
### 组织参数及调用 以及传参，用一部分也可以传整个，显得很简洁
```
class InferenceConfig(coco.CocoConfig):
    # Set batch size to 1 since we'll be running inference on
    # one image at a time. Batch size = GPU_COUNT * IMAGES_PER_GPU
    GPU_COUNT = 1
    IMAGES_PER_GPU = 1

config = InferenceConfig()
config.GPU_COUNT()


model = modellib.MaskRCNN(mode="inference", model_dir=MODEL_DIR, config=config)
```
### 列出文件夹里的所有文件和文件夹
```
next(os.walk(IMAGE_DIR))[2]
```
### 随机选取一个元素
```
random.choice(file_names)
```








老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)