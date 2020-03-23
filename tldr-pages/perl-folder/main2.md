## 格式化输出

Perl 是一个非常强大的文本数据处理语言。

Perl 中可以使用 format 来定义一个模板，然后使用 write 按指定模板输出数据。

### 格式化定义语法格式

```perl
format FormatName =
fieldline
value_one, value_two, value_three
fieldline
value_one, value_two
.
```
**参数解析：**

FormatName ：格式化名称。
fieldline ：一个格式行，用来定义一个输出行的格式,类似 @,^,<,>,| 这样的字符。
value_one,value_two…… ：数据行，用来向前面的格式行中插入值,都是perl的变量。
. ：结束符号。

```perl
#!/usr/bin/perl
 
$text = "google runoob taobao";
format STDOUT =
 first: ^>>>>>>>>>>>  # 右边对齐
    $text
second:@<<<<<<# 左边对齐
    $text
 third: ^|||||||||| # 居中对齐
    $text  
.
write
```
**格式行(图形行)语法**

格式行以 @ 或者 ^ 开头，这些行不作任何形式的变量代换。
@ 字段(不要同数组符号 @ 相混淆)是普通的字段。
@,^ 后的 <, >,| 长度决定了字段的长度，如果变量超出定义的长度,那么它将被截断。
<, >,| 还分别表示,左对齐,右对齐,居中对齐。
^ 字段用于多行文本块填充。

**值域格式**

格式   | 值域含义
:-     | :-
@<<<   | 左对齐输出
@>>>   | 右对齐输出
@|||   | 中对齐输出
@##.## | 固定精度数字
@\*    | 多行文本

每个值域的第一个字符是行填充符，当使用@字符时，不做文本格式化。

在上表中，除了多行值域@\*，域宽都等于其指定的包含字符@在内的字符个数，例如：

```perl
#!/usr/bin/perl
 
format EMPLOYEE =
===================================
  @<<<<<<<<<<<<<<<<<<<<<< @<< 
$name, $age
@#####.####
$salary
===================================
.
 
select(STDOUT);
$~ = EMPLOYEE;
 
@n = ("Ali", "Runoob", "Jaffer");
@a  = (20,30, 40);
@s = (2000.00, 2500.00, 4000.000);
 
$i = 0;
foreach (@n){
    $name = $_;
    $age = $a[$i];
    $salary = $s[$i++];
    write;
}
```
**格式变量**                    | 描述
:-                          | :-
$~ ($FORMAT_NAME)           | 格式名字
$^ ($FORMAT_TOP_NAME)       | 当前的表头格式名字存储在
$% ($FORMAT_PAGE_NUMBER)    | 当前输出的页号
$= ($FORMAT_LINES_PER_PAGE) | 每页中的行数
$| ($FORMAT_AUTOFLUSH)      | 是否自动刷新输出缓冲区存储
$^L ($FORMAT_FORMFEED)      | 在每一页(除了第一页)表头之前需要输出的字符串存储在

**不指定$~的情况下，会输出名为STDOUT的格式：**
**使用 $^ $~ $%**
```perl
#!/usr/bin/perl
 
format EMPLOYEE =
===================================
@<<<<<<<<<<<<<<<<<<<<<< @<< 
$name, $age
@#####.##
$salary
===================================
.
 
# 添加分页 $% 
format EMPLOYEE_TOP =
===================================
Name                    Age Page @<
                                 $%
=================================== 
.
 
select(STDOUT);
$~ = EMPLOYEE;
$^ = EMPLOYEE_TOP;
 
@n = (1..100);
@a = (1..100);
@s = (1..100);
 
$i = 0;
foreach (@n){
   $name = $_;
   $age = $a[$i];
   $salary = $s[$i++];
   write;
}
```
### 输出到其它文件

默认情况下函数write将结果输出到标准输出文件STDOUT

两种方式:
1. `write(MYFILE);` 用默认名为MYFILE的打印格式输出到文件MYFILE中。但不能用$~变量再来改变所使用的打印格式。
2. 系统变量$~只对默认文件变量起作用，我们可以先改变默认文件变量，再改变$~，最后调用write。


方式一
```perl
#!/usr/bin/perl
 
if (open(MYFILE, ">tmp")) {
$~ = "MYFORMAT";
write MYFILE; # 含文件变量的输出，此时会打印与变量同名的格式，即MYFILE。$~里指定的值被忽略。
 
format MYFILE = # 与文件变量同名 
=================================
      输入到文件中
=================================
.
close MYFILE;
}
```
方式二
**使用select改变默认文件变量**
```perl
#!/usr/bin/perl
 
if (open(MYFILE, ">>tmp")) {
select (MYFILE); # 使得默认文件变量的打印输出到MYFILE中
$~ = "OTHER";
write;           # 默认文件变量，打印到select指定的文件中，必使用$~指定的格式 OTHER
 
format OTHER =
=================================
  使用定义的格式输入到文件中
=================================
. 
close MYFILE;
}
```


## 文件操作

Perl 使用一种叫做文件句柄类型的变量来操作文件。


输出异常告警
```perl
0 or die "You are die.";
print "next";
```

从文件读取或者写入数据需要使用文件句柄。
文件句柄(file handle)是一个I/O连接的名称。

Perl提供了三种文件句柄:STDIN,STDOUT,STDERR，分别代表标准输入、标准输出和标准出错输出。

### Open 函数
**Perl 中打开文件可以使用以下方式：**
open FILEHANDLE, EXPR
open FILEHANDLE

sysopen FILEHANDLE, FILENAME, MODE, PERMS
sysopen FILEHANDLE, FILENAME, MODE

**参数说明:**
FILEHANDLE：文件句柄，用于存放一个文件唯一标识符。
EXPR：文件名及文件访问类型组成的表达式。
MODE：文件访问类型。
PERMS：访问权限位(permission bits)。
```perl
#!/usr/bin/perl
 
open(DATA, "<file.txt") or die "file.txt 文件无法打开, $!";
 
while(<DATA>){
   print "$_";
}
```
以下代码以写入( > )的方式打开文件 file.txt:

```perl
<表示读入方式。 >表示写入方式。
open(DATA, "<elif.txt") or die "elif.txt 文件无法打开, $!";
如果你需要以读写方式打开文件，可以在 > 或 < 字符前添加 + 号：
open(DATA, "+<file.txt"); or die "file.txt 文件无法打开, $!";
这种方式不会删除文件原来的内容，如果要删除，格式如下所示：
open DATA, "+>file.txt" or die "file.txt 文件无法打开, $!";

如果要向文件中追加数据，则在追加数据之前，只需要以追加方式打开文件即可：
open(DATA,">>file.txt") || die "file.txt 文件无法打开, $!";
>> 表示向现有文件的尾部追加数据，如果需要读取要追加的文件内容可以添加 + 号：
open(DATA,"+>>file.txt") || die "file.txt 文件无法打开, $!";

```
下表列出了不同的访问模式：

模式      | 描述
:-        | :-
< 或 r    | 只读方式打开，将文件指针指向文件头。
\> 或 w   | 写入方式打开，将文件指针指向文件头并将文件大小截为零。如果文件不存在则尝试创建之。
>> 或 a   | 写入方式打开，将文件指针指向文件末尾。如果文件不存在则尝试创建之。
+< 或 r+  | 读写方式打开，将文件指针指向文件头。
+> 或 w+  | 读写方式打开，将文件指针指向文件头并将文件大小截为零。如果文件不存在则尝试创建之。
+>> 或 a+ | 读写方式打开，将文件指针指向文件末尾。如果文件不存在则尝试创建之。

### Sysopen函数

sysopen 函数类似于 open 函数，只是它们的参数形式不一样。

```perl
以下实例是以读写(+<filename)的方式打开文件：
sysopen(DATA, "file.txt", O_RDWR);

如果需要在更新文件前清空文件，则写法如下：
sysopen(DATA, "file.txt", O_RDWR|O_TRUNC );
```

你可以使用 O_CREAT 来创建一个新的文件， O_WRONLY 为只写模式， O_RDONLY 为只读模式。
The PERMS 参数为八进制属性值，表示文件创建后的权限，默认为 0x666。

下表列出了可能的模式值：

模式       | 描述
:-         | :-
O_RDWR     | 读写方式打开，将文件指针指向文件头。
O_RDONLY   | 只读方式打开，将文件指针指向文件头。
O_WRONLY   | 写入方式打开，将文件指针指向文件头并将文件大小截为零。如果文件不存在则尝试创建之。
O_CREAT    | 创建文件
O_APPEND   | 追加文件
O_TRUNC    | 将文件大小截为零
O_EXCL     | 如果使用O_CREAT时文件存在,就返回错误信息,它可以测试文件是否存在
O_NONBLOCK | 非阻塞I/O使我们的操作要么成功，要么立即返回错误，不被阻塞。

### Close 函数

在文件使用完后，要关闭文件，以刷新与文件句柄相关联的输入输出缓冲区，关闭文件的语法如下：

```perl
close FILEHANDLE
close
```
FILEHANDLE 为指定的文件句柄，如果成功关闭则返回 true。

close(DATA) || die "无法关闭文件";

### 读写文件

向文件读写信息有以下几种不同的方式：

<FILEHANDL> 操作符
从打开的文件句柄读取信息的主要方法是 <FILEHANDLE> 操作符。在标量上下文中，它从文件句柄返回单一行。例如：
```perl
#!/usr/bin/perl
 
print "菜鸟教程网址?\n";
$name = <STDIN>;
print "网址：$name\n";
```

当我们使用 <FILEHANDLE> 操作符时，它会返回文件句柄中每一行的列表，例如我们可以导入所有的行到数组中。

$ cat import.txt 
1
2
3
读取 import.txt 并将每一行放到 @lines 数组中：
```perl
#!/usr/bin/perl
 
open(DATA,"<file.txt") or die "无法打开数据, $!";
@lines = <DATA>;
print @lines;    # 输出数组内容
close(DATA);
```
### getc 函数
xgetc 函数从指定的 FILEHANDLE 返回单一的字符，如果没指定返回 STDIN：

getc FILEHANDLE
getc
如果发生错误，或在文件句柄在文件末尾，则返回 undef。

### read 函数
read 函数用于从缓冲区的文件句柄读取信息。

这个函数用于从文件读取二进制数据。

read FILEHANDLE, SCALAR, LENGTH, OFFSET
read FILEHANDLE, SCALAR, LENGTH
参数说明:

FILEHANDLE：文件句柄，用于存放一个文件唯一标识符。
SCALAR：存贮结果，如果没有指定OFFSET，数据将放在SCALAR的开头。否则数据放在SCALAR中的OFFSET字节之后。
LENGTH：读取的内容长度。
OFFSET：偏移量。
如果读取成功返回读取的字节数，如果在文件结尾返回 0，如果发生错误返回 undef。

### print 函数

对于所有从文件句柄中读取信息的函数，在后端主要的写入函数为 print：

print FILEHANDLE LIST
print LIST
print
利用文件句柄和 print 函数可以把程序运行的结果发给输出设备(STDOUT：标准输出)，例如：

print "Hello World!\n";

### 文件拷贝
以下实例我们将打开一个已存在的文件 file1.txt ，并读取它的每一行写入到文件 file2.txt 中：
```perl
#!/usr/bin/perl
 
# 只读方式打开文件
open(DATA1, "<file1.txt");
 
# 打开新文件并写入
open(DATA2, ">file2.txt");
 
# 拷贝数据
while(<DATA1>)
{
   print DATA2 $_;
}
close( DATA1 );
close( DATA2 );
```
### 文件重命名
```perl
rename ("/usr/runoob/test/file1.txt", "/usr/runoob/test/file2.txt" );
```
函数 renames 只接受两个参数，只对已存在的文件进行重命名。

### 删除文件
以下实例我们演示了如何使用 unlink 函数来删除文件：
```perl
#!/usr/bin/perl
 
unlink ("/usr/runoob/test/file1.txt");
```
### 指定文件位置
你可以使用 tell 函数来获取文件的位置，并通过使用 seek 函数来指定文件内的的位置：

tell 函数
tell 函数用于获取文件位置：

tell FILEHANDLE
tell
如果指定 FILEHANDLE 该函数返回文件指针的位置，以字节计。如果没有指定则返回默认选取的文件句柄。

### seek 函数
seek()函数是通过文件句柄来移动文件读写指针的方式来读取或写入文件的，以字节为单位进行读取和写入：

seek FILEHANDLE, POSITION, WHENCE
参数说明:

FILEHANDLE：文件句柄，用于存放一个文件唯一标识符。
POSITION：表示文件句柄(读写位置指针)要移动的字节数。
WHENCE：表示文件句柄(读写位置指针)开始移动时的起始位置，可以取的值为0、1、2；分别表示文件开头、当前位置和文件尾。
以下实例为从文件开头读取 256 个字节：

seek DATA, 256, 0;

### 文件信息

Perl 的文件操作也可以先测试文件是否存在，是否可读写等。
```perl
#/usr/bin/perl
 
my $file = "file.txt";
my (@description, $size);
if (-e $file)
{
    push @description, '是一个二进制文件' if (-B _);
    push @description, '是一个socket(套接字)' if (-S _);
    push @description, '是一个文本文件' if (-T _);
    push @description, '是一个特殊块文件' if (-b _);
    push @description, '是一个特殊字符文件' if (-c _);
    push @description, '是一个目录' if (-d _);
    push @description, '文件存在' if (-x _);
    push @description, (($size = -s _)) ? "$size 字节" : '空';
    print "$file 信息：", join(', ',@description),"\n";
}
```
执行以上程序，输出结果为：

file1.txt 信息：是一个文本文件, 15 字节
文件测试操作符如下表所示：

操作符 | 描述
:-     | :-
-A     | 文件上一次被访问的时间(单位：天)
-B     | 是否为二进制文件
-C     | 文件的(inode)索引节点修改时间(单位：天)
-M     | 文件上一次被修改的时间(单位：天)
-O     | 文件被真实的UID所有
-R     | 文件或目录可以被真实的UID/GID读取
-S     | 为socket(套接字)
-T     | 是否为文本文件
-W     | 文件或目录可以被真实的UID/GID写入
-X     | 文件或目录可以被真实的UID/GID执行
-b     | 为block-special (特殊块)文件(如挂载磁盘)
-c     | 为character-special (特殊字符)文件(如I/O 设备)
-d     | 为目录
-e     | 文件或目录名存在
-f     | 为普通文件
-g     | 文件或目录具有setgid属性
-k     | 文件或目录设置了sticky位
-l     | 为符号链接
-o     | 文件被有效UID所有
-p     | 文件是命名管道(FIFO)
-r     | 文件可以被有效的UID/GID读取
-s     | 文件或目录存在且不为0(返回字节数)
-t     | 文件句柄为TTY(系统函数isatty()的返回结果；不能对文件名使用这个测试)
-u     | 文件或目录具有setuid属性
-w     | 文件可以被有效的UID/GID写入
-x     | 文件可以被有效的UID/GID执行
-z     | 文件存在，大小为0(目录恒为false)，即是否为空文件，


## 目录操作

以下列出了一些操作目录的标准函数：

opendir DIRHANDLE, EXPR  # 打开目录
readdir DIRHANDLE        # 读取目录
rewinddir DIRHANDLE      # 定位指针到开头
telldir DIRHANDLE        # 返回目录的当前位置
seekdir DIRHANDLE, POS   # 定位指定到目录的 POS 位置
closedir DIRHANDLE       # 关闭目录

### 显示所有的文件

显示目录下的所有文件，以下实例使用了 glob 操作符，演示如下：
```perl
#!/usr/bin/perl
 
# 显示 /tmp 目录下的所有文件
$dir = "/tmp/*";
my @files = glob( $dir );
 
foreach (@files ){
   print $_ . "\n";
}
 
# 显示 /tmp 目录下所有以 .c 结尾的文件
$dir = "/tmp/*.c";
@files = glob( $dir );
 
foreach (@files ){
   print $_ . "\n";
}
 
# 显示所有隐藏文件
$dir = "/tmp/.*";
@files = glob( $dir );
foreach (@files ){
   print $_ . "\n";
}
 
# 显示 /tmp 和 /home 目录下的所有文件
$dir = "/tmp/* /home/*";
@files = glob( $dir );
 
foreach (@files ){
   print $_ . "\n";
}
```
### 列出目录下所有文件：
```perl
#!/usr/bin/perl
 
opendir (DIR, '.') or die "无法打开目录, $!";
while ($file = readdir DIR) {
  print "$file\n";
}
closedir DIR;
```
如果你要显示 /tmp 目录下所有以 .c 结尾的文件，可以使用以下代码：
```perl
#!/usr/bin/perl
 
opendir(DIR, '.') or die "无法打开目录, $!";
foreach (sort grep(/^.*\.c$/,readdir(DIR))){
   print "$_\n";
}
closedir DIR;
```
### 创建一个新目录
我们可以使用 mkdir 函数来创建一个新目录，执行前你需要有足够的权限来创建目录：
```perl
#!/usr/bin/perl
 
$dir = "/tmp/perl";
 
# 在 /tmp 目录下创建 perl 目录
mkdir( $dir ) or die "无法创建 $dir 目录, $!";
print "目录创建成功\n";
```
### 删除目录
我们可以使用 rmdir 函数来删除目录，执行该操作需要有足够权限。另外要删除的目录必须的空目录：
```perl
#!/usr/bin/perl
 
$dir = "/tmp/perl";
 
# 删除 /tmp 目录下的 perl 目录
rmdir( $dir ) or die "无法删除 $dir 目录, $!";
print "目录删除成功\n";
```
### 切换目录
我们可以使用chdir 函数来切换当期目录，执行该操作需要有足够权限。实例如下：
```perl
#!/usr/bin/perl
 
$dir = "/home";
 
# 将当期目录移动到 /home 目录下
chdir( $dir ) or die "无法切换目录到 $dir , $!";
print "你现在所在的目录为 $dir\n";
```

## 错误处理


### if语句
```perl
if(open(DATA, $file)){
   ...
}else{
   die "Error: 无法打开文件 - $!";
}
# 短路逻辑
open(DATA, $file) || die "Error: 无法打开文件 - $!";
```
### unless语句
```perl
unless(chdir("/etc")){
   warn "Error: 无法打开目录 - $!";
}
warn "Error: 无法打开目录!: $!" unless(chdir("/et"));
```
### 三元运算符
```perl
print(exists($hash{value}) ? '存在' : '不存在',"\n");
```

### Carp模块


函数名  | 用法                | 作用
:-      | :-                  | :-
carp    | use Carp;           | 与warn() 类似，提供了从产生错误处的栈回溯追踪。
cluck   | use Carp qw/cluck/; | 与warn() 类似，提供了从产生错误处的栈回溯追踪。
croak   | use Carp;           | 与die () 类似，提供了从产生错误处的栈回溯追踪。
confess | use Carp;           | 与die () 类似，提供了从产生错误处的栈回溯追踪。

**carp Demo**
```perl
package T;

require Exporter;
@ISA = qw/Exporter/;
@EXPORT = qw/function/;
use Carp;

sub function {
   carp "Error in module!";
}
1;
```

## 特殊变量

Perl 语言中定义了一些特殊的变量，通常以 $, @, 或 % 作为前缀，例如：$\_。
这些变量也都有对应的英文名(use English)

```perl
#!/usr/bin/perl
use English;
 
foreach ('Google','Runoob','Taobao') {
    print $ARG;
	print $_;
    print "\n";
}
```

以下是几处即使没有写明 Perl 也会假定使用 $\_ 的地方：

各种单目函数，包括像 ord() 和 int() 这样的函数以及除 "-t"以外所有的文件 测试操作 ("-f"，"-d")，"-t" 默认操作 STDIN。
各种列表函数，例如 print() 和 unlink()。
没有使用 "=~" 运算符时的模式匹配操作 "m//"、"s///" 和"tr///"。
在没有给出其他变量时是 "foreach" 循环的默认迭代变量。
grep() 和 map() 函数的隐含迭代变量。
当 "while" 仅有唯一条件，且该条件是对 ""操作的结果进行测试时，$\_ 就是存放输入记录的默认位置。除了"while" 测试条件之外不会发生这种情况。(助记：下划线在特定操作中是可以省略的。)

特殊变量类型
根据特殊的变量的使用性质，可以分为以下几类：

全局标量特殊变量。
全局数组特殊变量。
全局哈希特殊变量。
全局特殊文件句柄。
全局特殊常量。

正则表达式特殊变量。
文件句柄特殊变量。


### 全局标量特殊变量

以下列出了所有的标量特殊变量，包含了特殊字符与英文形式的变量：

英文名                        | 符号名 | 含义
:-                            | :-     | :-
$ARG                          | $\_    | 默认输入和模式匹配内容。
$NR                           | $.     | 前一次读的文件句柄的当前行号
$RS                           | $/     | 输入记录分隔符,默认是新行字符。如用undef这个变量,将读到文件结尾。
$OFS                          | $,     | 输出域分隔符
$ORS                          | $\     | 输出记录分隔符
$LIST_SEPARATOR               | $"     | 该变量同 $,类似，但应用于向双引号引起的字符串(或类似的内插字符串)中内插数组和切片值的场合。默认为一个空格。
$SUBSCRIPT_SEPARATOR          | $;     | 在仿真多维数组时使用的分隔符。默认为 "\034"。
$FORMAT_FORMFEED              | $^L    | 发送到输出通道的走纸换页符。默认为 "\f".
$FORMAT_LINE_BREAK_CHARACTERS | $:     | The current set of characters after which a string may be broken to fill continuation fields (starting with ^) in a format. Default is "\n"".
$ACCUMULATOR                  | $^A    | 打印前用于保存格式化数据的变量
$OFMT                         | $#     | 打印数字时默认的数字输出格式（已废弃）。
$CHILD_ERROR                  | $?     | 返回上一个外部命令的状态
$OS_ERROR or $ERRNO           | $!     | 这个变量的数字值是errno的值,字符串值是对应的系统错误字符串
$EVAL_ERROR                   | $@     | 命令eval的错误消息.如果为空,则表示上一次eval命令执行成功
$PROCESS_ID or $PID           | $$     | 运行当前Perl脚本程序的进程号
$REAL_USER_ID or $UID         | $<     | 当前进程的实际用户号
$EFFECTIVE_USER_ID or $EUID   | $>     | 当前进程的有效用户号
$REAL_GROUP_ID or $GID        | $(     | 当前进程的实际组用户号
$EFFECTIVE_GROUP_ID or $EGID  | $)     | 当前进程的有效组用户号
$PROGRAM_NAME                 | $0     | 包含正在执行的脚本的文件名
none                          | $[     | 数组的数组第一个元素的下标,默认是 0。
$PERL_VERSION                 | $]     | Perl的版本号
$DEBUGGING                    | $^D    | 调试标志的值
$EXTENDED_OS_ERROR            | $^E    | 在非UNIX环境中的操作系统扩展错误信息
$SYSTEM_FD_MAX                | $^F    | 最大的文件捆述符数值
none                          | $^H    | 由编译器激活的语法检查状态
$INPLACE_EDIT                 | $^I    | 内置控制编辑器的值
none                          | $^M    | 备用内存池的大小
$OSNAME                       | $^O    | 操作系统名
$PERLDB                       | $^P    | 指定当前调试值的内部变量
$BASETIME                     | $^T    | 从新世纪开始算起,脚步本以秒计算的开始运行的时间
$WARNING                      | $^W    | 警告开关的当前值
$EXECUTABLE_NAME              | $^X    | Perl二进制可执行代码的名字
none                          | $ARGV  | 从默认的文件句柄中读取时的当前文件名


### 全局数组特殊变量

符号名 | 含义
:-     | :-
@ARGV  | 传给脚本的命令行参数列表
@INC   | 在导入模块时需要搜索的目录列表
@F     | 命令行的数组输入

### 全局哈希特殊变量

符号名 | 含义
:-     | :-
%INC   | 散列表%INC包含所有用do或require语句包含的文件.关键字是文件名,值是这个文件的路径
%ENV   | 包含当前环境变量
%SIG   | 信号列表及其处理方式

### 全局特殊文件句柄

符号名     | 含义
:-         | :-
ARGV       | 遍历数组变量@ARGV中的所有文件名的特殊文件句柄
STDERR     | 标准错误输出句柄
STDIN      | 标准输入句柄
STDOUT     | 标准输出句柄
DATA       | 特殊文件句柄引用了在文件中 `__END__` 标志后的任何内容包含脚本内容。或者引用一个包含文件中`__DATA__` 标志后的所有内容，只要你在同一个包有读取数据，`__DATA__` 就存在。
_ (下划线) | 特殊的文件句柄用于缓存文件信息(fstat、stat和lstat)。

### 全局特殊常量

符号名        | 含义
:-            | :-
`__END__`     | 脚本的逻辑结束，忽略后面的文本。
`__FILE__`    | 当前文件名
`__LINE__`    | 当前行号
`__PACKAGE__` | 当前包名，默认的包名是main。

### 正则表达式特殊变量

英文名            | 符号名 | 含义
:-                | :-     | :-
none              | $n     | 包含上次模式匹配的第n个子串
$MATCH            | $&     | 前一次成功模式匹配的字符串
$PREMATCH         | $\`    | 前次匹配成功的子串之前的内容
$POSTMATCH        | $'     | 前次匹配成功的子串之后的内容
$LAST_PAREN_MATCH | $+     | 与上个正则表达式搜索格式匹配的最后一个括号。例如： `/Version: (.*) | Revision: (.*)/ && ($rev = $+);`

### 文件句柄特殊变量

英文名                 | 符号名 | 含义
:-                     | :-     | :-
$OUTPUT_AUTOFLUSH      |`$|`    | 如果设置为零,在每次调用函数write或print后，自动调用函数fflush,将所写内容写回文件
$FORMAT_PAGE_NUMBER    | $%     | 当前输出页号
$FORMAT_LINES_PER_PAGE | $=     | 当前每页长度。默认为 60。
$FORMAT_LINES_LEFT     | $-     | 当前页剩余的行数
$FORMAT_NAME           | $~     | 当前报表输出格式的名称。默认值是文件句柄名。
$FORMAT_TOP_NAME       | $^     | 当前报表输出表头格式的名称。默认值是带后缀"`_TOP`"的文件句柄名。


## 正则表达式

Perl的正则表达式的三种形式:
1. 匹配：m//（还可以简写为//，略去m）
2. 替换：s///
3. 转化：tr///

这三种形式一般都和 =~ 或 !~ 搭配使用， =~ 表示相匹配，!~ 表示不匹配。

### 匹配

**模式匹配修饰符**

修饰符 | 描述
:-     | :-
i      | 忽略模式中的大小写
m      | 多行模式
o      | 仅赋值一次
s      | 单行模式，"."匹配"\n"（默认不匹配）
x      | 忽略模式中的空白
g      | 全局匹配
cg     | 全局匹配失败后，允许再次查找匹配串

**三个变量**
```perl
$`: 匹配部分的前一部分字符串
$&: 匹配的字符串
$': 还没有匹配的剩余字符串
```
**一个例子**
```perl
$bar = "I am run
oob site";
$bar =~ /run.oob/   and print "第1次匹配===========\n" or print "第1次不匹配===========\n";
$bar =~ /run.oob/s  and print "第2次匹配===========\n" or print "第2次不匹配===========\n";
$bar =~ /RUN.OOB/is and print "第3次匹配===========\n" or print "第3次不匹配===========\n";
print $`.$&.$'
```


### 替换操作符

```perl
$string = "welcome to google site.";
$string !~ s/google/runoob/ or print "no\n";
$string =~ s/google/runoob/ and print "yes\n";
print "$string\n";
```
替换操作修饰符
替换操作修饰符如下表所示：

修饰符 | 描述
:-     | :-
i      | 忽略模式中的大小写
m      | 多行模式
o      | 仅赋值一次
s      | 单行模式，"."匹配"\n"（默认不匹配）
x      | 忽略模式中的空白
g      | 替换所有匹配的字符串。
e      | 替换字符串作为表达式

### 转化操作符

修饰符 | 描述
:-     | :-
c      | 转化所有未指定字符
d      | 删除所有指定字符
s      | **把多个相同的输出字符缩成一个**
以下实例将变量 $string 中的所有小写字母转化为大写字母：

```perl
$string = 'welcome to runoob site.';
$string =~ tr/a-z/A-Z/;

print "$string\n";
 
$string = 'runoob';
$string =~ tr/a-z/A-Z/s;
 
print "$string\n";

$string =~ tr/\d/ /c;     # 把所有非数字字符替换为空格
$string =~ tr/\t //d;     # 删除tab和空格
$string =~ tr/0-9/ /cs    # 把数字间的其它字符替换为一个空格。
```

表达式     | 描述
:-         | :-
.          | 匹配除换行符以外的所有字符
x?         | 匹配 0 次或一次 x 字符串
`x*`       | 匹配 0 次或多次 x 字符串,但匹配可能的最少次数
`x+`       | 匹配 1 次或多次 x 字符串,但匹配可能的最少次数
`.*`       | 匹配 0 次或多次的任何字符
.+         | 匹配 1 次或多次的任何字符
{m}        | 匹配刚好是 m 个 的指定字符串
{m,n}      | 匹配在 m个 以上 n个 以下 的指定字符串
{m,}       | 匹配 m个 以上 的指定字符串
[]         | 匹配符合 [] 内的字符
[^]        | 匹配不符合 [] 内的字符
[0-9]      | 匹配所有数字字符
[a-z]      | 匹配所有小写字母字符
[^0-9]     | 匹配所有非数字字符
[^a-z]     | 匹配所有非小写字母字符
^          | 匹配字符开头的字符
$          | 匹配字符结尾的字符
\d         | 匹配一个数字的字符,和 [0-9] 语法一样
\d+        | 匹配多个数字字符串,和 [0-9]+ 语法一样
\D         | 非数字,其他同 \d
\D+        | 非数字,其他同 \d+
\w         | 英文字母或数字的字符串,和 `[a-zA-Z0-9_] `语法一样
\w+        | 和 `[a-zA-Z0-9_]+ `语法一样
\W         | 非英文字母或数字的字符串,和 `[^a-zA-Z0-9_]` 语法一样
\W+        | 和 [^a-zA-Z0-9_]+ 语法一样
\s         | 空格,和 [\n\t\r\f] 语法一样
\s+        | 和 [\n\t\r\f]+ 一样
\S         | 非空格,和 [^\n\t\r\f] 语法一样
\S+        | 和 [^\n\t\r\f]+ 语法一样
\b         | 匹配以英文字母,数字为边界的字符串
\B         | 匹配不以英文字母,数值为边界的字符串
`a|b|c`    | 匹配符合a字符 或是b字符 或是c字符 的字符串
abc        | 匹配含有 abc 的字符串 (pattern) () 这个符号会记住所找寻到的字符串,是一个很实用的语法.第一个 () 内所找到的字符串变成 $1 这个变量或是 \1 变量,第二个 () 内所找到的字符串变成 $2 这个变量或是 \2 变量,以此类推下去.
/pattern/i | i 这个参数表示忽略英文大小写,也就是在匹配字符串的时候,不考虑英文的大小写问题. \ 如果要在 pattern 模式中找寻一个特殊字符,如 `"*"`,则要在这个字符前加上 \ 符号,这样才会让特殊字符失效



