"作者：韦易笑
"链接：https://zhuanlan.zhihu.com/p/37352209
"来源：知乎
"著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

"变量let 命令用来对变量进行初始化或者赋值。unlet 命令用来删除一个变量。unlet! 命令同样可以用来删除变量，但是会忽略诸如变量不存在的错误提示。默认情况下，如果一个变量在函数体以外初始化的，那么它的作用域是全局变量；而如果它是在函数体以内初始化的，那它的作用于是局部变量。同时你可以通过变量名称前加冒号前缀明确的指明变量的作用域：g:var - 全局
a:var - 函数参数
l:var - 函数局部变量
b:var - buffer 局部变量
w:var - window 局部变量
t:var - tab 局部变量
s:var - 当前脚本内可见的局部变量
v:var - Vim 预定义的内部变量
"你可以通过 $name 的模式读取或者改写环境变量，同时可以用 &option 的方式来读写 vim 内部设置的值。数据类型Number：32 位有符号整数-123
0x10
0177
"Float: 浮点数，需要编译 Vim 的时候，有 +float 特性支持123.456
1.15e-6
-1.1e3
"String: NULL 结尾的 8位无符号字符串"ab\txx\"--"
'x-z''a,c'
"Funcref: 函数引用，函数引用类型的变量名必须以大写字母开头:let Myfunc = function("strlen")
:echo Myfunc('foobar') " Call strlen on 'foobar'.
6
"List: 有序列表:let mylist = [1, 2, ['a', 'b']]
:echo mylist[0]
"1
:echo mylist[2][0]
"a
:echo mylist[-2]
2
:echo mylist[999]
E684: list index out of range: 999
:echo get(mylist, 999, "THERE IS NO 1000th ELEMENT")
THERE IS NO 1000th ELEMENT
Dictionary: 无序的 Key/Value 容器:let mydict = {'blue': "#0000ff", 'foo': {999: "baz"}}
:echo mydict["blue"]
#0000ff
:echo mydict.foo
{999: "baz"}
:echo mydict.foo.999
baz
:let mydict.blue = "BLUE"
:echo mydict.blue
BLUE
没有布尔类型，整数 0 被当作假，其他被当作真。字符串在比较真假前会被转换成整数，大部分字符串都会被转化为 0，除非以非零开头的字符串才会转化成非零。（译注：可以调用 type(varname) 来取得变量的类型，最新版 Vim 8.1 中已经包含 Boolean 类型，并且有 v:true, v:false  两个值）VimScript 的变量属于动态弱类型。:echo 1 . "foo"
1foo
:echo 1 + "1"
2

:function! TrueFalse(arg)
:   return a:arg? "true" : "false"
:endfunction

:echo TrueFalse("foobar")
false
:echo TrueFalse("1000")
true
:echo TrueFalse("x1000")
false
:echo TrueFalse("1000x")
true
:echo TrueFalse("0")
false
字符串比较<string> == <string>: 字符串相等<string> != <string>: 字符串不等<string> =~ <pattern>: 匹配 pattern<string> !~ <pattern>: 不匹配 pattern<operator>#: 匹配大小写<operator>?: 不匹配大小写注意：设置选项 ignorecase 会影响 == 和 != 的默认比较结果，可以在比较符号添加 ? 或者 # 来明确指定大小写是否忽略。<string> . <string>: 字符串链接:function! TrueFalse(arg)
:   return a:arg? "true" : "false"
:endfunction

:echo TrueFalse("X start" =~ 'X$')
false
:echo TrueFalse("end X" =~ 'X$')
true
:echo TrueFalse("end x" =~# 'X$')
false
流程控制：If, For, While, and Try/Catch条件判断：if <expression>
    ...
elseif <expression>
    ...
else
    ...
endif
循环：for <var> in <list>
    continue
    break
endfor
复杂循环：for [var1, var2] in [[1, 2], [3, 4]]
    " on 1st loop, var1 = 1 and var2 = 2
    " on 2nd loop, var1 = 3 and var2 = 4
endfor
While 循环：while <expression>
endwhile
异常捕获：try
    ...
catch <pattern (optional)>
    " HIGHLY recommended to catch specific error.
finally
    ...
endtry
函数使用 function 关键字定义一个函数，使用 function! 覆盖一个函数的定义，函数和变量一样也有作用范围的约束。需要注意函数名必须以大写字母开头。function! <Name>(arg1, arg2, etc)
    <function body>
endfunction
delfunction <function> 删除一个函数call <function> 调用一个函数，函数调用前的 call 语句是必须的，除非在一个表达式里。例子：强制创建一个全局函数（使用感叹号），参数使用 ... 这种不定长的参数形式时，a:1 表示 ... 部分的第一个参数，a:2 表示第二个，如此类推，a:0 用来表示 ... 部分共有多少参数。function! g:Foobar(arg1, arg2, ...)
    let first_argument = a:arg1
    let index = 1
    let variable_arg_1 = a:{index} " same as a:1
    return variable_arg_1
endfunction
有一种特殊的调用函数的方式，可以指明该函数作用的文本区域是从当前缓冲区的第几行到第几行，按照 “1,3call Foobar() ”的格式调用一个函数的话，该函数会在当前文件的第一行到第三行每一行执行一遍，再这个例子中，该函数总共被执行了三次。如果你在函数声明的参数列表后添加一个 range 关键字，那函数就只会被调用一次，这时两个名为 `a:firstline` 和 `a:lastline` 的特殊变量可以用在该函数内部使用。例如：强制创建一个名为 RangeSize 的函数，用来显示被调用时候的文本范围：function! b:RangeSize() range
    echo a:lastline - a:firstline
endfunction
面向对象Vim 没有原生的类的支持，但是你可以用字典模拟基本的类。为了定义一个类的方法，可以在函数声明时使用 dict 关键字来将内部字典暴露为 self 关键字：let MyClass = {"foo": "Foo"}
function MyClass.printFoo() dict
    echo self.foo
endfunction
类的实现更类似于 singleton，为了在 VimScript 中创建类的实例，我们对字典使用 deepcopy() 方法进行拷贝（实例化）：:let myinstance = deepcopy(MyClass)
:call myinstance.printFoo()
Foo
:let myinstance.foo = "Bar"
:call myinstance.printFoo()
Bar
接下来做什么？现在既然你已经知道了大致原理，下面给你推荐一些好的资源。教程：Vim 中文帮助文档（usr_41） - 编写 Vim 脚本和 API 列表Vim 脚本指北Vim 脚本开发规范其他：知乎：Vim 专栏
