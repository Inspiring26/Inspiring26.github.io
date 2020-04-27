---
title: 百度收录githubpages上hexo文章
date: 2019-10-14 15:10:10
tags: [GitHub Pages]
---
在根目录安装
```
npm install hexo-baidu-url-submit --save
```
在根目录的配置文件中添加
```
baidu_url_submit:
  count: 1000 ## 可以写一个很大的数
  host: https://inspiring26.github.io ## 在百度站长平台中注册的域名
  token: your_token ## 请注意这是您的秘钥， 所以请不要把博客源代码发布在公众仓库里!
  path: baidu_urls.txt ## 文本文档的地址， 新链接会保存在此文本文档里
```

然后部署就可以了，可以在public文件夹看到生成的 
```
baidu_urls.txt
```


### 更新

上面方法依然不行，可能是没用到
```
type: baidu_url_submitter
```


最终解决办法：
deploy.sh最后添加

```
curl -H 'Content-Type:text/plain' --data-binary @public/baidu_urls.txt "http://data.zz.baidu.com/urls?site=inspiring26.github.io&token=<你的tocken>"
```
这个代码在
[https://ziyuan.baidu.com/linksubmit/index](https://ziyuan.baidu.com/linksubmit/index)
的主动推送下。
只要修改baidu_urls的路径就好了。
返回结果：

```
{"remain":9966,"success":34}
```