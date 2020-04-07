"=================================================================
"		Vim-plug 插件管理       
"=================================================================
set nocompatible              " 去除VI一致性,必须要添加
filetype on

call plug#begin('~/.vim/plugged')

" 工程文件浏览
Plug 'scrooloose/nerdtree'
" 增加缩进指示线 "
Plug 'Yggdroot/indentLine'
" 括号补全 "
Plug 'jiangmiao/auto-pairs'
Plug 'tell-k/vim-autopep8'
" 美化状态栏和标签页 "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Markdown syntastic highlight
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"monokai theme
Plug 'patstockwell/vim-monokai-tasty'
"超强的自动补全
"Plug 'Valloric/YouCompleteMe'
"打字机音效
"~~~~~~~~"Plug 'skywind3000/vim-keysound'

call plug#end()
"==================================================================

syntax on
set nu
set shiftwidth=4
"==================================================================
" 显示相关  
"==================================================================
set go=             " 不要图形按钮  
set guifont=Monaco:h26   " 设置字体  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set novisualbell    " 不要闪烁(不明白)  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  

"编码"
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"==================================================================
"	实用设置
"==================================================================

" 设置当文件被改动时自动载入
set autoread
"代码补全 
set completeopt=preview,menu 
" 设定补全行为"
set wildmode=full

"允许插件  
"通过% 实现XML标签的跳转"
set nocompatible
filetype plugin on
runtime macros/matchit.vim
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup
"自动保存
set autowrite
set ruler					" 显示状态栏标尺"
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 设置在状态行显示的信息
set foldenable              " 开始折叠
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldlevelstart=99

" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"F8开启和关闭树"
map <F8> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25


"缩进指示线"
"let g:indentLine_char='┆'
"let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

"let mapleader=','
map <F7> <leader>ci <CR>


"问题：怎样在vim中实现花括号引号自动补全，包括html标签？

"解决办法：只要把下面两段代码粘贴到~/.vimrc中，就可以实现括号超强补全

"<!--括号引号补全代码{{{-->
" 括号引号补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
else
	return a:char
endif
endf

function CloseBracket()
if match(getline(line('.') + 1), '\s*}') < 0
	return "\<CR>}"
else
	return "\<Esc>j0f}a"
endif
endf

function QuoteDelim(char)
let line = getline('.')
let col = col('.')
if line[col - 2] == "\\"
	"Inserting a quoted quotation mark into the string
	return a:char
elseif line[col - 1] == a:char
	"Escaping out of the string
	return "\<Right>"
else
	"Starting a string
	return a:char.a:char."\<Esc>i"
endif
endf
"airline options

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''   "''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline_powerline_fonts=1
set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"
set ambiwidth=double "防止特殊符号无法正常显示
let g:airline#extensions#tabline#enabled=1 "顶部tab显示
"let g:airline_theme='bubblegum'  "murmur配色也不错

"设置打字机音效
let g:keysound_enable = 0
"设置默认音效主题，可以选择：default, typewriter, mario, bubble, sword
let g:keysound_py_version = 3
let g:keysound_volume = 1000
let g:keysound_theme = 'typewriter'

"C-l 清除高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


" 重定义*, 使其那能够搜索选中文本
xnoremap * : <C-u> call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # : <C-u> call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
let @s = temp
endfunction



" 设置配色方案
set background=dark
"let g:vim_monokai_tasty_italic = 1 "加上这句后 注释会有底色，很丑"
colorscheme vim-monokai-tasty
let g:lightline = { 'colorscheme': 'monokai_tasty', }
let g:airline_theme='monokai_tasty'

" tasklist.vim  任务列表插件 <leader>t
let g:tlTokenList = ["FIXME",  "TODO", "QSTN", "HACK", "NOTE", "WARN", "MODIFY"]
"如果设置为1，则任务插件下次打开时会恢复到上次关闭时的位置. 默认是找到离光标当前行最近的标示符，可以如下更改:
let g:tlRememberPosition = 1


" 可是模式下f键翻译选中区域
vnoremap f y:!clear; tl "
nnoremap <C-f> yaw:!clear; tl "
inoremap <C-f> yaw:!clear; tl "

"=================================================================
"键盘命令
"=================================================================

"设置<leader>为空格键
let mapleader="\<Space>"

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>i :bd %<CR><CR>
"重映射"
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"H,L移动到行首行尾
map H ^
map L $
"可视模式下移动到行尾
vnoremap L $h

"保存文件
nnoremap <leader>w :w<CR>
nnoremap <leader>e :exit<CR>
"快捷复制粘贴至系统
nnoremap <C-A> ggVG"+y<CR>



"=================================================================
"	for TODO
"=================================================================

"追加该行到文件study

nnoremap <C-N> A ★0w
nnoremap <C-J> :.s/☐/✔/g<CR>w<C-L>
nnoremap <C-K> :.s/✔/☐/g<CR>w:nohlsearch<CR>
nnoremap <C-H> A<C-H><C-H>
nnoremap <Backspace> A<C-H><C-H>
nnoremap o o☐ 
inoremap <Enter> <Enter>☐ 
nnoremap u u:nohlsearch<CR>
inoremap <Tab> ma>>`ala
inoremap <S-Tab> ma<<`aa
nnoremap ]] /@<CR>:nohlsearch<CR>
nnoremap [[ ?@<CR>:nohlsearch<CR>

au BufRead,BufNewFile *.Todo set filetype=mytodo
