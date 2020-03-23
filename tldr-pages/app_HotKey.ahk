;Notes: #==win !==Alt 2015-05-20  ^ ==Ctrl  +==shift
#singleinstance, force

^+r::Reload  ; 设定 Ctrl-Shift-R 热键来重启脚本

!k::run E:\QtRelease\fakeTim2\machine.exe
!n::run E:\gVim\vim80\gvim.exe  "E:\我的坚果云\Notes",

^End::
Click, right,1712,1052
sleep 200
Send r
Return

;; 快速编辑本文
!a::run E:\gVim\vim80\gvim.exe "C:\Users\iTT\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\app_Hotkey.ahk"
;; 打开帮助文档
!^a::run E:\Downloads\AutoHotkey中文帮助.chm


;Alt + 左键 获得文件路径
!LButton::
/*
MouseGetPos, mouseX, mouseY
MouseClick left, %mouseX%, %mouseY%
sleep 200
Send 我来拿吧 {Enter}
*/
MouseGetPos, mouseX, mouseY
MouseClick left, %mouseX%, %mouseY%
send ^c
;sleep,200
;tooltip,%clipboard%
Return

;重映射上下左右
^j::Send {Down}
^k::Send {Up}

;;快速打开clover
!e::run C:\Program Files (x86)\Clover\Clover.exe
!b:: Run "C:\Program Files\Git\git-bash.exe" --cd-to-home
;;!n:: Run C:\Program Files (x86)\Notepad++\notepad++.exe

!q::SendInput !{F4}


;ctrl+鼠标右键重命名
^RButton::
Send {RButton}
sleep 100
Send m
Return

;;ctrl+空格，用gvim打开当前文件
^Space::
send ^c
Run E:\gVim\vim80\gvim.exe  "%clipboard%",
return

;;输入邮箱hoorayitt@gmail.com
::@g::hoorayitt@gmail.com
::@f::hooray1998@foxmail.com
::xh::161640230

;;极度打开邮箱
#m::Run https://mail.google.com/
#,::Run https://mail.qq.com/
;;win+f  google翻译
#f::Run https://translate.google.cn/
;;win+a  airdroid手机电脑互联
#a::Run https://web.airdroid.com/
;;win+k  google keep
#k::Run https://keep.google.com/

#z::Run https://search.bilibili.com/all?keyword=张猫要练嘴皮子
;;一件拷贝文件路径
^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return


;;C+Win+c颜色神偷, 一件获取当前鼠标位置颜色值
^#c::
MouseGetPos, mouseX, mouseY
; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
; 截取 color（第二个 color）右边的6个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = %color%
; 把 color 的值发送到剪贴板
return


;;<F12>打开/隐藏/激活Cmder
!c::
IfWinNotExist ahk_class VirtualConsoleClass
{
	Run D:\cmder1.3.2\Cmder.exe
    WinActivate
}
Else IfWinNotActive ahk_class  VirtualConsoleClass
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

;;Alt+v打开/隐藏/激活gVim
!v::
IfWinNotExist ahk_class Vim
{
	Run E:\gVim\vim80\gvim.exe
    WinActivate
}
Else IfWinNotActive ahk_class Vim
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

;; Chrome中Ctrl+，/。切换标签
#IfWinActive ahk_class Chrome_WidgetWin_1
	$tab::^]
	$^tab::^[
	!Tab::Send !{Tab}
	^,::Send ^+{Tab}
	^.::Send ^{Tab}
Return 

;;Alt+g打开/隐藏/激活Chrome
!g::
IfWinNotExist ahk_class Chrome_WidgetWin_1
{
	Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
    WinActivate
}
Else IfWinNotActive ahk_class Chrome_WidgetWin_1
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

;;Win+c获得窗体的类
#c::
WinGetClass,title,A
msgbox,%title%
clipboard=%title%
return

;; Ctrl+Alt+l/h  => Windows 10 虚拟桌面自动切换 
^#,::send #^{left}
^#.::send #^{right}


;; 帮助文档翻页
#IfWinActive ahk_exe hh.exe
	E::PgUp
	D::PgDn
Return


model:=1
;; MindMaster中粘贴图片
;; #IfWinActive ahk_class Qt5QWindowIcon
#IfWinActive A MindMaster

	F4::
		{
			model:=!model
			if(model=0)
				tooltip visual , 870,10
			else
				tooltip normal , 870,10
		}
	return

	j::
		WinGetTitle,title,A
		if(model = 0 && title = "MindMaster")
		{
			Send {Tab}
			Send {F3}
		}
		else
			Send j
	return


	k::
		WinGetTitle,title,A
		if(model = 0 && title = "MindMaster")
		{
			Send +{Tab}
			Send {F3}
		}
		else
			Send k
	return

	i::
		WinGetTitle,title,A
		if(model = 0 && title = "MindMaster")
		{
			Send ^x
			Send {F3}
		}
		else
			Send i
	return

	o::
		WinGetTitle,title,A
		if(model = 0 && title = "MindMaster")
		{
			Send ^z
			Send {F3}
		}
		else
			Send o
	return

	h::
		WinGetTitle,title,A
		if(model = 0 && title = "MindMaster")
		{
			Send {Left}
			Send {F3}
		}
		else
			Send h
	return

	l::
		WinGetTitle,title,A
		if(model = 0 && title = "MindMaster")
		{
			Send {Right}
			Send {F3}
		}
		else
			Send l
	return

	^j::
	{
		WinGetTitle,title,A
		MouseGetPos, mouseX, mouseY
		;msgbox,%title%
		if(title = "插入注释")
		{
			Click 773, 536
			;MouseClick left, 773, 536
			;MouseMove %mouseX%, %mouseY%
		}
		else if(title = "MindMaster")
		{
			Send ^t
		}


	}
	return 

	^f::
	if(model=1)
	{
		Send ^{Enter}
		Send {Space}
		Send {Backspace}
		Send {Enter}
		Send ^v

	}
	else
		send ^f
	return
		
	^d::
	if(model=1)
	{
		Send ^{Enter}
		Send {Space}
		Send {Backspace}
		Send {Enter}
		Send ^v
		Send {Left}
	}
	else
		send ^d
	return

	Tab::
	if(model=1)
	{
		Send ^{Enter}
	}
	else
		send {Tab}
	return 
	!Tab::!Tab
Return 

;; MindMaster 自动保存
#Persistent
#NoEnv
v_Enable=0
^!s::
{
	v_Enable:=!v_Enable

	If (v_Enable=0)
	{
		SetTimer, autoSave, Off
		tooltip,  自动保存：关闭  ,300,10
		sleep 2000
		tooltip
	}
	Else
	{
		tooltip,  自动保存：开启  ,300,10
		SetTimer, autoSave, 300000
	}
}
Return

autoSave:
{
	WinGetTitle,title,A
	if(title <> "MindMaster")
	{
		tooltip , ...
		SetTimer, autoSave, Off
		SetTimer, autoSave, 30000
		sleep 2000
		tooltip
		tooltip,  自动保存：开启  ,300,10
	}
	else
	{
		SetTimer, autoSave, Off
		SetTimer, autoSave, 300000
		tooltip,  正在保存正在保存正在保存正在保存正在保存正在保存正在保存
		Send ^s
		sleep 2000
		tooltip
		tooltip,  自动保存：开启  ,300,10
	}
}
Return

;;ppt e和d翻页, f快速截屏
#IfWinActive ahk_class PPTFrameClass
	e::PgUp
	d::PgDn
	
	f::
	Send ^f
	sleep 50
	Send r
	sleep 50
	Send {Enter}
	sleep 50
	IfWinNotExist ahk_class OpusApp
	{
	}
	Else IfWinNotActive ahk_class OpusApp
		WinActivate
	Send ^v
	sleep 50
	Send {Enter}
	sleep 50
	Send !{Tab}
	return

	Space::f

return
	
