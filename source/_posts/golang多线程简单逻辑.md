---
title: golang多线程简单逻辑
date: 2021-01-13 16:58:11
tags: [golang, 总结]
---
### 目标
实现指定个核心最大化使用，比如核心总数减一。

### 代码
```
package main
import (
    "runtime"
    "sync"
)
var (
    cpunum = runtime.NumCPU()-1
)
func main(){
    ch := make(chan string)
    runtime.GOMAXPROCS(cpunum)
    wg := sync.WaitGroup{}

    for i := 0; i < cpunum; i++{
        go WgReadLogs(ch, &wg)
    }

    wg.Add(2)
    ch <- "./health/stat1.rec"
    ch <- "./report/stat2.rec"
    wg.Wait()
    close(ch)
}
func WgReadLogs(ch chan string,wg *sync.WaitGroup){
    for true{
	tmp,ok := <-ch
	if !ok{
	    break
	}
	ReadLogs(tmp)
	wg.Done()
    }
}
func ReadLogs(logname string){
    fmt.Println(logname)
}
```
### 解释
```
import (
    "runtime"
    "sync"
)
```
必要的库


```
var (
    cpunum = runtime.NumCPU()-1
)
```
要使用的cpu数量，建议不全使用


```
    ch := make(chan string)
    runtime.GOMAXPROCS(cpunum)
    wg := sync.WaitGroup{}

```
建立管道
声明使用的cpu数
建立互斥关系，本例中主要为了实现所有线程执行完后再执行后续程序

```
    for i := 0; i < cpunum; i++{
        go WgReadLogs(ch, &wg)
    }
```
创建cpu数减1个线程

```
    wg.Add(2)
    ch <- "./health/stat1.rec"
    ch <- "./report/stat2.rec"
    wg.Wait()
    close(ch)

```
后面每个任务结束时要done一个wg，这里根据具体情况加，是循环就在每个循环里加，保证后面能全部done即可
没有缓冲的、阻塞式的往管道传递字符串
Wait是等所有线程都执行完，即增加的数字被全done掉
关闭管道

```
func WgReadLogs(ch chan string,wg *sync.WaitGroup){
    for true{
        tmp,ok := <-ch
        if !ok{
            break
        }
        ReadLogs(tmp)
        wg.Done()
    }
}
```
假设已有的函数是ReadLogs，在它的基础上加个Wg加函数名的新函数，我觉得这种方式不改变原有的，比较舒服。
大意是：循环从管道读取字符串，读不到了就跳出循环。
每个ReadLogs()之后加一个wg.Done()，相当于计数减一。

ReadLogs()就是要执行的任务，不再解释。

### 总结
就是开指定个线程
管道阻塞传值
wg同步
WgReadLogs循环接收
