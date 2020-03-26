# shell 编程基础

开头：#!/bin/bash
 
echo 输出
-    '' 变量禁止替换
-    "" 变量允许替换
let 赋值
-     带不带引号没所谓
 
Shell运行命令时，创建子进程，继承环境变量。后续操作不会影响父进程
 
特殊文件
- /etc/profile "所有sh衍生的Shell适用"
- /etc/bashrc  "适用bash，系统范围函数与别名"
- \$HOME/.bash_profile
- \$HOME/.bashrc
- \$HOME/.bash_logout "登出时执行"
 
env
- -i,--ignore-environment 不带环境变量启动
- -u,--unset=NAME 从环境变量中删除一个变量
unset
- -v 删除变量，默认
- -f 删除函数
 
常见环境变量
- HOME
- PATH 外部命令的搜索路径,若非内部命令，则一个个搜索
- HISTSIZE 保存历史纪录的条数
- LOGNAME 当前登录用户
- HOSTNAME 主机名称
- SHELL 当前Shell
- LANG/LANGUAGE 语言相关
- MAIL 当前用户邮件存放目录
- PS1/PS2 提示符 PS1:root默认是# 普通用户是$。PS2是附属提示符，默认>。均可修改
 
 
参数引用
- 0，1，2.... 位置参数，0代表程序名，1第一个参数
- \* 用一个字符串显示所有参数，可超过9个
- @ 显示所有参数
- \# 参数数量，不含参数0
- $ 脚本进程ID号
- ! 后台运行的最后一个进程的ID号
- ? 退出状态。
- \- 显示Shell使用的当前选项
 
 
mkdir
- -p递归创建
 
cat
- -n显示行号
 
head
- -Count 显示前Count行
- -n Number显示前Number行
- -c End指定显示的字节数
 
 
标准输入
- <或0<
 
标准输出
- \>或1>
标准错误
- 2>
标准输出和标准错误
- &>
追加
- \>>
 
 
cat < /tmp/a.txt > /tmp/b.txt
 
 
特殊文件
- /dev/null
- /dev/zero
- /dev/tty
 
read
- -r不把\当作转义标志
 
命令替换
 
shift 截取最左端参数， 可加数量


## 字符串操作 


|变量运算符|替换|
|---|---|
|${varname:-word}|varname存在且非null,返回varname,否则返回word
|${varname:=word}|varname存在且非null,返回varname,否则返回word,并赋值给varname
|${varname:?message}|varname存在且非null,返回varname；否则打印message,并退出脚本
|${varname:+word}|varname存在且非null,返回word；否则返回null
|---|---|
|${varname#pattern}|删除开头匹配最短部分,并返回甚于部分
|${varname##pattern}|删除开头匹配最长部分,并返回甚于部分
|${varname%pattern}|删除结尾匹配最短部分,并返回甚于部分
|${varname%%pattern}|删除结尾匹配最长部分,并返回甚于部分
|---|---|
|${varname/pattern/string}|匹配替换第一部分
|${varname/pattern//string}|匹配替换所有部分


## 函数

tpye 查看命令的来源
函数定义：
- function funcname(){}
- function funcname  {}
- funcname(){}
 
参数和返回值
- 全局
- local：内部
返回值
- return
- $?保存的是上一条命令的返回值
 
