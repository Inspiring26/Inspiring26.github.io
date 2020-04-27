---
title: shell编程注意事项
date: 2020-03-20 09:24:35
tags: [shell, 注意事项]
---
定义变量时，变量名不加美元符号；
变量名和等号间不能有空格；
除了自己赋值，还可以用语句，如：for file in \`ls /etc\`;

使用变量需加美元符，有两种： 
``` 
$file  ${file}
```

后者方便和其他字符串拼接；
变量可以被重新定义或者说赋值，依然不加美元号；

以#开头的行是注释，被忽略；
shell里没有多行注释符；
对于代码块，可以用花括号括起来定义成函数，不调用时达到注释代码块效果；

只有两种数据类型，数字、字符串；
字符串可以单引号、双引号、不引号,单引号内不能有变量、单引号的转义，双引号可以有变量、双引号的转义；

字符串拼接， 
```
 $file 
 ```
直接在空间上拼接，
```
${file}
```
可以在双引号内拼接；

获取字符串长度： 
```
${#file} 
```

提取子字符串： 
```
${#file:1:4}
```
下标从0开始计算，就是第1个到第4个，不是第1个到第三个；

linux里的[是可执行程序，位置在
```
/usr/bin/[
```
所以前后必须有空格；


if else:
写成一行，有值的都算True
```
if ps -ef | grep ssh;then echo hello;fi
```
写成脚本
```
if ps -ef | grep ssh
then
    echo hello
fi
```
其他情况：
```
if ps -ef | grep ssh
then
    echo hello
else
    echo world #else后是不能为空的
fi


if ps -ef | grep ssh
then
    echo hello
elif ps -ef | grep auto
    echo world #else后是不能为空的
else
    echo great
fi

```

for while:
```
for var in item1 item2 ... itemn
do
    command
done
```
写成一行：
```
for var in item1 item2 ... itemN; do command1; command2… ;done#命令间要用分号分开，done在最后一个命令之后单起一句，其后加不加分号都可以
```
也可以传统for风格
```
for (( var=1;var<5 ;var++))
do
    echo $var
done

#单行
for (( var=1;var<5;var++));do echo $var;done
```

while:
```
while condition
do
    command
done
```
无限循环：
```
while :
do
    command
done

或者

while true
do
    command
done

或者
for (( ; ;))
do
    command
done
```

一个类似与while的until
```
util condition
do
    command
done
```

还有一直case语法了解一下
```
case "${opt}" in
	"Install-Puppet-Server" )
		install_master $1
		exit
	;;

	"Install-Puppet-Client" )
		install_client $1
		exit
	;;

	"Config-Puppet-Server" )
		config_puppet_master
		exit
	;;

	"Config-Puppet-Client" )
		config_puppet_client
		exit
	;;

	"Exit" )
		exit
	;;

	* ) echo "Bad option, please choose again"
esac
```


在bash里source和.是等效的，他们都是读入并执行指定文件
```
source ./function.sh
. ./function.sh
```

顺便提一下获取文件绝对路径的方法
```
>>>readlink -f test.sh
/home/h2/test.sh
```
有这样的综合使用分析：
readlink -f test.sh 是一个可执行shell语句，效果是获取test.sh的绝对路径
要把执行完语句的结果传给变量的话，需要用\`\`将语句括起来，
```
>>>testpath=\`readlink -f test.sh\`
此时$testpath 的值就是路径字符串，
直接运行$testpath 是运行该文件，可能会有权限问题，
>>>. $testpath 
>>>source $testpath 
都是执行那个脚本

>>>echo $testpath 
是打印出路径地址
```







老博客地址：[https://www.jianshu.com/u/1c73a3a8ae2d](https://www.jianshu.com/u/1c73a3a8ae2d)
新博客地址：[https://inspiring26.github.io/](https://inspiring26.github.io/)





