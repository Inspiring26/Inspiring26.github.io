---
title: 读源码torch.nn.Module
date: 2019-11-15 10:04:41
tags: [读源码]
---

### def __init__(self):

定义了很多有序字典OrderedDict()
在创建网络时，我们要实现该方法，通过spuer方法将init里的表达式继承下来。
从python类的用法上讲，也可以采用baseClass.\_\_init\_\_()的方式，但是通常不这么用，这里每验证这么用会不会出问题，只是温习一下python的使用方法。

###  def forward(self, \*input):
这个方法要被重写，上面的init方法叫实现。
该方法传入输入。
```
def forward(self, *input):
    raise NotImplementedError
```
采用这种方式达到不重写就会报对应的错。方法很好。

### def register_buffer(self, name, tensor):
向模块添加持久缓冲区。
```
def register_buffer(self, name, tensor):
	if '_buffers' not in self.__dict__:
	        raise AttributeError(
	            "cannot assign buffer before Module.__init__() call")
	    elif not isinstance(name, torch._six.string_classes):
	        raise TypeError("buffer name should be a string. "
	                        "Got {}".format(torch.typename(name)))
	    elif '.' in name:
	        raise KeyError("buffer name can't contain \".\"")
	    elif name == '':
	        raise KeyError("buffer name can't be empty string \"\"")
	    elif hasattr(self, name) and name not in self._buffers:
	        raise KeyError("attribute '{}' already exists".format(name))
	    elif tensor is not None and not isinstance(tensor, torch.Tensor):
	        raise TypeError("cannot assign '{}' object to buffer '{}' "
	                        "(torch Tensor or None required)"
	                        .format(torch.typename(tensor), name))
	    else:
	        self._buffers[name] = tensor
```
如果参数name类型不对会报相应的错。

### def register_parameter(self, name, param):
向模块添加参数。
同样会做一些格式和存在与否的判断，进而报错，这是我应该学习的方式。两个参数分了三步去判断。

### def add_module(self, name, module):
给当前模块添加一个子模块。
同时做一些isinstance hasattr ==  的判断raise一些TypeError KeyError

### def \_apply(self, fn):
这是后续方法要经常调用的方法
pytorch的更新参数最底层的方法都是这个方法和def apply(self, fn)定义的。

### def apply(self, fn):

### def cuda(self, device=None):
将所有模型参数和缓冲区移至GPU。
```
def cuda(self, device=None):
    return self._apply(lambda t: t.cuda(device))
```
### def cpu(self):
将所有模型参数和缓冲区移至CPU。
```
def cpu(self):
    return self._apply(lambda t: t.cpu())
```
### def type(self, dst_type):
将所有参数和缓冲区强制转换为dst_type。
```
def type(self, dst_type):
    return self._apply(lambda t: t.type(dst_type))
```

### def float(self):
将所有浮点参数和缓冲区强制转换为float数据类型。
```
def float(self):
    return self._apply(lambda t: t.float() if t.is_floating_point() else t)
```
### def double(self):
将所有浮点参数和缓冲区强制转换为“ double”数据类型。

### def half(self):
将所有浮点参数和缓冲区强制转换为“ half”数据类型。
Half是用16位表示浮点数的一种数据类型，在IEEE 754中也有规定，这种数据类型在深度学习系统中的应用比较广泛。但是在当前主流cpu上，不支持half类型数据的计算和输出，所以需要half和float两个数据类型之间的转换。
IEEE754-2008包含一种“半精度”格式，只有16位宽。故它又被称之为binary16，这种类型的浮点数只适合用于存储那些对精度要求不高的数字，不适合用于进行计算。与单精度浮点数相比，它的优点是只需要一半的存储空间和带宽，但是缺点是精度较低。

### def to(self, \*args, \*\*kwargs):
移动或强制转换参数和缓冲区。
```
Example::
            >>> linear = nn.Linear(2, 2)
            >>> linear.weight
            Parameter containing:
            tensor([[ 0.1913, -0.3420],
                    [-0.5113, -0.2325]])
            >>> linear.to(torch.double)
            Linear(in_features=2, out_features=2, bias=True)
            >>> linear.weight
            Parameter containing:
            tensor([[ 0.1913, -0.3420],
                    [-0.5113, -0.2325]], dtype=torch.float64)
            >>> gpu1 = torch.device("cuda:1")
            >>> linear.to(gpu1, dtype=torch.half, non_blocking=True)
            Linear(in_features=2, out_features=2, bias=True)
            >>> linear.weight
            Parameter containing:
            tensor([[ 0.1914, -0.3420],
                    [-0.5112, -0.2324]], dtype=torch.float16, device='cuda:1')
            >>> cpu = torch.device("cpu")
            >>> linear.to(cpu)
            Linear(in_features=2, out_features=2, bias=True)
            >>> linear.weight
            Parameter containing:
            tensor([[ 0.1914, -0.3420],
                    [-0.5112, -0.2324]], dtype=torch.float16)

```
### def register_backward_hook(self, hook):
在模块上注册反向挂钩。
每当计算相对于模块输入的梯度时，都会调用该挂钩。
### def register_forward_pre_hook(self, hook):
在模块上注册前向预钩。
每次调用：func：`forward`之前，都会调用该钩子。
### def register_forward_hook(self, hook):
在模块上注册一个前向挂钩。
每当：func：`forward`计算出输出后，该钩子就会被调用。

### def \_slow_forward(self, \*input, \*\*kwargs):
没有加速的前向函数.

### def \__call__(self, \*input, \*\*kwargs):
给个参数就执行的前向调用?

### def \__setstate__(self, state):
快速设置所有字典状态

### def \__getattr__(self, name):
获取属性
### def \__setattr__(self, name, value):
设置属性
### def \__delattr__(self, name):
删除属性
### def \_register_state_dict_hook(self, hook):
这个钩子可以就地修改“ state_dict”或返回一个新的。
### def\_save_to_state_dict(self, destination, prefix, keep_vars):
将模块状态保存到“destination”字典中，其中包含模块的状态，但不包含其后代。
### def state_dict(self, destination=None, prefix='', keep_vars=False):
返回包含模块整个状态的字典。
### def \_register_load_state_dict_pre_hook(self, hook):
这些钩子将被以下参数进行调用：state_dict，prefix，local_metadata，strict，strict，missing_keys，unexpected_keys，
   error_msgs，在将state_dict加载到self之前。 这些参数与_load_from_state_dict的参数完全相同。
### def \_load_from_state_dict(self, state_dict, prefix, local_metadata, strict, missing_keys, unexpected_keys, error_msgs):
从:attr:'state_dict'复制参数和缓冲区。
### def load_state_dict(self, state_dict, strict=True):
将参数和缓冲区从state_dict复制到此模块及其后代中。
### def \_named_members(self, get_members_fn, prefix='', recurse=True):
产生各种名称+模块成员的辅助方法。
### def parameters(self, recurse=True):
返回模块参数上的迭代器。
### def named_parameters(self, prefix='', recurse=True):
返回包含模块参数的迭代器，yield返回参数名称和参数本身。
### def buffers(self, recurse=True):
返回模块缓冲的迭代器。
### def named_buffers(self, prefix='', recurse=True):
返回模块缓冲的迭代器，包括缓冲的名字和缓冲本身。
### def children(self):
返回直接子模块构成的迭代器。
```
def children(self):
    for name, module in self.named_children():
        yield module
```
### def named_children(self):
返回直接子模块的迭代器，同时yield返回模块的名称和模块本身。
### def modules(self):
返回网络中所有模块的迭代器。
### def named_modules(self, memo=None, prefix=''):
同时返回名字

### def train(self, mode=True):
常用的，如model.train()
作用是使模块处于训练状态。
mode=True  training mode
mode=True  evaluation mode
代码很简单
```
def train(self, mode=True):
    self.training = mode #使self.training=True
    for module in self.children(): 把children以及children的children也设置为True，所以这里使用的是调用自己，进而构成循环
        module.train(mode)
    return self
```
return self是一种链式调用。
```
class Foo(object):

  def __init__(self):
    self.myattr = 0

  def bar(self):
    self.myattr += 1
    return self

f = Foo()
f.bar().bar().bar()
print(f.myattr)
输出结果为3.
把bar()方法改为返回return None， 则上述代码会出错。
```
### def eval(self):
```
def eval(self):
    return self.train(False)
```
### def requires_grad_(self, requires_grad=True):
这个也是很重要很常用的函数
Change if autograd should record operations
on parameters in this module.
控制自动求导是否记录求导结果，它是单个模块控制的。
```
def requires_grad_(self, requires_grad=True):

    for p in self.parameters():
        p.requires_grad_(requires_grad) #也是递归的调用，也是return self
    return self
```

### def zero_grad(self):
将所有模型参数的梯度设置为零。
```
def zero_grad(self):
    r"""Sets gradients of all model parameters to zero."""
    for p in self.parameters():#遍历所以参数
        if p.grad is not None:#如果存在
            p.grad.detach_()
            p.grad.zero_()#使用其他函数设置为0

```
此外，
```
def parameters(self, recurse=True):
    for name, param in self.named_parameters(recurse=recurse):
        yield param
```
所以self.parameters()是parameters方法产生的一个递归。
最终用到的数据来自module.\_parameters.items()
### def share_memory(self):
好像是共享内存
### def \_get_name(self):
```
def _get_name(self):
    return self.__class__.__name__
```
返回本类的名字
### def extra_repr(self):
设置模块的额外表示形式
```
def extra_repr(self):
    return ''
```
默认为空字符串，需要重写该方法以达到额外命名
### def __repr__(self):
一个表示形式，用到上面的额外命名，分有没有额外名情况去组织结果。
### def __dir__(self):













老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)