## 小tips
#### 笔记本Ubuntu网卡解决方式
sudo echo "options rtl8723be fwlps=0 swlps=0" > /etc/modprobe.d/rtl8723be.conf
重启
*****

### maven依赖本地jar包
mvn install:install-file  -Dfile=D:\JAR_LIB\pinyin4j-2.5.0.jar -DgroupId=net.sourceforge.pinyin4j -DartifactId=pinyin4j -Dversion=2.5.0 -Dpackaging=jar  -DgeneratePom=true -DcreateChecksum=true
*****
### ubuntu搜狗输入法输不了中文
删除~/.config目录下的SogouPY、SogouPY.users、sogou-qimpanel三个文件夹即可恢复正常
*****
### 转化私钥格式
 openssl pkcs8 -topk8 -inform PEM -outform PEM -in My.pem -out priv8.pem -nocrypt
*****
### ubuntu bash自动补全忽视大小写
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
> show-all-if-ambiguous : 默认情况下，按下两次 <tab> 才会出现提示，现在只需要一次了。
> match-hidden-files : 不显示隐藏文件，特别是当你在 Home 目录时，你会觉得眼前好干净。
> completion-ignore-case : 在自动补全时忽略大小写
> history-search-* : 输入某个命令的一部分时，按上下箭头，会匹配关于这个这命令最近的使用历史。

重启终端即可
