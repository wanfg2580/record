# anaconda管理python环境

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=0} -->
<!-- code_chunk_output -->

* [anaconda管理python环境](#anaconda管理python环境)
	* [1、管理conda](#1-管理conda)
	* [2、管理环境](#2-管理环境)
	* [3、包管理](#3-包管理)

<!-- /code_chunk_output -->

## 1、管理conda
+ 检查conda版本
```
conda -version
```

+ 更新conda
```
conda update conda
```

## 2、管理环境
+ 创建新环境
```
conda create -n env_name python=3
```

+ 环境切换
```
#切换到新环境
source activate env_name
#退出环境
deactivate env_name
```

+ 移除环境
```
conda remove -n env_name --all
```

## 3、包管理
+ 安装包
进入特定环境安装
```
activate env_name
conda install pandas
# 安装anaconda发行版中所有的包
conda install anaconda
```
指定安装环境
```
conda install -n env_name pandas
```

+ 查看包
```
conda list
# 指定查看某环境下安装的package
conda list -n env_name
```

+ 查找包
```
conda search pandas
```

+ 更新包
```
conda update numpy
```

+ 卸载包
```
conda remove numpy
```
