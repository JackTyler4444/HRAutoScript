#SingleInstance Force

WinActivate, HoldemResources Calculator ahk_class SWT_Window0

; loop for number of bbs samples

bigBlinds = 20000
Clipboard = %bigBlinds%
		
Loop 20 {
				
;open hand
openHand()

sleep 30000
		
;unfolds hand tree
unfoldTree()
		
;copypaste output
getValues()

Sleep, 1000

bigBlinds -= 1000
Clipboard = %bigBlinds%

sleep, 3000

}			
x::ExitApp
ExitApp

;Function defintions
openHand() {
	
	Send, ^w
	Send, r

	Sleep, 3000

	send, ^a

	Loop 6 {
		
		Send, ^v
		send, {tab}

		sleep 2000
	
	}

	Send, {enter}
}

unfoldTree() {
	
	;expand each opening strategy to show 3 bet strategies
		MouseClick, Left, 25, 205
	
		MouseClick, Left, 45, 225
		
		MouseClick, Left, 25, 190

		MouseClick, Left, 45, 225
		
		MouseClick, Left, 45, 205
		
		MouseClick, Left, 25, 170
	
		MouseClick, Left, 45, 225
		
		MouseClick, Left, 45, 205
		
		MouseClick, Left, 45, 190
		
		MouseClick, Left, 25, 155
	
		MouseClick, Left, 45, 225
		
		MouseClick, Left, 45, 205
		
		MouseClick, Left, 45, 190
		
		MouseClick, Left, 45, 170
		
		MouseClick, Left, 25, 135	
	
		MouseClick, Left, 45, 225
		
		MouseClick, Left, 45, 205
		
		MouseClick, Left, 45, 190
		
		MouseClick, Left, 45, 170
	
		MouseClick, Left, 45, 155
	
}

getValues() {
	
	MouseClick, Left, 90, 135
	
	tempCounter = 5
	keyStrokeinitial = 6
	tempComparision = 5
	downCounter = 6
	upCounter = 19
	upCounterDecrementer = 6
	
	;get 3bet values
	Loop 5 {
		
		;reset to first position

		;wait longer first run, loop for 19
		sleep, 10000
			
		;getminriase
		Send ^c
		ClipWait
		
		FileAppend %clipboard%`n, C:\Users\Galdon\Desktop\shovertestoutput.txt
			
		send, {down}
			
		sleep, 1000
		
	;get3betRanges	
		
		Send ^c
		ClipWait
		FileAppend %clipboard%`n, C:\Users\Galdon\Desktop\shovertestoutput.txt
		
		;related to number of players to act
		temp = %tempCounter%
		iCounter = 1
		
		;MsgBox, keyStrokeCount %keyStrokeinitial% temp %temp%
		
		;loop for each 3bet range
		keyStrokeCount = %keyStrokeinitial%
		While(iCounter < temp){
				;number of downstrokes to next 3bet range
				Loop %keyStrokeCount% {
					send, {down}
				}
				
				sleep, 1000
				
				Send ^c
				ClipWait
				
				FileAppend %clipboard%`n, C:\Users\Galdon\Desktop\shovertestoutput.txt
				
				iCounter += 1
				keyStrokeCount -= 1
				
				;msgBox, iteration %iCounter% + " " + %temp%
		}
		
	tempCounter -= 1
	keyStrokeinitial -= 1
	;msgBox, iteration
	;Send, {down}	
	Loop %upCounter% {
		send, {up}
	}
	
	;upCounter = 13
	upCounter := upCounter - upCounterDecrementer
	upCounterDecrementer -= 1
	
	;get call 3bet xranges
	tempdownCounter = %downCounter%
	tempCountertwo = 0
		
		While(tempCountertwo < tempComparision) { 
			
			sleep, 1000
						
			
					
			Loop %tempdownCounter% {
				send, {down}
			}
			Send ^c
			ClipWait
						
			FileAppend %clipboard%`n, C:\Users\Galdon\Desktop\shovertestoutput.txt			
			tempCountertwo += 1
			tempdownCounter -= 1
			
		}
	sleep, 1000
						
	;Send ^c
	;ClipWait
						
	;FileAppend %clipboard%`n, C:\Users\Galdon\Desktop\shovertestoutput.txt
			
	send, {down}
	tempComparision -= 1
	downcounter -= 1
	
}
}