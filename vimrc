"=================================================================
"		Vim-plug 插件管理       
"=================================================================
set nocompatible              " 去除VI一致性,必须要添加
filetype on

call plug#begin('~/.vim/plugged')

""匹配的括号或标签同时修改"
Plug 'tpope/vim-surround'  
""find 可以递归查找文件"
Plug 'tpope/vim-rails'     
" 工程文件浏览
Plug 'scrooloose/nerdtree'
" 增加缩进指示线 "
Plug 'Yggdroot/indentLine'
" 括号补全 "
Plug 'jiangmiao/auto-pairs'
Plug 'tell-k/vim-autopep8'
" 快速代码注释
Plug 'scrooloose/nerdcommenter'
" tagbar, 显示函数 以及 变量情况
"Plug 'majutsushi/tagbar'
" 美化状态栏和标签页 "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 普通的python补全 "
Plug 'rkulla/pydiction'
" 写html利器
Plug 'mattn/emmet-vim'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Python and other languages code checker
"Plug 'vim-syntastic/syntastic'

" Markdown syntastic highlight
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Markdown realtime preview
" Before you want to use it, please run
" `sudo npm -g install instant-markdown-d`
"Plug 'suan/vim-instant-markdown'

"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
"Plug 'mhinz/vim-signify'

"monokai theme
Plug 'patstockwell/vim-monokai-tasty'
"模糊搜索fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } 
Plug 'junegunn/fzf.vim'

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
set guifont=Monaco:h16   " 设置字体  
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
"  新文件标题
"==================================================================
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.py,*.sh,*.java exec ":call Settitle()" 
""定义函数Settitle，自动插入文件头 
func Settitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line(".")+6, "") 
	elseif &filetype == 'python' 
	else
		call setline(1, "/*************************************************************************") 
		call append(line("."), "    > File Name: ".expand("%")) 
		call append(line(".")+1, "    > Author:hooray") 
		call append(line(".")+2, "    > Mail:hoorayitt@gmail.com ") 
		call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "  ")
    endif
    if &filetype == 'python'
		call setline(1,"# -*- coding:utf-8 -*-") 
		call append(line("."), "".expand("")) 
		. normal G
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 


"==================================================================="
"	函数注释
"==================================================================="
nnoremap <F1> :call SetComment()<CR>
""定义函数Settitle，自动插入文件头 
func SetComment() 
    "如果文件类型为.sh文件 
	if &filetype == 'python' 
        call append(line(".")-1, "") 
        call append(line(".")-1, "\#===============================================================") 
        "call append(line(".")-1, "\#   func_name:") 
        call append(line(".")-1, "\#    describe:  ") 
        call append(line(".")-1, "\#===============================================================") 
        call append(line(".")-1, "") 

		"找到函数名
		". normal /def<CR>
		". normal wyaw
		. normal kkk$

    "autocmd BufNewFile * normal kkA
    "else 
	endif
    "新建文件后，自动定位到文件末尾
    "autocmd BufNewFile * normal G
endfunc 


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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
set tags=tags  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"默认打开Taglist 
let Tlist_Auto_Open=1 
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1   


"=================================================================
"键盘命令
"=================================================================

"设置<leader>为空格键
let mapleader="\<Space>"

"重映射"
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"快速遍历缓冲区"
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

"映射显示当前文件目录的快捷键"
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

"插入模式下上下左右
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

"H,L移动到行首行尾
map H ^
map L $
"可视模式下移动到行尾
vnoremap L $h

"保存文件
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w !sudo tee % > /dev/null <CR>
nnoremap <leader>i :bd %<CR><CR>
nnoremap <leader>e :exit<CR>
"快捷复制粘贴至系统
nnoremap <C-A> ggVG"+y<CR>
"nnoremap <leader>v :r !pbpaste<CR>
"vnoremap <leader>c :w !pbcopy<CR><CR>
"打开文件管理器
nnoremap <C-t> :tabnew .<CR>5j
nnoremap <leader>, gT
nnoremap <leader>. gt
nnoremap <leader>f :Files ~<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

"运行cpp  和 python, 先清屏

nnoremap <leader>r :call RunCoding()<CR>
func! RunCoding()
    if &filetype == 'cpp'
		exec "!clear; ~/.local/config/.runcpp.sh %"
	elseif &filetype == 'python'
		" 分行写会输入多次确认 "
		exec "!clear; echo '========================Runing==================';python %"
	elseif &filetype == 'sh'
		exec "!./%"
	elseif &filetype == 'html'
		exec "!open -a \"\/Applications\/Google\ Chrome.app\" %"
    endif

endfunc 

"比较文件  
nnoremap <C-F4> :vert diffsplit 
"C,C++的调试
nnoremap <C-F5> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


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
"<!--}}}-->

"<!--html标签自动补全{{{-->
" html自动补全
"autocmd BufNewFile *  setlocal filetype=html
"function! InsertHtmlTag()
"let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
"normal! a>
"let save_cursor = getpos('.')
"let result = matchstr(getline(save_cursor[1]), pat)
"if (search(pat, 'b', save_cursor[1]))
	"normal! lyiwf>
	"normal! a</
	"normal! p
	"normal! a>
"endif
":call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
"endfunction
"inoremap > <ESC>:call InsertHtmlTag()<CR>a<CR><Esc>O
"<!--}}}-->

"之所以这里的括号补全代码中的函数实现反匹配
"当打入(输入内容)，再按)系统会自动检查前面是否已经有匹配的括号
"如果有就不再键入)，而是直接跳出

"或许你得加：
set autoindent
set cindent



"跳转至其css
function! JumpToCSS()
let id_pos = searchpos("id", "nb", line('.'))[1]
let class_pos = searchpos("class", "nb", line('.'))[1]

if class_pos > 0 || id_pos > 0
if class_pos < id_pos
  execute ":vim '#".expand('<cword>')."' **/*.css"
elseif class_pos > id_pos
  execute ":vim '.".expand('<cword>')."' **/*.css"
endif
endif
endfunction

nnoremap <leader>]  :call JumpToCSS()<CR>


"YouCompleteMe
let g:ycm_complete_in_comments = 0 "注释中补全
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_python_interpreter='/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf='/Users/iff/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

let Tlist_Auto_Highlight_Tag=1  
let Tlist_Auto_Open=1  
let Tlist_Auto_Update=1  
let Tlist_Display_Tag_Scope=1  
let Tlist_Exit_OnlyWindow=1  
let Tlist_Enable_Dold_Column=1  
let Tlist_File_Fold_Auto_Close=1  
let Tlist_Show_One_File=1  
let Tlist_Use_Right_Window=1  
let Tlist_Use_SingleClick=1  

filetype plugin on  
autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete  


let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'  
set autoindent

"tagbar
""F9触发，设置宽度为30
let g:tagbar_width = 25
nmap <F9> :TagbarToggle<CR>
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
let g:tagbar_autopreview = 1
""关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0

"airline options

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline_powerline_fonts=1
set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"
set ambiwidth=double "防止特殊符号无法正常显示
let g:airline#extensions#tabline#enabled=1 "顶部tab显示
"let g:airline_theme='bubblegum'  "murmur配色也不错
"
"nmap <tab> gt   "会导致C-i回退不可用"


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

"======================================================="
"	For Python
"======================================================="
nnoremap <leader>p Iprint($a)^j
nnoremap <leader>P Iprint("$a")^j


"===================python-mode===================
"开启警告
let g:pymode_warnings = 0
"保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
"显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
"设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
"使用python3
let g:pymode_python = 'python3'
"使用PEP8风格的缩进
let g:pymode_indent = 1
"取消代码折叠
let g:pymode_folding = 0
"开启python-mode定义的移动方式
let g:pymode_motion = 1
"启用python-mode内置的python文档，使用K进行查找
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
"自动检测并启用virtualenv
let g:pymode_virtualenv = 1
"不使用python-mode运行python代码
let g:pymode_run = 0
"let g:pymode_run_bind = '<Leader>r'
"不使用python-mode设置断点
let g:pymode_breakpoint = 0
"let g:pymode_breakpoint_bind = '<leader>b'
"启用python语法检查
let g:pymode_lint = 1
"修改后保存时进行检查
let g:pymode_lint_on_write = 1
"编辑时进行检查
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"发现错误时不自动打开QuickFix窗口
let g:pymode_lint_cwindow = 0
"侧边栏不显示python-mode相关的标志
let g:pymode_lint_signs = 0
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"启用重构
let g:pymode_rope = 1
"不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"光标下单词查阅文档
let g:pymode_rope_show_doc_bind = '<C-c>d'
"项目修改后重新生成缓存
let g:pymode_rope_regenerate_on_write = 1
"开启补全，并设置<C-Tab>为默认快捷键
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
"<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
"重命名光标下的函数，方法，变量及类名
let g:pymode_rope_rename_bind = '<C-c>rr'
"重命名光标下的模块或包
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all



" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" FileFormat ================================= "
command! Format :call FileFormat()
func FileFormat() 
	if &filetype == 'python' 
		exec "!python ~/.local/config/FormatPython.py %"
	endif
endfunc 

" 可是模式下f键翻译选中区域
vnoremap f y:!clear; tl "
nnoremap <C-f> yaw:!clear; tl "
inoremap <C-f> yaw:!clear; tl "

" markdown "
let g:table_mode_corner="|"

nnoremap <leader>m :update<Bar>silent!start %:p<CR>
"=================================================================
"	other
"=================================================================

"追加该行到文件study
nnoremap <leader>j :.w >> ~/study<CR>
vnoremap <leader>j :w >> ~/study<CR>

