<!--
author: jimmy
head:
date: 2018-03-05
title: telegram 机器人
tags: telegram
images: http://pingodata.qiniudn.com/cube2.jpg
category: python telegram
status: publish
summary: anaconda管理python环境
-->
# telegram Bot学习

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [telegram Bot学习](#telegram-bot学习)
		* [1. 创建bot机器人](#1-创建bot机器人)
		* [1.1](#11)
		* [2. telegram 设置webhook](#2-telegram-设置webhook)

<!-- /code_chunk_output -->

### 1. 创建bot机器人
https://telegram.me/botfather
和botfather聊天根据指令创建机器人
### 1.1
### 2. telegram 设置webhook
sudo pip install python-telegram-bot

```
import telegram
import os

bot = telegram.Bot(token='token')

print(bot.get_me())

info1 = bot.get_webhook_info()
print info1


url = 'url'
timeout = 120
certificate = open(os.path.join(''), "rb")
allowed_updates = []

bot.set_webhook(url, certificate=certificate, allowed_updates=allowed_updates)

info2 = bot.get_webhook_info()
print info2

```
