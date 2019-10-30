call plug#begin('~/.vim/plugged')
"======================================="
Plug 'amoffat/snake'
Plug 'mileszs/ack.vim'
Plug 'MattesGroeger/vim-bookmarks'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Markdown syntastic highlight
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' "注释掉syntax目录才能正确高亮
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'mzlogin/vim-markdown-toc'

Plug 'iamcco/dict.vim'

"打字机音效
"Plug 'skywind3000/vim-keysound'
"GTags
"多用c-w ] 代替c-]
"Plug 'ludovicchabant/vim-gutentags'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"AsyncRun shell command
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/quickmenu.vim'
"Async syntax check
Plug 'w0rp/ale'
"better highlight for cpp"
Plug 'octol/vim-cpp-enhanced-highlight'
"leaderF"
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"使用- 快速进入文件浏览器"
Plug 'justinmk/vim-dirvish'
"函数参数提醒"似乎会很卡
"Plug 'Shougo/echodoc.vim'
"======================================="
"	i, 和 a, ：参数对象 eg.   vi,  ci,  di,
"	ii 和 ai ：缩进对象 eg.   vii  cii  dii
"	if 和 af ：函数对象 eg.   vif  cif  dif
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
"======================================="
""匹配的括号或标签同时修改"
Plug 'tpope/vim-surround'  
" 工程文件浏览
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" 增加缩进指示线 "会影响markdown的显示效果，很多语法都给隐藏了
"Plug 'Yggdroot/indentLine'
" 括号补全 "
Plug 'jiangmiao/auto-pairs'
Plug 'tell-k/vim-autopep8'
" 快速代码注释
Plug 'scrooloose/nerdcommenter'
" 美化状态栏和标签页 "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 写html利器
"Plug 'mattn/emmet-vim'
" Pending tasks list
"Plug 'fisadev/FixedTaskList.vim'


Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"monokai theme
Plug 'patstockwell/vim-monokai-tasty'
"模糊搜索fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } 
Plug 'junegunn/fzf.vim'
"超强的自动补全
Plug 'Valloric/YouCompleteMe'
augroup load_ycm
	"延时加载"
	autocmd!
	autocmd InsertEnter * call plug#load('YouCompleteMe') | autocmd! load_ycm
augroup END

call plug#end()

set shell=/bin/sh
