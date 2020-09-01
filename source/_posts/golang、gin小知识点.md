---
title: golang、gin小知识点
date: 2020-09-01 13:43:13
tags: [golang, 方法]
---
### gin中常见的gin.H
实际就是map[string]interface{}
所以给网页传递变量的
```
router.GET("/index", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.tmpl", gin.H{
			"title": "Main website",
		})
	})
```
就可以替换为
```
router.GET("/rec", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.tmpl", province_text_dict)
	})
```

### 接着上面讲如何讲interface{}转换为具体类型
假设value为interface{}类型
value.(type)可查看其类型
如果是string类型，
value.(string)即可转换类型为string。
前提是要准确知道类型。
