<!--
author: jimmy
head:
date: 2017-12-23
title: atmoic
tags: java 多线程
images: 1.jpg
category: java
status: publish
summary: atmoic包原理
-->


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [atmoic包原理](#atmoic包原理)
		* [计数器](#计数器)
		* [compare and swap（CAS）](#compare-and-swapcas)
		* [Atmoic类](#atmoic类)

<!-- /code_chunk_output -->


# atmoic包原理
Atmoic是JUC专门为线程安全提供的java包，包含多个原子操作类。

其基本的特性就是在多线程环境下，当有多个线程同时执行这些类的实例包含的方法时，具有排他性，即当某个线程进入方法，执行其中的指令时，不会被其他线程打断，而别的线程就像自旋锁一样，一直等到该方法执行完成，才由JVM从等待队列中选择一个另一个线程进入，这只是一种逻辑上的理解。实际上是借助硬件的相关指令来实现的，不会阻塞线程(或者说只是在硬件级别上阻塞了)。

### 计数器
可以使用synchronized关键字,简单实现如下：
```
class Counter {  

    private int value;  

    public synchronized int getValue() {  
        return value;  
    }  

    public synchronized int increment() {  
        return ++value;  
    }  

    public synchronized int decrement() {  
        return --value;  
    }  
}
```

但synchronized关键字加锁，相对于计数器过于笨重，如果大量线程来竞争资源，那cpu需花费大量时间处理这些竞争。

### compare and swap（CAS）
每一个CAS操作过程都包含三个运算符：一个内存地址V，一个期望的值A和一个新值B，操作的时候如果这个地址上存放的值等于这个期望的值A，则将地址上的值赋为新值B，否则不做任何操作。CAS的基本思路就是，如果这个地址上的值和期望的值相等，则给其赋予新值，否则不做任何事儿，但是要返回原值是多少。
CAS是乐观锁技术，当多个线程同时更新同一个变量，其中只有一个线程能更新变量值，其他线程都失败，但失败线程不会被挂起，而是告知该次竞争失败，可再次尝试。

>#### 高并发情况优化锁
> 服务端性能杀手：1.大量线程切换；2.锁；3.非必要内存拷贝
>解决方式：1.用优化锁实现；2.Lock-free无锁结构。


### Atmoic类
Atmoic内部实现使用CAS+valitile和native方法，避免了synchronized的高开销
