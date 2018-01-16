<!--
author: jimmy
head:
date: 2018-01-15
title: gradle
tags: gradle java
images: blog/img/1.jpg
category: gradle
status: publish
summary: gradle学习记录
-->
## gradle学习记录

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [gradle学习记录](#gradle学习记录)
	* [1. 自定义Property](#1-自定义property)
		* [1.1 定义自定义Property](#11-定义自定义property)
		* [1.2 通过命令行参数定义Property](#12-通过命令行参数定义property)
		* [1.3 通过JVM参数定义Property](#13-通过jvm参数定义property)
		* [1.4 通过环境变量定义Property](#14-通过环境变量定义property)
	* [2. 管理依赖](#2-管理依赖)
	* [3. 构建多个project](#3-构建多个project)

<!-- /code_chunk_output -->

### 1. 自定义Property
gradle默认定义很多Property，常见的有：
+ project： project本身
+ name： project名字
+ path： project的绝对路径
+ description： project的描述信息
+ buildDir： project构建结果存放目录
+ version：project的版本号
#### 1.1 定义自定义Property
在build.gradle中添加额外property，需通过ext来定义。
添加一个名为property1的Property，如下所示：
```
ext.property1 = "this is property1"
```
也可使用闭包方式：
```
ext {
   property2 = "this is property2"
}
```

#### 1.2 通过命令行参数定义Property
通过-P参数传入
```
gradle -Pproperty3="this is property3" showCommandLieProperties
```
#### 1.3 通过JVM参数定义Property
我们知道，在java中，我们可以通过-D参数定义JVM的系统参数，然后在代码中可以可以通过System.getProperty()进行获取。
在Gradle中，我们也可以通过-D的方式向Project传入Property，只是此时我们需要遵循一些约定：每一个通过-D方式声明的Property都需要以"org.gradle.project"为前缀，对于上面的showCommandLieProperties，我们也可以通过以下方式设置property3

```
gradle -Dorg.gradle.project.property3="this is another property3" showCommandLieProperties
```
#### 1.4 通过环境变量定义Property
### 2. 管理依赖
声明第三方依赖，在build.gradle中配置如下：
```
repositories {
   mavenCentral()
}
```
java Plugin会自动定义compile和testCompile，分别用于编译Java源文件和编译Java测试源文件。
添加依赖，如下配置即可：
```
dependencies {
   compile 'org.slf4j:slf4j-log4j12:1.7.2'
   testCompile 'junit:junit:4.8.2'
}
```

### 3. 构建多个project
需要在项目根目录添加build.gradle，还要将子项目添加到setting.gradle中，如下所示：
```
include 'sub-project1', 'sub-project2'
```
在Gradle中，我们可以通过根Project的allprojects()方法将配置一次性地应用于所有的Project，当然也包括定义Task。比如，在root-project的build.gradle中，
```

allprojects {
   apply plugin: 'idea'


   task allTask << {
      println project.name
   }
}
```
多个子项目之间的依赖是基于task,而不是整个项目
