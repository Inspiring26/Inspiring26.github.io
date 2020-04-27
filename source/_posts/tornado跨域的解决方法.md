---
title: tornado跨域的解决方法
date: 2019-10-29 17:04:36
tags: [tornado]
---
tornado h5跨域会报一种XMLHttpRequest错误，错误代码405。
即使在tornado里设置了跨域，依然报错，这是因为h5跨域请求时要先发一个options请求，需要在Handler里处理一下options请求，具体代码如下：
```
class BaseHandler(tornado.web.RequestHandler):
    def set_default_headers(self):
        self.set_header('Access-Control-Allow-Origin', '*')
        self.set_header('Access-Control-Allow-Headers', '*')
        self.set_header('Access-Control-Max-Age', 1000)
        self.set_header("Content-Type", "application/json; charset=UTF-8")
        self.set_header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
        self.set_header('Access-Control-Allow-Headers',
                        'authorization, Authorization, Content-Type, Access-Control-Allow-Origin, Access-Control-Allow-Headers, X-Requested-By, Access-Control-Allow-Methods')

class MainHandler(BaseHandler):
    
    async def post(self):
        # 接收到图片的base64字符串
        jsonbyte = self.request.body.decode('utf8')
        jsondict = json.loads(jsonbyte)
        picdata = re.sub('^data:image/.+;base64,', '', jsondict["pic"]+"==")
        r.sadd("palm",picdata)
        # 将图片转换成PIL读取的图片矩阵
        binary_data = base64.b64decode(picdata)
        img_data = BytesIO(binary_data)
        imgtmp = Image.open(img_data).convert("RGB")
        res = await predictHandler(imgtmp)     
        self.finish(res)#finish方法也是调用的write方法

    async def options(self):
        self.finish()
```
options方式请求只要通了就行，options请求之后就是正常的post请求了。
