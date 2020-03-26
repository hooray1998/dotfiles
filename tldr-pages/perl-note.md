## Demo
```perl
#!/usr/bin/perl -w

print "Hello, World!\n";
```

命令行参数如下所示：

选项          | 描述
:-:           | :-:
-d[:debugger] | 在调试模式下运行程序
-Idirectory   | 指定 @INC/#include 目录
-T            | 允许污染检测
-t            | 允许污染警告
-U            | 允许不安全操作
-w            | 允许很多有用的警告
-W            | 允许所有警告
-X            | 禁用使用警告
-e program    | 执行 perl 代码
file          | 执行 perl 脚本文件


```perl
# 这是一个单行注释
print "Hello, world\n";
 
=pod 注释
这是一个多行注释
这是一个多行注释
这是一个多行注释
这是一个多行注释
=cut
```
Perl双引号和单引号的区别:
**双引号可以正常解析一些转义字符与变量，而单引号无法解析会原样输出。**

### Here 文档
```perl
#!/usr/bin/perl
 
$a = 10;
$var = <<"EOF";
这是一个 Here 文档实例，使用双引号。
可以在这输出字符串和变量。
例如：a = $a
EOF
print "$var\n";
 
$var = <<'EOF';
这是一个 Here 文档实例，使用单引号。
例如：a = $a
EOF
print "$var\n";
```

### 数据类型


```perl
# 序号	类型和描述
## 1	标量
## 标量是 Perl 语言中最简单的一种数据类型。这种数据类型的变量可以是数字，字符串，浮点数，不作严格的区分。在使用时在变量的名字前面加上一个 $，表示是标量。例如：

$myfirst=123;　    #数字123　
$mysecond="123";   #字符串123　

## 2	数组
## 数组变量以字符 @ 开头，索引从 0 开始，如：@arr=(1,2,3)

@arr=(1,2,3)
## 3	哈希
## 哈希是一个无序的 key/value 对集合。可以使用键作为下标获取值。哈希变量以字符 % 开头。

%h=('a'=>1,'b'=>2);
```

```perl
#!/usr/bin/perl 
 
$value = 9.01e+21 + 0.01 - 9.01e+21;
print ("第一个值为：", $value, "\n");
$value = 9.01e+21 - 9.01e+21 + 0.01;
print ("第二个值为:", $value, "\n");
```
```perl
#!/usr/bin/perl 

$var='这是一个使用

多行字符串文本

的例子';

print($var);
```

**Perl 语言中常用的一些转义字符如下表所示：**

转义字符 | 含义
:-:      | -
\\       | 反斜线
\'       | 单引号
\"       | 双引号
\a       | 系统响铃
\b       | 退格
\f       | 换页符
\n       | 换行
\r       | 回车
\t       | 水平制表符
\v       | 垂直制表符
\0nn     | 创建八进制格式的数字
\xnn     | 创建十六进制格式的数字
\cX      | 控制字符，x可以是任何字符
\u       | 强制下一个字符为大写
\l       | 强制下一个字符为小写
\U       | 强制将所有字符转换为大写
\L       | 强制将所有的字符转换为小写
\Q       | 将到\E为止的非单词（non-word）字符加上反斜线
\E       | 结束\L、\U、\Q



**Perl 为每个变量类型设置了独立的命令空间，所以不同类型的变量可以使用相同的名称**


### 数组
```perl
#!/usr/bin/perl
 
@ages = (25, 30, 40);             
@names = ("google", "runoob", "taobao");
 
print "\$ages[0] = $ages[0]\n";
print "\$ages[1] = $ages[1]\n";
print "\$ages[2] = $ages[2]\n";
print "\$names[0] = $names[0]\n";
print "\$names[1] = $names[1]\n";
print "\$names[2] = $names[2]";
```

### 哈希

```perl
#!/usr/bin/perl
 
%data = ('google', 45, 'runoob', 30, 'taobao', 40);
 
print "\$data{'google'} = $data{'google'}\n";
print "\$data{'taobao'} = $data{'taobao'}";
print "\$data{'runoob'} = $data{'runoob'}\n";
```


### 变量上下文

所谓上下文：指的是表达式所在的位置。

上下文是由等号左边的变量类型决定的，等号左边是标量，则是标量上下文，等号左边是列表，则是列表上下文。

Perl 解释器会根据上下文来决定变量的类型。实例如下：
```perl
#!/usr/bin/perl
 
@names = ('google', 'runoob', 'taobao');
 
@copy = @names;   # 复制数组
$size = @names;   # 数组赋值给标量，返回数组元素个数
 
print "名字为 : @copy\n";
print "名字数为 : $size\n";
```

代码中 @names 是一个数组，它应用在了两个不同的上下文中。
第一个将其复制给另外一个数组，所以它输出了数组的所有元素。第二个我们将数组赋值给一个标量，它返回了数组的元素个数。

**以下列出了多种不同的上下文：**

序号|上下文及描述
-|-
1|标量 − 赋值给一个标量变量，在标量上下文的右侧计算
2|列表 − 赋值给一个数组或哈希，在列表上下文的右侧计算。
3|布尔 − 布尔上下文是一个简单的表达式计算，查看是否为 true 或 false。
4|Void − 这种上下文不需要关系返回什么值，一般不需要返回值。
5|插值 − 这种上下文只发生在引号内。


## Perl 标量
标量可以是一个整数，浮点数，字符，字符串，段落或者一个完整的网页。

### 数字标量
```perl
#!/usr/bin/perl
 
$integer = 200;
$negative = -300;
$floating = 200.340;
$bigfloat = -1.2E-23;
 
# 八进制 377 , 十进制为 255 
$octal = 0377;
 
# 十六进制 FF, 十进制为 255 
$hexa = 0xff;
 
print "integer = $integer\n";
print "negative = $negative\n";
print "floating = $floating\n";
print "bigfloat = $bigfloat\n";
print "octal = $octal\n";
print "hexa = $hexa\n";
```
### 字符串标量
以下实例演示了不同类型的字符串标量的使用，注意单引号和双引号的使用区别：
```perl
#!/usr/bin/perl
 
$var = "字符串标量 - 菜鸟教程!";
$quote = '我在单引号内 - $var';
$double = "我在双引号内 - $var";
 
$escape = "转义字符使用 -\tHello, World!";
 
print "var = $var\n";
print "quote = $quote\n";
print "double = $double\n";
print "escape = $escape\n";
```
### 标量运算
以下实例演示了标量的简单运算：
```perl
#!/usr/bin/perl
 
$str = "hello" . "world";       # 字符串连接
$num = 5 + 10;                  # 两数相加
$mul = 4 * 5;                   # 两数相乘
$mix = $str . $num;             # 连接字符串和数字
 
print "str = $str\n";
print "num = $num\n";
print "mix = $mix\n";
```

### 多行字符串
我们可以使用单/双引号来输出多行字符串，如下所示：
```perl
#!/usr/bin/perl
 
$string = "
菜鸟教程
    —— 学的不仅是技术，更是梦想！
";
 
print "$string\n";
```
**使用 "here" document 的语法格式来输出多行**
```perl
#!/usr/bin/perl
 
print <<EOF;
菜鸟教程
    —— 学的不仅是技术，更是梦想！
EOF
```
### 特殊字符
文件名，行号，包名。

这些特殊字符是单独的标记，不能写在字符串中，例如：
```perl
#!/usr/bin/perl
 
print "文件名 ". __FILE__ . "\n";
print "行号 " . __LINE__ ."\n";
print "包名 " . __PACKAGE__ ."\n";
 
# 无法解析
print "__FILE__ __LINE__ __PACKAGE__\n";
```
### v字符串
一个以 v 开头,后面跟着一个或多个用句点分隔的整数,会被当作一个字串文本。
```perl
#!/usr/bin/perl
 
$smile  = v9786;
$foo    = v102.111.111;
$martin = v77.97.114.116.105.110; 
 
print "smile = $smile\n";
print "foo = $foo\n";
print "martin = $martin\n";
```


## 数组的使用

Perl 数组一个是存储标量值的列表变量，变量可以是不同类型。
```perl
#!/usr/bin/perl
 
@hits = (25, 30, 40);             
@names = (21, "runoob", "taobao");
 
print "\$hits[0] = $hits[0]\n";
print "\$hits[1] = $hits[1]\n";
print "\$hits[2] = $hits[2]\n";
print "\$names[0] = $names[0]\n";
print "\$names[1] = $names[1]\n";
print "\$names[2] = $names[2]\n";
```

### 创建数组
数组变量以 @ 符号开始，元素放在括号内，也可以以 qw 开始定义数组。

@array = (1, 2, 'Hello');
@array = qw/这是 一个 数组/;
第二个数组使用 qw// 运算符，它返回字符串列表，数组元素以空格分隔。当然也可以使用多行来定义数组：

@days = qw/google
taobao
...
runoob/;
你也可以按索引来给数组赋值，如下所示：

$array[0] = 'Monday';
...
$array[6] = 'Sunday';
访问数组元素
访问数组元素使用 $ + 变量名称 + [索引值] 格式来读取，实例如下：
```perl
@sites = qw/google taobao runoob/;
 
print "$sites[0]\n";
print "$sites[1]\n";
print "$sites[2]\n";
print "$sites[-2]\n";    # 负数，反向读取
```

### 数组序列号
Perl 提供了可以按序列输出的数组形式，格式为 起始值 + .. + 结束值，实例如下：
```perl
#!/usr/bin/perl
 
@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);
 
print "@var_10\n";   # 输出 1 到 10
print "@var_20\n";   # 输出 10 到 20
print "@var_abc\n";  # 输出 a 到 z
```
### 数组大小

scalar()函数
scalar就是标量的意思，也就是转化为标量类型。
$n = scalar(@array);

数组长度返回的是数组物理大小，而不是元素的个数
```perl
#!/usr/bin/perl
 
@array = (1,2,3);
$array[50] = 4;
 
$size = @array;
$max_index = $#array;
 
print "数组大小:  $size\n";
print "最大索引: $max_index\n";
```
### 添加和删除数组元素

下表列出了数组中常用的操作函数：
函数                 | 描述
:-                   | :-
push	@ARRAY, LIST | 将列表的值放到数组的末尾
pop		@ARRAY       | 弹出数组最后一个值，并返回它
shift	@ARRAY       | 弹出数组第一个值，并返回它。数组的索引值也依次减一。
unshift	@ARRAY, LIST | 将列表放在数组前面，并返回新数组的元素个数。

```perl
#!/usr/bin/perl
 
# 创建一个简单是数组
@sites = ("google","runoob","taobao");
print "1. \@sites  = @sites\n";
 
# 在数组结尾添加一个元素
push(@sites, "baidu");
print "2. \@sites  = @sites\n";
 
# 在数组开头添加一个元素
unshift(@sites, "weibo");
print "3. \@sites  = @sites\n";
 
# 删除数组末尾的元素
pop(@sites);
print "4. \@sites  = @sites\n";
 
# 移除数组开头的元素
shift(@sites);
print "5. \@sites  = @sites\n";
```


### 切割数组
我们可以切割一个数组，并返回切割后的新数组：
```perl
#!/usr/bin/perl
 
@sites = qw/google taobao runoob weibo qq facebook 网易/;
 
@sites2 = @sites[3,4,5];
print "@sites2\n";
```

如果是连续的索引，可以使用 .. 来表示指定范围：
```perl
#!/usr/bin/perl
 
@sites = qw/google taobao runoob weibo qq facebook 网易/;
 
@sites2 = @sites[3..5];
 
print "@sites2\n";
```
### 替换数组元素

splice @ARRAY, OFFSET [ , LENGTH [ , LIST ] ]
参数说明：

@ARRAY：要替换的数组。
OFFSET：起始位置。
LENGTH：替换的元素个数。
LIST：替换元素列表。
以下实例从第6个元素开始替换数组中的5个元素:
```perl
#!/usr/bin/perl
 
@nums = (1..20);
print "替换前 - @nums\n";
 
splice(@nums, 5, 5, 21..25); 
print "替换后 - @nums\n";
# 执行以上程序，输出结果为：

# 替换前 - 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
# 替换后 - 1 2 3 4 5 21 22 23 24 25 11 12 13 14 15 16 17 18 19 20
```
### 将字符串转换为数组

split [ PATTERN [ , EXPR [ , LIMIT ] ] ]
参数说明：

PATTERN：分隔符，默认为空格。
EXPR：指定字符串数。
LIMIT：如果指定该参数，则返回该数组的元素个数。
```perl
#!/usr/bin/perl
 
# 定义字符串
$var_test = "runoob";
$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";
 
# 字符串转为数组
@test = split('', $var_test);
@string = split('-', $var_string);
@names  = split(',', $var_names);
 
print "$test[3]\n";  # 输出 o
print "$string[2]\n";  # 输出 com
print "$names[3]\n";   # 输出 weibo
```
### 将数组转换为字符串

join EXPR, LIST
参数说明：

EXPR：连接符。
LIST：列表或数组。
```perl
#!/usr/bin/perl
 
# 定义字符串
$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";
 
# 字符串转为数组
@string = split('-', $var_string);
@names  = split(',', $var_names);
 
 
# 数组转为字符串
$string1 = join( '-', @string );
$string2 = join( ',', @names );
 
print "$string1\n";
print "$string2\n";
```
### 数组排序

sort [ SUBROUTINE ] LIST
参数说明：

SUBROUTINE：指定规则。
LIST：列表或数组。
```perl
#!/usr/bin/perl
 
# 定义数组
@sites = qw(google taobao runoob facebook);
print "排序前: @sites\n";
 
# 对数组进行排序
@sites = sort(@sites);
print "排序后: @sites\n";
```
注意：数组排序是根据 ASCII 数字值来排序。所以我们在对数组进行排序时最好先将每个元素转换为小写后再排序。

### 特殊变量： $[

特殊变量 $[ 表示数组的第一索引值，一般都为 0 ，如果我们将 $[ 设置为 1，则数组的第一个索引值即为 1，第二个为 2，以此类推。实例如下：
```perl
#!/usr/bin/perl
 
# 定义数组
@sites = qw(google taobao runoob facebook);
print "网站: @sites\n";
 
# 设置数组的第一个索引为 1
$[ = 1;
 
print "\@sites[1]: $sites[1]\n";
print "\@sites[2]: $sites[2]\n";
```

### 合并数组
数组的元素是以逗号来分割，我们也可以使用逗号来合并数组，如下所示：

```perl
#!/usr/bin/perl
 
@numbers = (1,3,(4,5,6));
 
print "numbers = @numbers\n";
 
@odd = (1,3,5);
@even = (2, 4, 6);
 
@numbers = (@odd, @even);
 
print "numbers = @numbers\n";
```
### 从列表中选择元素
一个列表可以当作一个数组使用，在列表后指定索引值可以读取指定的元素，如下所示：
```perl
#!/usr/bin/perl
 
$var = (5,4,3,2,1)[4];
print "var 的值为 = $var\n";
 
@list = (5,4,3,2,1)[1..3];
print "list 的值 = @list\n";
```



## 哈希的使用

哈希是 key/value 对的集合。

```perl
%data = ('google', 'google.com', 'runoob', 'runoob.com', 'taobao', 'taobao.com');
print "\$data{'google'} = $data{'google'}\n";

"创建哈希的四种方式";
"一、为每个 key 设置 value";
$data{'google'} = 'google.com';
"二、通过列表设置";
"列表中第一个元素为 key，第二个为 value。";
%data = ('google', 'google.com', 'runoob', 'runoob.com', 'taobao', 'taobao.com');
"三、也可以使用 => 符号来设置 key/value:";
%data = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com');
"四、使用 - 来代替引号：";
%data = (-google=>'google.com', -runoob=>'runoob.com', -taobao=>'taobao.com');
"使用这种方式 key 不能出现空格，读取元素方式为：";
$val = $data{-google}
```
```perl
%data = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com');
"提取哈希值";
@array = @data{'taobao', 'runoob'};
print "Array : @array\n";
"读取所有key";
@names = keys %data;
print "$names[0]\n";
print "$names[1]\n";
print "$names[2]\n";
"读取所有value";
@urls = values %data;
print "$urls[2]\n";
"获取哈希大小";
"我们可以通过先获取 key 或 value 的所有元素数组，再计算数组元素多少来获取哈希的大小";
@keys = keys %data;
$size = @keys;
print "哈希大小: $size\n";
"添加 key/value 对";
$data{'facebook'} = 'facebook.com';
"删除哈希中的元素";
delete $data{'taobao'};

"检测元素是否存在";
"如果你在哈希中读取不存在的 key/value 对 ，会返回 undefined 值，且在执行时会有警告提醒。";
if( exists($data{'youtube'} ) ){
   print "youtube 的网址为 $data{'youtube'} \n";
}
else
{
   print "youtube 不存在\n";
}
```


## 条件表达式

**注意，数字 0, 字符串 '0' 、 "" , 空 list () , 和 undef 为 false ，其他值均为 true**
```perl
if elsif else
unless elsif else
switch
```

## 循环语句

```perl
while (true时执行)
until (false时执行)
do while
for
foreach
```

```perl
# 执行 for 循环
for( $a = 0; $a < 10; $a = $a + 1 ){
    print "a 的值为: $a\n";
}
```
**foreach 循环用于迭代一个列表或集合变量的值。**
```perl
@list = (2, 12, 36, 42, 51);
# 执行foreach 循环
foreach $a (@list){
    print "a 的值为: $a\n";
}
```


## 运算符

### 常规运算符
列举与c的不同
```perl
**(乘幂)
"数值比较"
<=>	检查两个操作数的值是否相等, 如果左边的数小于右边的数返回 -1，如果相等返回 0, 如果左边的数大于右边的数返回 1 。
"字符串比较"
lt gt le ge eq ne cmp
"运算赋值"
+= -= *= /= **=
"位运算"
& | ^异或 ~取反 << >>
"逻辑"
&& || ! and or not 
```


### 引号运算
Perl 引号运算符如下表所示。

运算符 | 描述               | 实例
:-     | :-                 | :-
q{ }   | 为字符串添加单引号 | q{abcd} 结果为 'abcd'
qq{ }  | 为字符串添加双引号 | qq{abcd} 结果为 "abcd"
qx{ }  | 为字符串添加反引号 | qx{abcd} 结果为 `abcd`

```perl
#!/usr/bin/perl
 
$a = 10;
 
$b = q{a = $a};
print "q{a = \$a} = $b\n";
 
$b = qq{a = $a};
print "qq{a = \$a} = $b\n";
 
# 使用 unix 的 date 命令执行
$t = qx{date};
print "qx{date} = $t\n";
```
```perl
#以上程序执行输出结果为：
q{a = $a} = a = $a
qq{a = $a} = a = 10
qx{date} = 2016年 6月10日 星期五 16时22分33秒 CST
```

其他运算符

运算符 | 描述                           | 实例
:-     | :-                             | :-
.      | 点号 (.) 用于连接两个字符串。  | 如果 $a="run", $b="oob" ， $a.$b 结果为 "runoob"
x      | 字母x 运算符返回字符串重复的次数。 | ('-' x 3) 输出为 ---。
..     | .. 为范围运算符。              | (2..5) 输出结果为 (2, 3, 4, 5)
++     | 自增运算符，整数值增加 1       | $a =10, $a++ will 输出为 11
--     | 自减运算符，整数值减少 1       | $a =10, $a-- 输出为 9
->     | 箭号用于指定一个类的方法       | $obj->$a 表示对象 $obj 的 $a 方法。

```perl
#!/usr/bin/perl
 
$a = "run";
$b = "oob";
 
print "\$a  = $a ， \$b = $b\n";
 
$c = $a . $b;
print "\$a . \$b = $c\n";
 
$c = "-" x 3;
print "\"-\" x 3 = $c\n";
 
@c = (2..5);
print "(2..5) = @c\n";
 
$a = 10;
$b = 15;
print "\$a  = $a ， \$b = $b\n";
 
$a++;
$c = $a ;
print "\$a 执行 \$a++ = $c\n";
 
$b--;
$c = $b ;
print "\$b 执行 \$b-- = $c\n";
```



## 函数

### 向子程序传递参数
```perl
# 定义求平均值函数
sub Average{
   # 获取所有传入的参数
   $n = scalar(@_);
   $sum = 0;
 
   foreach $item (@_){
      $sum += $item;
   }
   $average = $sum / $n;
   print '传入的参数为 : ',"@_\n";           # 打印整个数组
   print "第一个参数值为 : $_[0]\n";         # 打印第一个参数
   print "传入参数的平均值为 : $average\n";  # 打印平均值
}
 
# 调用函数
Average(10, 20, 30);
```


### 向子程序传递哈希

```perl
#当向子程序传递哈希表时，它将复制到 @_ 中，哈希表将被展开为键/值组合的列表。
#!/usr/bin/perl
 
# 方法定义
sub PrintHash{
   my (%hash) = @_;
 
   foreach my $key ( keys %hash ){
      my $value = $hash{$key};
      print "$key : $value\n";
   }
}
%hash = ('name' => 'runoob', 'age' => 3);
 
# 传递哈希
PrintHash(%hash);
```


**如果没有使用 return 语句，则子程序的最后一行语句将作为返回值。**

### 私有变量my
当前模块有效，子模块无法访问

### 临时变量local
在当前模块和子模块均有效

my和local均会屏蔽同名的外部变量。

```perl
#!/usr/bin/perl
 
# 全局变量
$string = "Hello, World!";
 
sub PrintRunoob{
   # PrintHello 函数私有变量
   local $string;
   $string = "Hello, Runoob!";
   # 子程序调用的子程序
   PrintMe();
   print "PrintRunoob 函数内字符串值：$string\n";
}
sub PrintMe{
   print "PrintMe 函数内字符串值：$string\n";
}
 
sub PrintHello{
   print "PrintHello 函数内字符串值：$string\n";
}
 
# 函数调用
PrintRunoob();
PrintHello();
print "函数外部字符串值：$string\n";

```



## 引用

引用就是指针，Perl 引用是一个标量类型可以指向变量、数组、哈希表（也叫关联数组）甚至子程序，可以应用在程序的任何地方。

### 创建引用

#### 变量引用

**定义变量的时候，在变量名前面加个\，就得到了这个变量的一个引用，比如:**
```perl
$scalarref = \$foo;     # 标量变量引用
$arrayref  = \@ARGV;    # 列表的引用
$hashref   = \%ENV;     # 哈希的引用
$coderef   = \&handler; # 子过程引用
$globref   = \*foo;     # GLOB句柄引用
```
#### 匿名数组、哈希、子程序引用
```perl
"匿名数组引用，使用 [] 定义";
$aref= [ 1,"foo",undef,13 ];
"匿名数组的元素仍然可以是匿名数组，所以我们可以用这种方法构造数组的数组，可以构造任意维度的数组";
my $aref = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
];
# TODO:: How to use this special array?
print "value:",@$aref[0];
"匿名哈希引用，使用 {} 定义";
$href= { APR =>4, AUG =>8 };
"匿名子程序引用，使用 {} 定义";
$coderef = sub { print "Runoob!\n" };
```

### 取消引用
取消引用可以根据不同的类型使用 $, @ 或 % 来取消，实例如下：

```perl
#!/usr/bin/perl
 
$var = 10;
 
# $r 引用 $var 标量
$r = \$var;
 
# 输出本地存储的 $r 的变量值
print "$var 为 : ", $$r, "\n";
 
@var = ("1s", 2, 3);
# $r 引用  @var 数组
$r = \@var;
# 输出本地存储的 $r 的变量值
print "@var 为: ",  @$r[0], "\n";
 
%var = ('key1' => 10, 'key2' => 20);
# $r 引用  %var 数组
$r = \%var;
# 输出本地存储的 $r 的变量值
print "\%var 为 : ", %$r, "\n";
```

### 获取引用变量类型,使用ref函数, 无效的话返回空字串

返回值 | 谁的引用
:-     | :-
SCALAR | 标量的
ARRAY  | 数组的
HASH   | 哈希的
CODE   | 函数的
GLOB   | 句柄的
REF    | 引用变量的
```perl
#!/usr/bin/perl
sub Hello(){
	print "Hello China!";
}
$r = \&Hello;
print "r 的引用类型 : ", ref($r), "\n";
 
$r = sub{
	print "hello China!!";
};"此处为变量的赋值，一定要有分号结尾";
print "r 的引用类型 : ", ref($r), "\n";

$var = 10;
$r = \$var;
print "r 的引用类型 : ", ref($r), "\n";
 
@var = (1, 2, 3);
$r = \@var;
print "r 的引用类型 : ", ref($r), "\n";
 
%var = ('key1' => 10, 'key2' => 20);
$r = \%var;
print "r 的引用类型 : ", ref($r), "\n";
```

### 循环引用
循环引用在两个引用相互包含时出现。你需要小心使用，不然会导致内存泄露，如下实例：
```perl
#!/usr/bin/perl
 
my $foo = 100;
$foo = \$foo;
 
print "Value of foo is : ", $$foo, "\n";
```
```perl
执行以上实例执行结果为：
Value of foo is : REF(0x9aae38)
```

### 引用函数

函数引用格式: \&
调用引用函数格式: & + 创建的引用名。
```perl
# 函数定义
sub PrintHash{
   my (%hash) = @_;
   
   foreach $item (%hash){
      print "元素 : $item\n";
   }
}
%hash = ('name' => 'runoob', 'age' => 3);
 
# 创建函数的引用
$cref = \&PrintHash;
 
# 使用引用调用函数
&$cref(%hash);
```


