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
		* [IoC类型](#ioc类型)
		* [代码实现](#代码实现)

<!-- /code_chunk_output -->
IoC对编程带来的最大改变不是从代码上，而是从思想上，发生了“主从换位”的变化。应用程序原本是老大，要获取什么资源都是主动出击，但是在IoC/DI思想中，应用程序就变成被动的了，被动的等待IoC容器来创建并注入它所需要的资源了。
### IoC和DI
IoC(控制反转:Inverse of Control) 是Spring容器内核,所谓IoC，对于spring框架来说，就是由spring来负责控制对象的生命周期和对象间的关系。

DI(依赖注入:Dependency Injection),组件之间依赖关系由容器在运行期决定，形象的说，即由容器动态的将某个依赖关系注入到组件之中。依赖注入的目的并非为软件系统带来更多功能，而是为了提升组件重用的频率，并为系统搭建一个灵活、可扩展的平台。

### IoC类型
1. 接口注入：组件需要依赖特定接口的实现，其中的加载接口实现和接口实现的具体对象都是由容器来完成。这样，接口必须依赖容器，这样的组件具有侵入性，降低了重用性。其中如J2EE开发中常用的Context.lookup（ServletContext.getXXX），都是接口注入的表现形式。（这种注入方式不是常用的）
2. getter/setter方式注入：对于需要注入的东西比较明确。
3. 构造器方式注入：在类加载的时候，就已经注入依赖的组件。但是若是参数多的话，使用起来不方便。

但是后两种注入方式是spring常用的，而第一种接口注入方式Spring不使用。

### 代码实现
```
public interface Hero {
    void word();
}


public class Ezreal implements Hero {
    @Override public void word() {
        System.out.println("是时候表演真正的技术了");
    }
}


public class ChooseHero {
    private Hero hero;

    public ChooseHero() {
    }

    //构造函数注入
    public ChooseHero(Hero hero) {
        this.hero = hero;
    }

    public Hero getHero() {
        return hero;
    }

    //属性注入
    public void setHero(Hero hero) {
        this.hero = hero;
    }

    public void saidSomeThing() {
        this.hero.word();
    }
}


public class Player {
    /**
     * 通过构造函数注入
     */
    public void directConstructor() {
        Hero ez = new Ezreal();
        ChooseHero chooseHero = new ChooseHero(ez);
        chooseHero.saidSomeThing();
    }

    /**
     * 通过setter方法注入
     */
    public void directSetter() {
        Hero ez = new Ezreal();
        ChooseHero chooseHero = new ChooseHero();
        chooseHero.setHero(ez);
        chooseHero.saidSomeThing();
    }

    public static void main(String[] args) {
        new Player().directConstructor();
        new Player().directSetter();
    }
}
```
