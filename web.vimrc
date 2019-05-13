"===============================================================
"    NOTE:  HTML补全， CSS跳转
"===============================================================
"解决办法：只要把下面两段代码粘贴到~/.vimrc中，就可以实现括号超强补全
"<!--括号引号补全代码{{{-->
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
"call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
"endfunction
"inoremap > <ESC>:call InsertHtmlTag()<CR>a<CR><Esc>O
"<!--}}}-->

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


