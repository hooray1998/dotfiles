;鼠标点击
Click  ; 在鼠标光标的当前位置点击鼠标左键.
Click 100, 200  ; 在指定坐标处点击鼠标左键.
Click 100, 200, 0  ; 移动而不点击鼠标.
Click 100, 200 right  ; 点击鼠标右键.
Click 2  ; 执行双击.
Click down  ; 按下鼠标左键不放.
Click up right  ; 释放鼠标右键.
 
Send +{Click 100, 200}  ; Shift+LeftClick
Send ^{Click 100, 200, right}  ; Control+RightClick
 
 
;输入框
InputBox, password, Enter Password, (your input will be hidden), hide
InputBox, UserInput, Phone Number, Please enter a phone number., , 640, 480
if ErrorLevel
    MsgBox, CANCEL was pressed.
else
    MsgBox, You entered "%UserInput%"
 
;循环
Loop, 3
{
    MsgBox, Iteration number is %A_Index%.  ; A_Index 将为 1, 2, 接着 3
    Sleep, 100
}
 
Loop
{
    if a_index > 25
        break  ; 终止循环
    if a_index < 20
        continue ; 跳过后面并开始下一次重复
    MsgBox, a_index = %a_index% ; 这里将仅显示数字 20 到 25
}
