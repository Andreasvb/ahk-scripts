#SingleInstance, Force
#Persistent
;#UseHook, On
;#InstallKeybdHook
;SendMode Input

SetWorkingDir %A_ScriptDir%

FileInstall, nircmd.exe, %A_WorkingDir%\nircmd.exe


Version:="v1.0"

Menu Tray,NoStandard
Menu Tray,Add,About,goAbout
Menu Tray,Add
Menu Tray,Add,Quit,Exit
Menu Tray,Tip,PUBG Mute %version%
Menu Tray,Default,About

goto, Start

goAbout:
  MyMsg =
  (  
PUBG Mute %version%

Toggle mute active window by pressing Pause

<<< Andreasvb 2017 >>>
  )
  MsgBox, 4160, About, %MyMsg%

start:

; TOGGLE TO MUTE
;#ifWinActive, ahk_class IEFrame
Pause::
{
  Run % A_ScriptDir "\nircmd.exe muteappvolume focused 2"
  return
}

Exit:
ExitApp