# 小tips

[toc]

## 笔记本Ubuntu网卡解决方式

sudo echo "options rtl8723be fwlps=0 swlps=0" > /etc/modprobe.d/rtl8723be.conf 重启

--------------------------------------------------------------------------------

## maven依赖本地jar包

mvn install:install-file -Dfile=D:\JAR_LIB\pinyin4j-2.5.0.jar -DgroupId=net.sourceforge.pinyin4j -DartifactId=pinyin4j -Dversion=2.5.0 -Dpackaging=jar -DgeneratePom=true -DcreateChecksum=true

--------------------------------------------------------------------------------

## ubuntu搜狗输入法输不了中文

删除~/.config目录下的SogouPY、SogouPY.users、sogou-qimpanel三个文件夹即可恢复正常

--------------------------------------------------------------------------------

## 转化私钥格式

openssl pkcs8 -topk8 -inform PEM -outform PEM -in My.pem -out priv8.pem -nocrypt

--------------------------------------------------------------------------------

## ubuntu bash自动补全忽视大小写

在用户目录下的.inputrc 添加如下内容

```
# do not show hidden files in the list
set match-hidden-files off

# auto complete ignoring case
set show-all-if-ambiguous on
set completion-ignore-case on

"\e[A": history-search-backward
"\e[B": history-search-forward
```

> show-all-if-ambiguous : 默认情况下，按下两次

> <tab> 才会出现提示，现在只需要一次了。
> match-hidden-files : 不显示隐藏文件，特别是当你在 Home 目录时，你会觉得眼前好干净。
> completion-ignore-case : 在自动补全时忽略大小写
> history-search-* : 输入某个命令的一部分时，按上下箭头，会匹配关于这个这命令最近的使用历史。</tab>

重启终端即可

--------------------------------------------------------------------------------

## ubuntu 安装gradle

在 [gradle](https://gradle.org/install/) 页面，按照说明安装gradle

## pip install 时报错 locale.Error: unsupported locale setting

原因：语言环境出错 解决方法： export LC_ALL=C

locale 命令查看结果如下：

```
locale: Cannot set LC_ALL to default locale: No such file or directory
LANG=en_US.UTF-8
LANGUAGE=
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC=zh_CN.UTF-8
LC_TIME=zh_CN.UTF-8
LC_COLLATE="en_US.UTF-8"
LC_MONETARY=zh_CN.UTF-8
LC_MESSAGES="en_US.UTF-8"
LC_PAPER=zh_CN.UTF-8
LC_NAME=zh_CN.UTF-8
LC_ADDRESS=zh_CN.UTF-8
LC_TELEPHONE=zh_CN.UTF-8
LC_MEASUREMENT=zh_CN.UTF-8
LC_IDENTIFICATION=zh_CN.UTF-8
LC_ALL=
```

执行解决命令后如下:

```
root@ubuntu:~# locale
LANG=en_US.UTF-8
LANGUAGE=
LC_CTYPE="C"
LC_NUMERIC="C"
LC_TIME="C"
LC_COLLATE="C"
LC_MONETARY="C"
LC_MESSAGES="C"
LC_PAPER="C"
LC_NAME="C"
LC_ADDRESS="C"
LC_TELEPHONE="C"
LC_MEASUREMENT="C"
LC_IDENTIFICATION="C"
LC_ALL=C
```
***
## ubuntu shadowsocks安装
```
apt-get install python-gevent python-pip
apt-get install python-m2crypto
pip install shadowsocks
```
创建config.json文件，内容如下：
```
{

  "server":"0.0.0.0",
  "server_port":ss端口,
  "local_port":1080,
  "password":"密码"
  "timeout":600,
  "method":"aes-256-cfb"
}
```
ssserver -c config.json 启动

***
## redis 安装
redis 官网: <a href="https://redis.io">https://redis.io</a>

1、下载包安装
下载编译包
```
wget http://download.redis.io/releases/redis-4.0.2.tar.gz
tar xzf redis-4.0.2.tar.gz
cd redis-4.0.2
make
```
启动redis,进入redis
```
# 启动redis
./src/redis-server

# 进入redis终端
./src/redis-cli

# 制定配置文件启动
./src/redis-cli redis.conf
```

2、自动安装
在 Ubuntu 系统安装 Redi 可以使用以下命令:
```
sudo apt-get update
sudo apt-get install redis-server
```

```
# 启动redis
redis-server

# 进入redis终端
redis-cli
```

***
