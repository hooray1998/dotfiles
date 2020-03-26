# snippet
iAwrb 为snippet的选项。

- i 表示片段可在句中被触发。默认是只有在前面有多个空格或者在行首时才会被触发。

- A 表示片段会被自动触发

- w 表示片段只会在关键词为单独单词的情况下被触发。若关键词为 mk, 那么只有在 html mk 时会被触发，htmlmk 不会被触发。

- r 表示关键词使用正则表达式。正则表达式必须用 两个引号' '包围。比如 \'([1-9])day\'。

- b 表示只有在一行的开头才会被触发。

Python 支持
使用 ultisnips 时最为方便的就是可以在片段中加入python脚本。用 `!p ` 包围脚本，并使用 snip.rv 返回计算结果。加入了python可以使得输入更加智能便捷，并实现一些骚操作。例如

# 在数学模式下自动加下标
context "math()"
snippet '([A-Za-z])(\d)' "auto subscript" wrA
`!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
endsnippet

自动加下标
[公式]



或者

# 根据用户输入新建一个Markdown格式的表格
snippet '(?<!\\)([0-9])([0-9])tb' "new table" r
$1`!p 
x=match.group(1)
y=match.group(2)
row1=""
row2="" 
for i in range(int(x)):
    row1+="| "
    row2+="|:-:"
row1+="|\n"
row2+="|\n"
out=row1+row2+int(y)*row1
snip.rv=out
`$0
endsnippet
