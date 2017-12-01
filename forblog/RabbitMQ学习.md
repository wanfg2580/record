<!--
author: jimmy
head:
date: 2017-12-01
title: RabbitMQ学习
tags: RabbotMQ 队列
images: http://pingodata.qiniudn.com/cube2.jpg
category: 队列
status: publish
summary: RabbitMQ学习
-->

# RabbitMQ学习

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [RabbitMQ学习](#rabbitmq学习)
	* [Message Broker与AMQP简介](#message-broker与amqp简介)
	* [RabbitMQ](#rabbitmq)
		* [安装](#安装)
		* [管理](#管理)
	* [Spring Boot中使用RabbitMQ](#spring-boot中使用rabbitmq)

<!-- /code_chunk_output -->

## Message Broker与AMQP简介

Message Broker是一种消息验证、传输、路由的架构模式，其设计目标主要应用于下面这些场景：

消息路由到一个或多个目的地
消息转化为其他的表现方式
执行消息的聚集、消息的分解，并将结果发送到他们的目的地，然后重新组合相应返回给消息用户
调用Web服务来检索数据
响应事件或错误
使用发布-订阅模式来提供内容或基于主题的消息路由
AMQP是Advanced Message Queuing Protocol的简称，它是一个面向消息中间件的开放式标准应用层协议。AMQP定义了这些特性：

消息方向
消息队列
消息路由（包括：点到点和发布-订阅模式）
可靠性
安全性
## RabbitMQ
###　安装
```
sudo apt-get install erlang
echo 'deb http://www.rabbitmq.com/debian/ testing main' |
        sudo tee /etc/apt/sources.list.d/rabbitmq.list
sudo apt-get update
sudo apt-get install rabbitmq-server
```

### 管理
执行rabbitmq-plugins enable rabbitmq_management,开启web管理插件，访问[http://localhost:15672](http://localhost:15672) 使用guest/guest登录查看rabbit管理

## Spring Boot中使用RabbitMQ
