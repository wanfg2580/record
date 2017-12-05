<!--
author: jimmy
head:
date: 2016-09-10
title: IoC学习理解
tags: Spring IoC
images: blog/img/2.jpg
category: Spring
status: publish
summary: IoC学习理解
-->
# IoC学习理解

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [IoC学习理解](#ioc学习理解)
		* [IoC和DI](#ioc和di)

<!-- /code_chunk_output -->

### IoC和DI
IoC(控制反转:Inverse of Control) 是Spring容器内核,所谓IoC，对于spring框架来说，就是由spring来负责控制对象的生命周期和对象间的关系。

DI(依赖注入:Dependency Injection),组件之间依赖关系由容器在运行期决定，形象的说，即由容器动态的将某个依赖关系注入到组件之中。依赖注入的目的并非为软件系统带来更多功能，而是为了提升组件重用的频率，并为系统搭建一个灵活、可扩展的平台。
