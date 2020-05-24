#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#InstallKeybdHook ; Explicitly enable keyboard hook so we can start logging without declaring any specific hotkey.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Reminder
; hotkey #s:: Windows KEY + s
; hotkey ^s:: Control KEY + s
; hotkey !s:: Alt KEY + s
; hotkey +s:: Maj KEY + s

Number := 0
CtrW := 1
AltW := 2
WinW := 4

LogToFile(TextToLog)
{
	if (%Number% > 0) {
		MsgBox, Validlog
	}
	FileAppend, "Number: ".Number." `n", logger.txt
	FileAppend, %TextToLog%`n, logger.txt
}	

~*LCtrl::	
	Number+=CtrW
return
~*LCtrl Up::
	Number-=CtrW
return
~*LAlt::
	Number+=AltW
return
~*LAlt Up::
	Number-=AltW
return
~*LWin::
	Number+=WinW
return
~*LWin Up::
	Number-=WinW
return
	
*a::	
	logtofile(a_thishotkey " catched")
return