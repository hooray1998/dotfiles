"===============================================================
"    NOTE:  新文件标题
"===============================================================
autocmd BufNewFile *.md,*.cpp,*.[ch],*.py,*.sh,*.java exec ":call Settitle()" 
""定义函数Settitle，自动插入文件头 
func Settitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line(".")+6, "") 
	elseif &filetype == 'python' || &filetype == 'markdown'
	else
		call setline(1, "/*=========================================================") 
		call append(line("."), "> File Name: ".expand("%")) 
		call append(line(".")+1, "> Author:hooray") 
		call append(line(".")+2, "> Mail:hoorayitt@gmail.com ") 
		call append(line(".")+3, "> Created Time: ".strftime("%c")) 
		call append(line(".")+4, "> =======================================================*/") 
		call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<bits/stdc++.h>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
        call append(line(".")+9, "int main(){")
        call append(line(".")+10, "")
        call append(line(".")+11, "\treturn 0;")
        call append(line(".")+12, "}")
		. normal 11G
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
		. normal G
    endif
    if &filetype == 'python'
		call setline(1,"# -*- coding:utf-8 -*-") 
		call append(line("."), "".expand("")) 
		. normal G
    endif
	if &filetype == 'markdown'
		call setline(1, "# ".expand("%:t:r")) 
		call append(line("."), "".expand("")) 
		. normal G
    endif
    "新建文件后，自动定位到文件末尾
    "autocmd BufNewFile * normal G
endfunc 

"==================================================================="
"	NOTE:  函数说明
"==================================================================="
func SetComment() 
    "如果文件类型为.sh文件 
	if &filetype == 'python' 
        call append(line(".")-1, "") 
        call append(line(".")-1, "\#===============================================================") 
		call append(line(".")-1, "\#   func_name:") 
        call append(line(".")-1, "\#    describe:  ") 
        call append(line(".")-1, "\#===============================================================") 
        call append(line(".")-1, "") 
		. normal kkk$
	else
        call append(line(".")-1, "\"===============================================================") 
		call append(line(".")-1, "\"    NOTE:  ") 
        call append(line(".")-1, "\"===============================================================") 
		. normal kk$
	endif
endfunc 

"===============================================================
"    NOTE:  自定义函数
"===============================================================

""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'javascript'
		exec "!time node %"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!go build %<"
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
	endif
endfunc


function! s:VSetSearch()
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
let @s = temp
endfunction

func! RunCoding()
	exec ":w"
    if &filetype == 'cpp'||&filetype == 'c'
		exec ":!clear;echo '<<===>>  Making  <<===>>';g++ -o /tmp/run%:t:r %;echo '<<===>>  Runing  <<===>>';time /tmp/run%:t:r"
	elseif &filetype == 'python'
		exec ":!clear; echo '<<===>>  Runing  <<===>>';time python %"
	elseif &filetype == 'javascript'
		exec "!time node %"
	elseif &filetype == 'sh'
		exec ":!chmod +x %;./%"
	elseif &filetype == 'html'
		"exec "!open -a \"\/Applications\/Google\ Chrome.app\" %"
		exec ":!google-chrome %"
	elseif expand('%:e') == 'awk'
		exec "AsyncRun awk -f % ".expand('%:r').".data"
	elseif expand('%:e') == 'md'
		exec ":MarkdownPreview"
	else
		exec ":e %"
    endif
endfunc 
func! AsyncRunCoding()
	exec ":w"
	if &filetype == 'python'
		exec ":AsyncRun python %"
	elseif &filetype == 'sh'
		exec ":!chmod +x %;./%"
	elseif &filetype == 'html'
		"exec "!open -a \"\/Applications\/Google\ Chrome.app\" %"
		exec "google-chrome %"
	elseif expand('%:e') == 'awk'
		exec "AsyncRun awk -f % ".expand('%:r').".data"
	elseif expand('%:e') == 'md'
		exec ":InstantMarkdownPreview"
	else
		exec ":e %"
    endif
endfunc 

func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

function  SearchFiles()
	if expand("%:p") =~ "Notes"
		exec ":Files ~/MyNutStore/Notes"
	elseif expand("%:p") =~ "QtCoding"
		exec ":Files ~/Coding/QtCoding"
	elseif expand("%:p") =~ "PycharmProjects"
		exec ":Files ~/PycharmProjects"
	else
		exec ":Files ."
	endif
endfunc
