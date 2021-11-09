---
title: macbook下conda创建nodejs虚拟环境
date: 2021-11-09 11:01:18
tags: [mac, 方法, 记录]
---
### 搜索nodejs及查看版本
```
conda search nodejs
```

### 创建虚拟环境
```
# 可以用等号指定版本
conda create -n mynode nodejs
```

### 激活环境
```
conda activate mynode
```

### 安装hexo
```
npm install -g hexo-cli
hexo
```
hexo运行出错后，根据提示
```
rm -rf node_modules && npm install --force
hexo
hexo s
```
hexo s正常运行即可

### 退出虚拟环境、查看虚拟环境列表、
```
conda deactivate
conda info --envs
# 或 conda info -e
conda remove -n 虚拟环境名  --all
```

