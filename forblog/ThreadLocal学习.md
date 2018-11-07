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

#### 2.2 get函数
```
public T get() {
        //第一句是取得当前线程
        Thread t = Thread.currentThread();
        //获取线程内部的ThreadLocalMap
        ThreadLocalMap map = getMap(t);
        if (map != null) {
            //以当前ThreadLocal实例作为key，在map中获取对应的Entry
            ThreadLocalMap.Entry e = map.getEntry(this);
            if (e != null) {
                @SuppressWarnings("unchecked")
                T result = (T)e.value;
                return result;
            }
        }
        //如果map之前未被创建，或创建后未得到该ThreadLocal实例的Entry
        //则调用此方法进行初始化，而后返回结果
        return setInitialValue();
    }
```

#### 2.3 remove
```
public class ThreadLocal<T> {
    // ...
    public void remove() {
        ThreadLocalMap m = getMap(Thread.currentThread());
        if (m != null)
            // 调用ThreadLocalMap的remove方法
            m.remove(this);
    }
    // ...
    static class ThreadLocalMap {
        // ...
        private void remove(ThreadLocal<?> key) {
            Entry[] tab = table;
            int len = tab.length;
            // 按hashcode计算出应该在的位置
            int i = key.threadLocalHashCode & (len - 1);
            // 考虑到hash冲突，按线性探测查找应该在的位置
            for (Entry e = tab[i];
                 e != null;
                 e = tab[i = nextIndex(i, len)]) {
                // 判断是否是目标Entry
                if (e.get() == key) {
                    // 调用Reference中的clear()方法，Clears this reference object.
                    e.clear();
                    // 将该位置的Entry清除掉后，对table重新整理
                    expungeStaleEntry(i);
                    return;
                }
            }
        }
        private int expungeStaleEntry(int staleSlot) {
            Entry[] tab = table;
            int len = tab.length;
            // expunge entry at staleSlot
            // 先将value引用置空
            tab[staleSlot].value = null;
            tab[staleSlot] = null;
            size--;
            // Rehash until we encounter null
            // 因为后续连续的元素可能是之前hash冲突引起的，
            // 所以，对table后续连续的元素，进行重新hash
            Entry e;
            int i;
            for (i = nextIndex(staleSlot, len);
                 (e = tab[i]) != null;
                 i = nextIndex(i, len)) {
                ThreadLocal<?> k = e.get();
                // 如果key为空，顺便清除它
                if (k == null) {
                    e.value = null;
                    tab[i] = null;
                    size--;
                } else {
                    int h = k.threadLocalHashCode & (len - 1);
                    // 如果一个元素按照hashcode运算后，
                    // 实际位置不在应该在的位置，则对其重新hash
                    if (h != i) {
                        tab[i] = null;
                        // Unlike Knuth 6.4 Algorithm R, we must scan until
                        // null because multiple entries could have been stale.
                        while (tab[h] != null)
                            h = nextIndex(h, len);
                        tab[h] = e;
                    }
                }
            }
            return i;
        }
    }
}
```

### 2.4 Entry

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
Entry继承自WeakReference（弱引用，生命周期只能存活到下次GC前），但只有Key是弱引用类型的，Value并非弱引用。

由于ThreadLocalMap的key是弱引用，而Value是强引用。这就导致了一个问题，ThreadLocal在没有外部对象强引用时，发生GC时弱引用Key会被回收，而Value不会回收，如果创建ThreadLocal的线程一直持续运行，那么这个Entry对象中的value就有可能一直得不到回收，发生内存泄露。所以在使用ThreadLocal时，在使用结束后需要remove。
