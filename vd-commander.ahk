#Requires AutoHotkey v2.0
#SingleInstance Force

;--------------<{ ; layer }> 

global powerPinky := false

`;:: {
    global powerPinky
    KeyWait(";", "T0.15") ; Wait up to 200ms for release

    if (!GetKeyState(";", "P")) {
        ; Tap detected
        SendText(";")
    } else {
        ; Hold detected;
        powerPinky := true
        ; Wait until key is released
        KeyWait(";")
        powerPinky := false
    }
}  

; The above creates a layer when you hold down ";". I personally prefer this for faster switching.

#HotIf powerPinky

; Escape common patterns
w::Send(":w")
q::Send(":q")

; VD Commander integration
1:: Run("python .\main.py --switch 1", , "Hide")
2:: Run("python .\main.py --switch 2", , "Hide")
3:: Run("python .\main.py --switch 3", , "Hide")
4:: Run("python .\main.py --switch 4", , "Hide")
5:: Run("python .\main.py --switch 5", , "Hide")
6:: Run("python .\main.py --switch 6", , "Hide")

w:: Send "!{f4}"

#HotIf

; This Should move windows between zones of parent monitor...
!#l::Send "#{Right}"
!#h::Send "#{Left}"
!#k::Send "#{Up}"
!#j::Send "#{Down}"

; This Should move windows between screens...
+^l::Send "+#{Right}"
+^h::Send "+#{Left}"

; Some alt F4 action!
#w:: Send "!{f4}"

;----------------------------<{ VD Commander }> 
#1:: Run("python .\main.py --switch 1", , "Hide")
#2:: Run("python .\main.py --switch 2", , "Hide")
#3:: Run("python .\main.py --switch 3", , "Hide")
#4:: Run("python .\main.py --switch 4", , "Hide")
#5:: Run("python .\main.py --switch 5", , "Hide")
#6:: Run("python .\main.py --switch 6", , "Hide")

!1:: Run("python .\main.py --move 1", , "Hide")
!2:: Run("python .\main.py --move 2", , "Hide")
!3:: Run("python .\main.py --move 3", , "Hide")
!4:: Run("python .\main.py --move 4", , "Hide")
!5:: Run("python .\main.py --move 5", , "Hide")
!6:: Run("python .\main.py --move 6", , "Hide")

#!1:: Run("python .\main.py --follow 1", , "Hide")
#!2:: Run("python .\main.py --follow 2", , "Hide")
#!3:: Run("python .\main.py --follow 3", , "Hide")
#!4:: Run("python .\main.py --follow 4", , "Hide")
#!5:: Run("python .\main.py --follow 5", , "Hide")
#!6:: Run("python .\main.py --follow 6", , "Hide")

#p:: Run("python .\main.py --pin", , "Hide")

;----------------------------<{ Key Legend }> 
; # = Windows Key
; ! = Alt Key
; ^ = Control
; + = Shift
; {Left} = left
; {Enter} = Enter
; {Home} = Home
; {End} = End
; {PgUp} = Page Up
; {PgDn} = Page Down
; {F1} - {F24} = Function keys


