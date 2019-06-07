"===============================================================
"    NOTE:  For Notes
"===============================================================
" 集成Enter，list快速进入文件，markdown快速运行代码
nnoremap <Enter> :call EnterFile()<CR>
function EnterFile()
	if expand("%:e")=='list'
		.normal $gf
	elseif expand("%:e")=='md'
		.normal mb?```"ayy
		if match(@a,"cpp")>-1
			.normal VNkoj:w /tmp/tmp.cpp
			exec ":!clear;echo '<<===>>  Making  <<===>>';g++ -o /tmp/run%:t:r /tmp/tmp.cpp;rm /tmp/tmp.cpp;echo '<<===>>  Runing  <<===>>'; /tmp/run%:t:r"
		elseif match(@a,"python")>-1
			.normal VNkoj:w !python
		elseif match(@a,"javascript")>-1  || match(@a,"JavaScript")>-1  
			.normal VNkoj:w !nodejs
		endif
		.normal `b
	else
		.normal j
	endif
endfunc

"===============================================================
"    NOTE:  For Markdown
"===============================================================

" markdown "
let g:markdown_enable_conceal = 0
let g:markdown_enable_insert_mode_mappings = 0
let g:instant_markdown_autostart = 0
command! InstantMarkdownStop :!killall nodejs<CR>

" 可是模式输入C-l增加行号
vnoremap <C-l> :call AddListNumber()<CR>
function AddListNumber()
	let lnum = getpos('.')[1] + 1 - getpos("'<")[1]
	. normal I=lnum. 
endfunc
vnoremap <C-k> :call AddListFlag()<CR>
function AddListFlag()
	. normal ^i- 
endfunc
let g:language='javascript'
vnoremap <C-c> omaoo```'aO:call setline('.', "```".g:language)<CR>
"vnoremap <C-c> :call execute("omaoo```'aO```".g:language."")
nnoremap # :call SetTitle()<CR>
function SetTitle()
	.normal "yyy
	if match(@y,"#")>-1
		.normal I#
	else
		.normal I# 
	endif
endfunc


"======================================================="
"	 NOTE:  For Python
"======================================================="

command! Format :call FileFormat()
func FileFormat() 
	if &filetype == 'python' 
		exec "!python ~/.local/config/FormatPython.py %"
	endif
endfunc 

"=================================================================
"    NOTE:  所有模式下f键翻译选中区域
"=================================================================
vnoremap f y:AsyncRun $HOME/.local/config/search_and_record.sh "\|awk -f $HOME/.local/config/simplify.awk 
nnoremap <C-f> yaw:AsyncRun $HOME/.local/config/search_and_record.sh "\|awk -f $HOME/.local/config/simplify.awk 
inoremap <C-f> yaw:AsyncRun $HOME/.local/config/search_and_record.sh "\|awk -f $HOME/.local/config/simplify.awk 


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

