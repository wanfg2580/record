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

## 常见User Agent
1. Android
> Mozilla/5.0 (Linux; Android 4.1.1; Nexus 7 Build/JRO03D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Safari/535.19
> Mozilla/5.0 (Linux; U; Android 4.0.4; en-gb; GT-I9300 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
> Mozilla/5.0 (Linux; U; Android 2.2; en-gb; GT-P1000 Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1

2. Firefox
> Mozilla/5.0 (Windows NT 6.2; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0
>Mozilla/5.0 (Android; Mobile; rv:14.0) Gecko/14.0 Firefox/14.0

3. Google Chrome
> Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36
> Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19

4. iOS
> Mozilla/5.0 (iPad; CPU OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 > > Mobile/9A334 Safari/7534.48.3
> Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3A101a Safari/419.3

## git忽视而不提交文件
1. 从未提交的文件使用 .gitignore
适用从没有commit的文件,即没有被git记录
2. 已经推送（push）过的文件，想从git远程库中删除，并在以后的提交中忽略，但是却还想在本地保留这个文件

```
git rm --cached Xml/config.xml
#后面的 Xml/config.xml 是要从远程库中删除的文件的路径，支持通配符*
```

3. 已经推送（push）过的文件，想在以后的提交时忽略此文件，即使本地已经修改过，而且不删除git远程库中相应文件
```
git update-index --assume-unchanged Xml/config.xml  
# 后面的 Xml/config.xml 是要忽略的文件的路径。
```
如果要忽略一个目录，打开 git bash，cd到 目标目录下，执行：
```
git update-index --assume-unchanged $(git ls-files | tr '\n' ' ')
```

## Axel--ubuntu 多线程下载工具
-n   指定线程数
-o   指定另存为目录
-s   指定每秒的最大比特数
-q   静默模式

如从Diahosting下载lnmp安装包指定10个线程，存到/tmp/：axel -n 10 -o /tmp/ http://soft.vpser.net/lnmp/lnmp0.7-full.tar.gz

如果下载过程中下载中断可以再执行下载命令即可恢复上次的下载进度。
