#SingleInstance Force

WinActivate, HoldemResources Calculator ahk_class SWT_Window0
	
bigBlinds = 20000
Clipboard = %bigBlinds%

Loop 20 {
	
;open advanced hand
Send, ^w
Send, p

Sleep, 3000

send, ^a

Loop 6 {
Send, ^v
send, {tab}

sleep 2000
}

Send, {enter}

sleep 10000

;unfolds hand tree

MouseClick, Left, 25, 205

MouseClick, Left, 25, 190	

MouseClick, Left, 25, 170

MouseClick, Left, 25, 155

MouseClick, Left, 25, 135

;click the first row

MouseClick, Left, 90, 135

;wait longer first run, loop for 18

sleep, 3000

Send ^c
ClipWait

FileAppend %clipboard%`n, C:\Users\Galdon\Desktop\shovertestoutput.txt

Loop, 19
{

send, {down}

sleep, 1000

Send ^c
ClipWait

FileAppend %clipboard%`n, C:\Users\Galdon\Desktop\shovertestoutput.txt

}


;last one gets an extra space
;send, {down}

;sleep, 1000

;Send ^c
;ClipWait

;FileAppend %clipboard%`n`n, C:\Users\Galdon\Desktop\shovertestoutput.txt

Sleep, 1000

bigBlinds -= 1000
Clipboard = %bigBlinds%

sleep, 3000

}

x::ExitApp

ExitApp

