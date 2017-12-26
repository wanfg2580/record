<!--
author: jimmy
head:
date: 2017-12-24
title: ThreadLocal学习
tags: ThreadLocal java
images: blog/img/3.jpg
category: java
status: publish
summary: ThreadLocal
-->
# TheardLocal学习

ThreadLocal为解决多线程并发提供一种新的解决思路，当使用ThreadLocal维护变量时，其为每个使用该变量的线程提供独立的变量副本，不同线程操作各自变量，互不影响。

## 1. ThreadLocal 基础
对于多线程资源共享的问题，同步机制采用了“以时间换空间”的方式：访问串行化，对象共享化。而ThreadLocal采用了“以空间换时间”的方式：访问并行化，对象独享化。前者仅提供一份变量，让不同的线程排队访问，而后者为每一个线程都提供了一份变量，因此可以同时访问而互不影响。
ThreadLocal实现主要为以下几个类：
+ ThreadLocalMap
> 可以看做一个HashMap，但其实与HashMap无关，只是其内部实现与HashMap类似，通过哈希表存储。

+ ThreadLocalMap.Entry
> 保存键值对的对象，其本质是WeakReference<ThreadLocal>对象。

其具体解析如下，本文源码基于JDK1.8。
### 2. ThreadLocal数据存取
ThreaLocal先调用构造函数创建ThreadLocal对象，再使用get、set方法
#### 2.1 set函数
```
public void set(T value) {
    Thread t = Thread.currentThread();
    ThreadLocalMap map = getMap(t);
    if (map != null)
        map.set(this, value);
    else
        createMap(t, value);
}
```

```
static class Entry extends WeakReference<ThreadLocal<?>> {
  /** The value associated with this ThreadLocal. */
  Object value;
  Entry(ThreadLocal<?> k, Object v) {
    super(k);
    value = v;
  }
}
```

#### 2.2 get函数
