"===============================================================
"    NOTE:  Tree indentLine autopep8 mapleader
"===============================================================

let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=0
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

"缩进指示线"
"let g:indentLine_char='┆'
"let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

"===============================================================
"    NOTE:  CTags and GTags
"===============================================================
"ctags
set tags=./.tags;,.tags
" for gutentags"
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


"===============================================================
"    NOTE:  YouCompleteMe
"===============================================================
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
 
noremap <c-z> <NOP>
 
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
"YouCompleteMe for Ubuntu
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"YouCompleteMe for mac
"let g:ycm_complete_in_comments = 0 "注释中补全
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:syntastic_ignore_files=[".*\.py$"]
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_server_python_interpreter='/usr/local/bin/python3'
"let g:ycm_global_ycm_extra_conf='/Users/iff/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

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


"===============================================================
"    NOTE:  LeaderF
"===============================================================
"tagbar 替代品leaderF, 相关功能和fzf类似
"let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<m-n>'
"noremap <c-n> :LeaderfMru<cr>
"noremap <m-p> :LeaderfFunction!<cr>
"noremap <m-n> :LeaderfBuffer<cr>
"noremap <m-m> :LeaderfTag<cr>
"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

"let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
"let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
"let g:Lf_CacheDirectory = expand('~/.vim/cache')
"let g:Lf_ShowRelativePath = 0
"let g:Lf_HideHelp = 1
"let g:Lf_StlColorscheme = 'powerline'
"let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"===============================================================
"    NOTE:  Airline Options
"===============================================================
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''   "''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''   "''显示有问题
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
let g:airline_section_y = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

"===============================================================
"    NOTE:  打字机
"===============================================================
let g:keysound_enable = 1
let g:keysound_py_version = 3
let g:keysound_volume = 1000
let g:keysound_theme = 'typewriter'
"设置默认音效主题，可以选择：default, typewriter, mario, bubble, sword



"===============================================================
"    NOTE:  Signify
"===============================================================
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
"nmap <Space>d <plug>(signify-next-hunk)
"nmap <Space>D <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

"===============================================================
"    NOTE:  ALE
"===============================================================
"for ale
"let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_completion_delay = 500
let g:ale_echo_delay = 500
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '%code: %%s'
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1
 
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '.'

"for ale format"
"autocmd FileType python noremap <buffer> <F5> :ALEFix<CR>
"let g:ale_fixers = { 'python': ['add_blank_lines_for_python_control_statements','autopep8','isort','yapf','remove_trailing_lines','trim_wh' }



"===============================================================
"    NOTE:  AsyncRun cpp-highlight newtw echodoc
"===============================================================
"for asyncrun"
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 10

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

"for the left of vim-signify
set signcolumn=yes

"for cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"newtw"
let NERDTreeHijackNetrw=1

"for echodoc.vim"  使用<C-y>
set noshowmode
