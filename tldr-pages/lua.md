# LUA

## LUA基本语法

```lua
--单行注释
--[[
多行注释
多行注释
--]]
print("hello lua")
```

#### 关键词

以下列出了 Lua 的保留关键字。保留关键字不能作为常量或变量或其他用户自定义标示符：

```lua
and break do else
elseif end false for
function if in local
nil not or repeat
return then true until
while 
```

#### 变量生存期特性

1. 默认都是全局变量
2. 使用之前不需要声明
3. 变量不存在 <=> 其值为nil
4. 所以赋值为nil代表删除该变量

### 8个基本类型

#### 1. nil

赋值为nil代表删除，对于table中的值也一样

#### 2. boolean

条件判断时 只有nil和false为假，其他都为真。（例如空字符串和0也为真，和其他语言不同）

#### 3. number

均为双精度浮点数double，该类型可以在luaconf.h中修改

```lua
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))
```

#### 4. string

1. 单引号和双引号均可，[[]]表示多行字符串
2. 连接用..
3. 变量前加#号求长度
4. 可以直接加减乘除运算，会自动转化为数字类型，不成功会报错

#### 5. table

1. 索引可以为数字或字符串，数字从1开始
2. 使用 构造表达式 来创建
3. 使用tab[1]/tab.key1/tab["key1"]三种方式访问

```lua
-- table_test.lua 脚本文件

a = {"one", "two",key1='value1'}
a["key2"] = "value2"
a[10] = 100
a[2] = nil

print(a.key2)

for k, v in pairs(a) do
    print(k .. " : " .. v)
end

```

#### 6. function

函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里:

```lua
-- function_test.lua 脚本文件
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))
```

**function 可以以匿名函数（anonymous function）的方式通过参数传递:**

```lua
-- function_test2.lua 脚本文件
function anonymous(tab, fun)
    for k, v in pairs(tab) do
        print(fun(k, v))
    end
end
tab = { key1 = "val1", key2 = "val2" }
anonymous(tab, function(key, val)
    return key .. " = " .. val
end)
```

#### 7. thread

在 Lua 里，最主要的线程是协同程序（coroutine）。它跟线程（thread）差不多，拥有自己独立的栈、局部变量和指令指针，可以跟其他协同程序共享全局变量和其他大部分东西。

线程跟协程的区别：线程可以同时多个运行，而协程任意时刻只能运行一个，并且处于运行状态的协程只有被挂起（suspend）时才会暂停。

#### 8. userdata

userdata 是一种用户自定义数据，用于表示一种由应用程序或 C/C++ 语言库所创建的类型，可以将任意 C/C++ 的任意数据类型的数据（通常是 struct 和 指针）存储到 Lua 变量中调用。

## LUA 变量

1. 默认均为全局变量，除非local声明，或函数参数
2. 局部变量生命周期到语句块结束(或下一个同名局部变量的声明)

```lua
function f()
 a = 1       -- 全局变量
 local b = 1 -- 局部变量
 print(a,b)
 local a,b   -- 全局变量a被覆盖，上一个局部变量b生命期结束
 print(a,b)
end
f()
print(a,b)
```

## LUA 循环

**有break，没有continue**

#### while

```lua
a=10
while( a < 15 )
do
   print("a 的值为:", a)
   a = a+1
end
```

#### 数值for循环 *范围是闭区间*

```lua
for var=1,7,2 do  
 print(var)
end  
```

#### 泛型for循环

```lua
--打印数组a的所有值  
days = {"Suanday",key="value","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}  
for i,v in ipairs(days)
do
 print(i,v)
end
```

#### repeat until

```lua
--[ 变量定义 --]
a = 10
--[ 执行循环 --]
repeat
   print("a的值为:", a)
   a = a + 1
until( a > 15 )
```

## LUA 条件判断

```lua
a = 100
if( a == 10 ) then
   print("a 的值为 10" )
elseif( a == 20 ) then
   print("a 的值为 20" )
else
   print("没有匹配 a 的值" )
end
print("a 的真实值为: ", a )

```

## LUA 函数

1. **可声明是不是局部local函数**
2. 函数可作为参数，可赋值给变量
3. 可返回多个值
4. 可传入可变参数
5. 如果某函数期待的参数是整型，收到的字符串会转化为整型。反之同理

```lua
--[[ 函数返回两个值的最大值 --]]
sum = function (...)
 local arg = {...}
 result = 0
 for i,v in ipairs(arg) do
  result = result + v
 end
   return result, #arg
end

local function myPrint(func, ...)
 print(func(...))
end
-- 调用函数
myPrint(sum, 1,2,3)
```

**ipairs 对比 pairs**

1. ipairs只遍历从1开始连续的数字索引，直到遇到nil(负值或者跳跃的不会遍历)
2. pairs 数字索引和键值对都会遍历。

## LUA 运算符

1. 算数运算符
 - `+ - * / % ^乘幂`
2. 关系运算符
 - `== ~= > >= < <=`
3. 逻辑运算符
 - `and or not`
4. 其他运算符
 - `.. #`

## LUA 字符串

表示：单引号，双引号或`[[    ]]`

查找时索引也是从1开始

内置函数

```lua
local tb = {}
str = 'Lua'
tb['大写'] = string.upper(str)
tb['小写'] = string.lower(str)
tb['反转'] = string.reverse(str)
tb['长度'] = string.len(str) + #str
tb['3个拷贝'] = string.rep(str,3)
tb['格式化'] = string.format("#%08.3f %-8s#",5.2,"itt")
tb['替换'] = string.gsub("aaaaa",'a','itt ',3)
tb['查找,end感觉没啥用'] = string.find("Lua Lua Lua",'L',2,1)
tb['整型转化为字符，连起来'] = string.char(66,67,68)
tb['第k个字符转整型'] = string.byte('ABC','2')

for k,v in pairs(tb) do
 print(k,v)
end
```

## LUA 数组

索引默认从1开始，但可自定义

### 一维数组

```lua
array = {"Lua", "Tutorial"}

for i= 0, 2 do
   print(array[i])
end

array[20] = "Test"
array[-2] = "Test"

for i,v in pairs(array) do
 print(i,v)
end

```

### 多维数组

```lua
-- 初始化数组
array = {}
for i=1,3 do
   array[i] = {}
      for j=1,3 do
         array[i][j] = i*j
      end
end
```

## Lua 迭代器

迭代器（iterator）是一种对象，它能够用来遍历标准模板库容器中的部分或全部元素，每个迭代器对象代表容器中的确定的地址

在Lua中迭代器是一种支持指针类型的结构，它可以遍历集合的每一个元素。

泛型 for 迭代器
泛型 for 在自己内部保存迭代函数，实际上它保存三个值：迭代函数、状态常量、控制变量。

泛型 for 迭代器提供了集合的 key/value 对，语法格式如下：

```lua
for k, v in pairs(t) do
    print(k, v)
end
```

上面代码中，k, v为变量列表；pairs(t)为表达式列表。

查看以下实例:

```lua
array = {"Lua", "Tutorial"}

for key,value in ipairs(array)
do
   print(key, value)
end
```

以上实例中我们使用了 Lua 默认提供的迭代函数 ipairs。

下面我们看看范性for的执行过程：

首先，初始化，计算in后面表达式的值，表达式应该返回范性for需要的三个值：迭代函数、状态常量、控制变量；与多值赋值一样，如果表达式返回的结果个数不足三个会自动用nil补足，多出部分会被忽略。
第二，将状态常量和控制变量作为参数调用迭代函数（注意：对于for结构来说，状态常量没有用处，仅仅在初始化时获取他的值并传递给迭代函数）。
第三，将迭代函数返回的值赋给变量列表。
第四，如果返回的第一个值为nil循环结束，否则执行循环体。
第五，回到第二步再次调用迭代函数
。在Lua中我们常常使用函数来描述迭代器，每次调用该函数就返回集合的下一个元素。Lua 的迭代器包含以下两种类型：

无状态的迭代器
多状态的迭代器
无状态的迭代器
无状态的迭代器是指不保留任何状态的迭代器，因此在循环中我们可以利用无状态迭代器避免创建闭包花费额外的代价。

每一次迭代，迭代函数都是用两个变量（状态常量和控制变量）的值作为参数被调用，一个无状态的迭代器只利用这两个值可以获取下一个元素。

这种无状态迭代器的典型的简单的例子是ipairs，他遍历数组的每一个元素。

以下实例我们使用了一个简单的函数来实现迭代器，实现 数字 n 的平方：

```lua
function square(iteratorMaxCount,currentNumber)
   if currentNumber<iteratorMaxCount
   then
      currentNumber = currentNumber+1
   return currentNumber, currentNumber*currentNumber
   end
end

for i,n in square,3,0
do
   print(i,n)
end
```

迭代的状态包括被遍历的表（循环过程中不会改变的状态常量）和当前的索引下标（控制变量），ipairs和迭代函数都很简单，我们在Lua中可以这样实现：

```lua
function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
       return i, v
    end
end

function ipairs (a)
    return iter, a, 0
end
```

当Lua调用ipairs(a)开始循环时，他获取三个值：迭代函数iter、状态常量a、控制变量初始值0；然后Lua调用iter(a,0)返回1,a[1]（除非a[1]=nil）；第二次迭代调用iter(a,1)返回2,a[2]……直到第一个nil元素。

多状态的迭代器
很多情况下，迭代器需要保存多个状态信息而不是简单的状态常量和控制变量，最简单的方法是使用闭包，还有一种方法就是将所有的状态信息封装到table内，将table作为迭代器的状态常量，因为这种情况下可以将所有的信息存放在table内，所以迭代函数通常不需要第二个参数。

以下实例我们创建了自己的迭代器：

```lua
array = {"Lua", "Tutorial"}

function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 1
      if index <= count
      then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end

for element in elementIterator(array)
do
   print(element)
end
```

以上实例中我们可以看到，elementIterator 内使用了闭包函数，实现计算集合大小并输出各个元素。

