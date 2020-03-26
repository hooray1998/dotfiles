# fzf
> Command line fuzzy finder
> More information: <https://github.com/junegunn/fzf>
- **Start finder on all files from arbitrary locations:**
find `path/to/search` -type f | fzf
- **Start finder on running processes:**
ps aux | fzf
- **Select multiple files with Shift + Tab and write to a file:**
find `path/to/search_files` -type f | fzf -m > `filename`
- **Start finder with a given query:**
fzf -q "`query`"
- **Start finder on entries that start with core and end with either go, rb, or py:**
fzf -q "^core go\$ | rb\$ | py\$"
- **Start finder on entries that not match pyc and match exactly travis:**
fzf -q "!pyc 'travis"
- **一个例子**
`filename=$(awk -F, '{printf("%-10s%-s\n", $1 , $2)}' test.list|fzf  --nth 1 --reverse --inline-info --tac --height 40%)`
- **配合awk分割并对齐文本**
`awk -F, '{printf("%-10s%-s\n", $1 , $2)}'`
- **参数**
```
-n 1 / --nth 1          # 只搜索第一列,如果内容不止一列
--reverse               # 上方搜索
--inline-info           # 统计总行数和匹配行数
--height 40%            # 高度
-d','                   # 用,分割为多列
--header='请输入文件名' # 标题
--cycle                 # 循环选择
--preview 'ccat {}'     # 预览命令,{}代表当前行内容
```
