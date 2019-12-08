source $HOME/.local/config/PlugList.vimrc " Vim-plug 插件管理
source $HOME/.local/config/basic.vimrc " 基本设置
source $HOME/.local/config/alt.vimrc " 注册alt键
source $HOME/.local/config/myFunction.vimrc " 自定义函数
source $HOME/.local/config/pluginSetting.vimrc " Plugs
source $HOME/.local/config/python_markdown.vimrc " Notes， Python, Markdown
source $HOME/.local/config/web.vimrc " html， Css 


"===============================================================
"    NOTE:  常用键盘快捷键
"===============================================================

"设置<Space>为空格键
"let mapleader="\<Space>"

nnoremap <C-A> ggVG"+y<CR>
nnoremap <Space>v o"+p
vnoremap <Space>y "+y
"快速遍历缓冲区"
noremap <silent> <Tab> :bn<CR>
noremap <silent> <S-Tab> :bp<CR>

"映射显示当前文件目录的快捷键"
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

"插入&&命令模式下上下左右
"需要设置终端，Del发送Esc序列，Backspace发送ASCII Del
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

inoremap <c-a> <Home>
inoremap <c-e> <End>

cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>

"H,L移动到行首行尾
map H ^
map L $
"可视模式下移动到行尾
vnoremap L $
vnoremap H ^

"保存文件
nnoremap <Space>w :w<CR>
nnoremap <Space>W :w !sudo tee % > /dev/null <CR>
nnoremap <Space>i :bd %<CR><CR>
nnoremap <Space>e :exit<CR>
nnoremap <Space>t :TaskList<CR>
"快捷复制粘贴至系统
"nnoremap <Space>v :r !pbpaste<CR>
"vnoremap <Space>c :w !pbcopy<CR><CR>
"打开文件管理器
nnoremap <Space>, gT
nnoremap <Space>. gt
nnoremap <Space>f :call SearchFiles()<CR>
nnoremap <silent> <Space>b :Buffers<CR>
nnoremap <silent> <Space>l :Lines<CR>

"运行cpp  和 python, 先清屏
nnoremap <Space>r :call RunCoding()<CR>
nnoremap <Space>R :call AsyncRunCoding()<CR>

"C-l 清除高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


"比较文件  
nnoremap <C-F4> :vert diffsplit 

"C,C++的调试
nnoremap <C-F5> :call Rungdb()<CR>

"F8开启和关闭树"
map <F8> :NERDTreeToggle<CR>
nnoremap <Space>]  :call JumpToCSS()<CR>

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"切换头/源文件
noremap <F4> :A<CR>
"增加说明
nnoremap <M-p> :call SetComment()<CR>

"快速代码注释
map <M-a> <leader>ci <CR>

nnoremap <Space>p Iprint($a)^j
nnoremap <Space>P Iprint("$a")^j

"查看函数定义
nnoremap <F9> :LeaderfFunction!<CR>
nnoremap <C-k> :LeaderfFunction!<CR>

"快速跳转错误
nmap <M-k> <Plug>(ale_previous_wrap)
nmap <M-j> <Plug>(ale_next_wrap)
"<Space>s触发/关闭语法检查
nmap <M-s> :ALEToggle<CR>
"<Space>d查看错误或警告的详细信息
nmap <M-d> :ALEDetail<CR>

" 设置分号自动折叠
nnoremap <M-;> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Or if you have Neovim >= 0.1.5
"if (has("termguicolors"))
 "set termguicolors
"endif

" Theme
"syntax enable
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'
let g:airline_theme='onedark'
colorscheme onedark



" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" clear all the items
call g:quickmenu#reset()

" bind to F12
noremap <silent><F12> :call quickmenu#toggle(0)<cr>


" section 1, text starting with "#" represents a section (see the screen capture below)
call g:quickmenu#append('# Develop', '')

call g:quickmenu#append('item 1.1---------------------------------------------------------------------------------------------------', 'echo "1.1 is selected"', 'select item 1.1')
call g:quickmenu#append('item 1.2', 'echo "1.2 is selected"', 'select item 1.2')
call g:quickmenu#append('item 1.3', 'echo "1.3 is selected"', 'select item 1.3')

" section 2
call g:quickmenu#append('# Misc', '')

call g:quickmenu#append('item 2.1', 'echo "2.1 is selected"', 'select item 2.1')
call g:quickmenu#append('item 2.2', 'echo "2.2 is selected"', 'select item 2.2')
call g:quickmenu#append('item 2.3', 'echo "2.3 is selected"', 'select item 2.3')
call g:quickmenu#append('item 2.4', 'echo "2.4 is selected"', 'select item 2.4')



nmap <silent> <C-f> <Plug>DictSearch
vmap <silent> f <Plug>DictVSearch
nmap <silent> <M-f> <Plug>DictRSearch
vmap <silent> r <Plug>DictRVSearch

"--使用 :Dict hello 在命令行回显
command! -nargs=1 S call dict#Search(<q-args>, 'complex')
"--使用 :DictW hello 在Dict新窗口显示
"
"

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col,
        \ 'width': width * 4 / 5,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }



" GitHub: https://github.com/MattesGroeger/vim-bookmarks
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save_file = '/home/itt/.local/config/.bookmarks'
let g:bookmark_auto_close = 1
nmap mm <Plug>BookmarkToggle
nmap mc <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll

autocmd BufEnter *.html exec":set filetype=html"


nnoremap <M-/> :LeaderfFunction<CR>
if filereadable(expand("~/.vim/plugged/snake/plugin/snake.vim"))
    source ~/.vim/plugged/snake/plugin/snake.vim
endif

let g:leetcode_china = 1
let g:leetcode_solution_filetype = 'c'
let g:leetcode_username = 'hoorayitt@gmail.com'
let g:leetcode_password = 'Lji.guo4'
