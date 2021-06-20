

; INTRO=====================================================================================================================================================================================


; Minecraft Reset and Move Script
; Author: onvo, Four & heatvvave
; onvo's reset script
; modified by Four to relocate worlds to reduce world list lag
; edited by heatvvave to borderless window Minecraft, squish to abuse planar and instantly create new world after exiting a world.
; if your runs get denied because of this macro I will not take responsibility for it ok :)
; use original which is more stable and relibleable :)


; READ EVERYTHING!!!
; READ EVERYTHING!!!
; READ EVERYTHING!!!

; WATCH TOUTORIAL VIDEO!!! https://www.youtube.com/watch?v=Fn96HrwepbQ&t=25s
; ALSO GET THIS MOD AND PUT IN MODS FOLDER, IT IS REQUIRED, IN DESCRIPTION OF TOUTORIAL VIDEO AS WELL https://github.com/jan-leila/FastReset/releases/tag/1.3.3


; GUIDE======================================================================================================================================================================================


; Rename all practice worlds to begin with an " _ " to keep them from being relocated
; for the hotkeys, put your hotkeys behind the " :: " (eg:) ( P:: ) <-- here "P" is my hotkey
; ones in borderless window to exit press squish hotkey and press F11 twice


;IMPORTANT===================================================================================================================================================================================


#NoEnv
SavesDirectory = C: ; <--(REPLACE THIS WITH YOUR MINECRAFT SAVES FOLDER)  (eg:)  C:\Users\heatvvave\AppData\Roaming\.minecraft\saves\
SetWorkingDir %SavesDirectory%

#NoEnv
global windowclass:= "Minecraft"


; speed, replace \/ with any number (lower is quicker, keep at 60 recomended)
global delay := 60 ; Frame delay (1 frame = 16.66, round up to be safe)

SetKeyDelay, 0


; EXIT WORLD=================================================================================================================================================================================
; REPLACE 1 BEHIND  ::  WITH HOTKEY==========================================================================================================================================================

#IfWinActive, Minecraft


1:: ; Reset
   ExitWorld()
return


; CREAT WORLD================================================================================================================================================================================
; REPLACE 2 BEHIND  ::  WITH HOTKEY==========================================================================================================================================================

#IfWinActive, Minecraft


2:: ; Create World
   WinGetActiveTitle, Title
   IfNotInString Title, player
   {
      IfWinActive, Minecraft
      {
         CreateWorld()
      }
   }
return


; BORDERLESS WINDOWED========================================================================================================================================================================
; REPLACE A BEHIND  ::  WITH HOTKEY==========================================================================================================================================================

A::
WinActivate ahk_class %windowclass%
WinSet, Style, -0xC40000, A
WinMove, A, , 0, 0, 1920, 1080

Return


; SQUISH TO ABUSE PLANAR=====================================================================================================================================================================
; REPLACE B BEHIND  ::  WITH HOTKEY==========================================================================================================================================================

B::
WinActivate ahk_class %windowclass%
WinSet, Style, -0xC40000, A
WinMove, A, , 8, 30, 1904, 501

Return


; CODE (YOU DON'T HAVE TO MESS WITH THIS)====================================================================================================================================================


SetKeyDelay, 0

IfNotExist, %SavesDirectory%
   msgBox, Please set your saves directory!!!

IfNotExist, %SavesDirectory%_oldWorlds
   FileCreateDir, %SavesDirectory%_oldWorlds

CreateWorld()
{
   send {Tab}{Enter}
   SetKeyDelay, delay
   send {Tab}
   SetKeyDelay, delay
   send {Tab}{Tab}{Enter}{Tab}{Tab}{Enter}{Enter}{Enter}{Tab}{Tab}{Tab}{Tab}
   SetKeyDelay, delay
   send {Tab}{Enter}
  
}

ExitWorld()
{
   send {Esc}+{Tab}{Enter}
   sleep, 150
   Loop, Files, %SavesDirectory%*, D
   {
  	  _Check :=SubStr(A_LoopFileName,1,1)
      If (_Check!="_")
      {
        FileMoveDir, %SavesDirectory%%A_LoopFileName%, %SavesDirectory%_oldWorlds\%A_LoopFileName%%A_NowUTC%, R
   }
}
   send {Tab}{Enter}
   SetKeyDelay, delay
   send {Tab}
   SetKeyDelay, delay
   send {Tab}{Tab}{Enter}{Tab}{Tab}{Enter}{Enter}{Enter}{Tab}{Tab}{Tab}{Tab}
   SetKeyDelay, delay
   send {Tab}{Enter}
  
}

; THE END====================================================================================================================================================================================





