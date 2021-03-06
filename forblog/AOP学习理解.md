<!--
author: jimmy
head:
date: 2016-09-10
title: AOP学习理解
tags: Spring AOP
images: blog/img/3.jpg
category: Spring
status: publish
summary: AOP--面向切面编程
-->
# AOP学习理解

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [AOP学习理解](#aop学习理解)
		* [AOP相关术语](#aop相关术语)

<!-- /code_chunk_output -->

AOP(Aspect Oriented Programming),面向切面编程是动态地将代码切入到类的指定方法、 指定位置上的编程思想就是面向切面的编程。
切入到指定类指定方法的代码片段称为切面，而切入到哪些类、哪些方法则叫切入点。有了AOP，我们就可以把几个类共有的代码，抽取到一个切片中，等到需要时再切入对象中去，从而改变其原有的行为。

### AOP相关术语
1. 通知(Advice):
通知定义了切面是什么以及何时使用。描述了切面要完成的工作和何时需要执行这个工作。
2. 连接点(Joinpoint):
程序能够应用通知的一个“时机”，这些“时机”就是连接点，例如方法被调用时、异常被抛出时等等。
3. 切入点(Pointcut)
通知定义了切面要发生的“故事”和时间，那么切入点就定义了“故事”发生的地点，例如某个类或方法的名称，Spring中允许我们方便的用正则表达式来指定
4. 切面(Aspect)
通知和切入点共同组成了切面：时间、地点和要发生的“故事”
5. 引入(Introduction)
引入允许我们向现有的类添加新的方法和属性(Spring提供了一个方法注入的功能）
6. 目标(Target)
即被通知的对象，如果没有AOP,那么它的逻辑将要交叉别的事务逻辑，有了AOP之后它可以只关注自己要做的事（AOP让他做爱做的事）
7. 代理(proxy)
应用通知的对象，详细内容参见设计模式里面的代理模式
8. 织入(Weaving) 
把切面应用到目标对象来创建新的代理对象的过程，织入一般发生在如下几个时机:
(1)编译时：当一个类文件被编译时进行织入，这需要特殊的编译器才可以做的到，例如AspectJ的织入编译器
(2)类加载时：使用特殊的ClassLoader在目标类被加载到程序之前增强类的字节代码
(3)运行时：切面在运行的某个时刻被织入,SpringAOP就是以这种方式织入切面的，原理应该是使用了JDK的动态代理技术
