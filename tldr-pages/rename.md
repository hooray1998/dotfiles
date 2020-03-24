# rename 批量修改文件名 

rename [options] "s/oldname/newname/" file

1. 原字符串oldname：将要被替换的字符串；
2. 目标字符串newname：原字符替换成的目标字符串；
3. 文件file：指定要改变文件名的文件列表。
4. options 部分
	- -v 将重命名的内容都打印到标准输出，v 可以看成 verbose
	- -n 测试会重命名的内容，将结果都打印，但是并不真正执行重命名的过程
	- -f force 会覆盖本地已经存在的文件
	- -h -m -V 分别为帮助，帮助，版本
	- -e 比较复杂，可以通过该选项，写一些脚本来做一些复杂的事情


### 例子
- 替换文件名中特定字段
`rename "s/AA/aa/" *  # 把文件名中的AA替换成aa`

- 修改文件后缀
`rename "s/.html/.php/" *     # 把.html 后缀的改成 .php后缀`

- 批量添加文件后缀
`rename "s/$/.txt/" *     # 把所有的文件名都以txt结尾,$表示的就是结尾`

- 批量删除文件名
`rename "s/.txt//" *      # 把所有以.txt结尾的文件名的.txt删掉`

- 部分保留,使用（）和\1等等
`rename -n "s/Screenshot([0-9\\- ]+).jpg/\1.jpg/" *  # 将 () 匹配的内容取出来放到替换部分。`

