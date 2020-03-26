" todo文件的语法高亮文件"
syntax match Todo_Flag "\v[!#%^]" contained 
syntax match Todo_Project "\v\$.*$" 
syntax match Todo_Tag "\v\@.*$" contained contains=Todo_Flag
syntax match Todo_checkLabel "\v✔.*$" contained 
syntax match ST_UL "\v☐_.*$" contained 
syntax match XT_UL "\v☐_.*$" contained 
syntax match SX_UL "\v☐_.*$" contained 
syntax match XX_UL "\v☐_.*$" contained 


"进行该规则,都变成注释， helpCRVSub开头的除外
syn match ST_tag "\v\@!\_[^\@]*" contains=Todo_.*,ST_UL
syn match XT_tag "\v\@#\_[^\@]*" contains=Todo_.*,XT_UL
syn match SX_tag "\v\@\%\_[^\@]*" contains=Todo_.*,SX_UL
syn match XX_tag "\v\@\^\_[^\@]*" contains=Todo_.*,XX_UL


" help hightlight-args
hi Magenta  cterm=NONE ctermfg=197 guifg=#FC1A70
hi Magenta_  cterm=underline ctermfg=197 guifg=#FC1A70
hi Yellow  term=NONE cterm=NONE gui=NONE ctermfg=228 guifg=#ffff87
hi Yellow_  term=underline cterm=underline gui=underline ctermfg=228 guifg=#ffff87
hi Blue  term=NONE cterm=NONE gui=NONE ctermfg=81 guifg=#62D8F1
hi Blue_  term=underline cterm=underline gui=underline ctermfg=81 guifg=#62D8F1
hi White  term=NONE cterm=NONE gui=NONE ctermfg=231 guifg=#ffffff
hi White_  term=underline cterm=underline gui=underline ctermfg=231 guifg=#ffffff

" help group-name
hi def link Todo_Project Todo
hi def link Todo_Tag Todo
hi def link Todo_checkLabel Comment

hi def link ST_UL Magenta_
hi def link XT_UL Yellow_
hi def link ST_UL Blue_
hi def link XX_UL White_

hi def link ST_tag Magenta
hi def link XT_tag Yellow
hi def link SX_tag Blue
hi def link XX_tag White

highlight def link Todo_Flag Ignore
