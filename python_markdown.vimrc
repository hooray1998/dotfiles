" 常用命令 Toc， TableFormat
" gx：在与标准gx命令相同的浏览器中打开光标下的链接。<Plug>Markdown_OpenUrlUnderCursor
" ge：打开Vim中光标下的链接进行编辑。对于相对降价链接很有用。<Plug>Markdown_EditUrlUnderCursor
" ]]：转到下一个标题。 <Plug>Markdown_MoveToNextHeader
" [[：转到上一个标题。对比]c。<Plug>Markdown_MoveToPreviousHeader
" ][：如果有的话，去下一个兄弟标题。 <Plug>Markdown_MoveToNextSiblingHeader
" []：如果有的话，转到上一个兄弟标题。 <Plug>Markdown_MoveToPreviousSiblingHeader
" ]c：转到当前标题。 <Plug>Markdown_MoveToCurHeader
" ]u：转到父标题（向上）。 <Plug>Markdown_MoveToParentHeader
"
" 自动生成Markdown目录， GenTocGFM


" 更改折叠方式，全部只占一行
let g:vim_markdown_folding_style_pythonic=1
" 从二级标题开始折叠
let g:vim_markdown_folding_level = 9
" Toc的quickfix窗口大小自动调整
let g:vim_markdown_toc_autofit = 1
"语法隐藏，设置阅读时语法隐藏，编辑时不隐藏
set conceallevel=2 
"设置代码块不隐藏
"let g:vim_markdown_conceal_code_blocks = 0
"设置不隐藏
"let g:vim_markdown_conceal = 0
"设置LateX公式不隐藏
let g:tex_conceal = ""
"数学公式高亮
let g:vim_markdown_math = 1
" 启用删除线
let g:vim_markdown_strikethrough = 1


let g:mkdp_auto_start = 0
" Set to 1, Vim will open the preview window on entering the Markdown
" buffer.

let g:mkdp_auto_open = 0
" Set to 1, Vim will automatically open the preview window when you edit a
" Markdown file.

let g:mkdp_auto_close = 1
" Set to 1, Vim will automatically close the current preview window when
" switching from one Markdown buffer to another.

let g:mkdp_refresh_slow = 0
" Set to 1, Vim will just refresh Markdown when saving the buffer or
" leaving from insert mode. With default 0, it will automatically refresh
" Markdown as you edit or move the cursor.

let g:mkdp_command_for_global = 0
" Set to 1, the MarkdownPreview command can be used for all files,
" by default it can only be used in Markdown files.

"===============================================================
"    NOTE:  For Notes
"===============================================================
" 集成Enter，list快速进入文件，markdown快速运行代码
function EnterFile()
	.normal mb?```"ayy
	if match(@a,"cpp")>-1
		.normal VNkoj:w /tmp/tmp.cpp
		exec ":!clear;echo '<<===>>  Making  <<===>>';g++ -o /tmp/run%:t:r /tmp/tmp.cpp;rm /tmp/tmp.cpp;echo '<<===>>  Runing  <<===>>'; /tmp/run%:t:r"
	elseif match(@a,"python")>-1
		.normal VNkoj:w !python
	elseif match(@a,"lua")>-1
		.normal VNkoj:w !echo '<<<======================================>>>'&&lua
	elseif match(@a,"perl")>-1
		.normal VNkoj:w !perl
	elseif match(@a,"javascript")>-1  || match(@a,"JavaScript")>-1  
		.normal VNkoj:w !nodejs
	endif
	.normal `b
endfunc

"===============================================================
"    NOTE:  For Markdown
"===============================================================

"command! InstantMarkdownStop :!killall nodejs<CR>

" 可是模式输入C-l增加行号
function AddListNumber()
	let lnum = getpos('.')[1] + 1 - getpos("'<")[1]
	. normal I=lnum. 
endfunc
function AddListFlag()
	. normal ^i- 
endfunc

function SetTitle()
	.normal "yyy
	if match(@y,"#")>-1
		.normal I#
	else
		.normal I# 
	endif
endfunc


let g:tlTokenList = ["FIXME",  "TODO",  "##", "QSTN", "HACK", "NOTE", "WARN", "MODIFY"]
let g:tlRememberPosition = 1  "下次打开时会恢复到上次关闭时的位置

"	记录上一次的markdown笔记的目录
autocmd BufEnter  * call RecordPath()
function RecordPath()
	if match(expand("%:p"),'Notes') > -1
		call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-note"))
	endif
	if match(expand("%:e"), 'md') > -1
		call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-md"))
	elseif match(expand("%:e"), 'py') > -1
		call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-py"))
	elseif match(expand("%:e"), 'cpp') > -1
		call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-cpp"))
	endif
endfunc

let g:CodeLanguage = "lua"

augroup pscbindings
	autocmd! pscbindings
	autocmd FileType markdown nnoremap <buffer> <enter> :call EnterFile()<CR>
	autocmd FileType markdown vnoremap <buffer> <C-l> :call AddListNumber()<CR>
	autocmd FileType markdown vnoremap <buffer> <C-k> :call AddListFlag()<CR>
	autocmd FileType markdown vnoremap <buffer> c omaoo```'aO:call setline('.', "```".g:CodeLanguage)<CR>
	autocmd FileType markdown vnoremap <buffer> <C-c>s omaoo```'aO:call setline('.', "```"."sql")<CR>
	autocmd FileType markdown vnoremap <buffer> <C-c>b omaoo```'aO:call setline('.', "```"."sh")<CR>
	autocmd FileType markdown vnoremap <buffer> <C-c>c omaoo```'aO:call setline('.', "```"."cpp")<CR>
	autocmd FileType markdown vnoremap <buffer> <C-c>p omaoo```'aO:call setline('.', "```"."perl")<CR>
	autocmd FileType markdown vnoremap <buffer> <C-c>j omaoo```'aO:call setline('.', "```"."javascript")<CR>
	autocmd FileType markdown vnoremap <buffer> <C-c>h omaoo```'aO:call setline('.', "```"."html")<CR>
	autocmd FileType markdown vnoremap <buffer> <C-c>l omaoo```'aO:call setline('.', "```"."lua")<CR>
	autocmd FileType markdown nnoremap <buffer> # :call SetTitle()<CR>
	autocmd FileType markdown vnoremap <buffer> <C-k> :call AddListFlag()<CR>
	autocmd FileType markdown nnoremap <buffer> <C-b> I**<ESC>A**<ESC>
augroup end
