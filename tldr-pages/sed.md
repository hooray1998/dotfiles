# sed
> Edit text in a scriptable manner
- **Replace the first occurrence of a regular expression in each line of a file, and print the result:**
sed 's/`regex`/`replace`/' `filename`
- **Replace all occurrences of an extended regular expression in a file, and print the result:**
sed -r 's/`regex`/`replace`/g' `filename`
- **Replace all occurrences of a string in a file, overwriting the file (i.e. in-place):**
sed -i 's/`find`/`replace`/g' `filename`
- **Replace only on lines matching the line pattern:**
sed '/`line_pattern`/s/`find`/`replace`/' `filename`
- **Delete lines matching the line pattern:**
sed '/`line_pattern`/d' `filename`
- **Print only text between n-th line till the next empty line:**
sed -n '`n`,/^\$/p' `filename`
- **Apply multiple find-replace expressions to a file:**
sed -e 's/`find`/`replace`/' -e 's/`find`/`replace`/' `filename`
- **Replace separator / by any other character not used in the find or replace patterns, e.g., #:**
sed 's#`find`#`replace`#' `filename`
- **Print only the n-th line of a file:**
sed '`n`q;d' `filename`
- 每行行首添加字符
sed 's/^/xxx/'  filename
- 匹配的行cut掉并替换为新的字符串
sed '/pattern/c\newline'  filename
- 匹配的行cut掉并替换为新的字符串并追加行尾
sed '/pattern/c\ `newline`\a`end`'  filename
- 匹配的行cut掉并替换为新的字符串并追加新行
sed '/pattern/c\ `newline`\n`another line`'  filename

# sed 流编辑

- -e&lt;script>或--expression=&lt;script>：以选项中的指定的script来处理输入的文本文件；
- -f&lt;script文件>或--file=&lt;script文件>：以选项中指定的script文件来处理输入的文本文件；
- -n或--quiet或——silent：仅显示script处理后的结果；
- -e选项允许在同一行里执行多条命令：
 
 
## expression示例
删除
> 'd'
> '5d'
> '1,$d'
> '/<html>/,/<\/html>/d'
> '/^#/d'
 
替换
> sed -n 's/test/TEST/p' filename
全面替换
> sed -n 's/test/TEST/g' filename
  sed -n 's/test/TEST/3g' filename //从每行第二处开始
更换定界符
> sed 's:test:TEST:g'
&表示已匹配的字符串
> sed 's/\w\+/[&]/g' filename //每个单词都加个中括号
 
 
组合多个表达式
> sed '表达式' | sed '表达式'
等价于：
> sed '表达式; 表达式'
 
引用
> test=hello
> echo hello WORLD | sed "s/$test/HELLO"
> HELLO WORLD
 
 
a\追加
> sed '/^test/a\this is a test line' file
将 this is a test line 追加到 以test 开头的行后面：
 
打印奇数行或偶数行
> sed -n 'p;n' test.txt  #奇数行
> sed -n 'n;p' test.txt  #偶数行
