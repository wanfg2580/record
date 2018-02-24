<!--
author: jimmy
head:
date: 2018-02-14
title: linux常用命令学习
tags: tips
images: blog/img/1.jpg
category: linux
status: publish
summary: linux常用命令
-->
## linux常用命令学习
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [linux常用命令学习](#linux常用命令学习)
	* [1 ls命令](#1-ls命令)
		* [1.1 命令格式](#11-命令格式)
		* [1.2 参数描述](#12-参数描述)
	* [2 cd 命令](#2-cd-命令)
		* [2.1 命令格式](#21-命令格式)
		* [2.2 参数描述](#22-参数描述)
	* [3 pwd 命令](#3-pwd-命令)
		* [3.1 命令格式](#31-命令格式)
		* [3.2 参数描述](#32-参数描述)

<!-- /code_chunk_output -->
### 1 ls命令
ls命令是linux下最常用的命令。ls命令就是list的缩写，缺省下ls用来打印出当前目录的清单。如果ls指定其他目录，那么就会显示指定目录里的文件及文件夹清单。 通过ls 命令不仅可以查看linux文件夹包含的文件而且可以查看文件权限(包括目录、文件夹、文件权限)查看目录信息等等。
#### 1.1 命令格式
ls [选项] [目录名]
#### 1.2 参数描述
```
-a, –all 列出目录下的所有文件，包括以 . 开头的隐含文件
-A, 同-a，但不列出“.”(表示当前目录)和“..”(表示当前目录的父目录)。

-b, --escape               把文件名中不可输出的字符用反斜杠加字符编号的形式列出。
    --block-size=SIZE      块以指定<大小>的字节为单位
-B, 不列出任何以 ~ 字符结束的隐含条目

-c  配合 -lt：根据 ctime 排序及显示 ctime (文件状态最后更改的时间)
    配合 -l：显示 ctime 但根据名称排序
    否则：根据 ctime 排序
-C 多列显示输出结果(默认选项与 -l 相反)
    –color[=WHEN] 控制是否使用色彩分辨文件。WHEN 可以是’never’、’always’或’auto’其中之一

-d, –directory 将目录象文件一样显示，而不是显示其下的文件。
-D, –dired 产生适合 Emacs 的 dired 模式使用的结果

-f 对输出的文件不进行排序，与 -aU 相同，与-ls 相反

-g 类似 -l,但不列出所有者

-G, –no-group 不列出任何有关组的信息

-h, –human-readable 以容易理解的格式列出文件大小 (例如 1K 234M 2G)

–si 类似 -h,但文件大小取 1000 的次方而不是 1024

-H, --dereference-command-line 使用命令列中的符号链接指示的真正目的地
    --indicator-style=方式 指定在每个项目名称后加上指示符号<方式>：none (默认)，classify (-F)，file-type (-p)

-i, –inode 印出每个文件的 inode 号 (inode 索引节点,是存储文件元信息的区域)

-I, --ignore=样式 不印出任何符合 shell 万用字符<样式>的项目

-k 即 --block-size=1K,以 k 字节的形式表示文件的大小。

-l 除了文件名之外，还将文件的权限、所有者、文件大小等信息详细列出来。

-L, –dereference 当显示符号链接的文件信息时，显示符号链接所指示的对象而并非符号链接本身的信息

-m 所有项目以逗号分隔，并填满整行行宽

-o 类似 -l,显示文件的除组信息外的详细信息。

-r, --reverse 依相反次序排列

-R, --recursive 同时列出所有子目录层

-s, --size 以块大小为单位列出所有文件的大小

-S 根据文件大小排序
    --sort=WORD 以下是可选用的 WORD 和它们代表的相应选项：
      extension -X status -c
      none -U time -t
      size -S atime -u
      time -t access -u
      version -v use -u

-t 以文件修改时间排序

-u 配合 -lt:显示访问时间而且依访问时间排序
    配合 -l:显示访问时间但根据名称排序
    否则：根据访问时间排序

-U 不进行排序;依文件系统原有的次序列出项目

-v 根据版本进行排序

-w, –width=COLS 自行指定屏幕宽度而不使用目前的数值

-x 逐行列出项目而不是逐栏列出

-X 根据扩展名排序

-1 每行只列出一个文件

–help 显示此帮助信息并离开

–version 显示版本信息并离开
```
### 2 cd 命令
切换当前目录到目标目录
#### 2.1 命令格式
cd [目录名]
#### 2.2 参数描述
```
cd / #进入系统目录
cd   #进入用户根目录
cd ../ #进入上级目录
cd - #返回进入该目录前的目录
cd !$ #把上个命令的参数作为cd参数使用
```

### 3 pwd 命令
查看当前工作目录完整路径
#### 3.1 命令格式
pwd [选项]
#### 3.2 参数描述
