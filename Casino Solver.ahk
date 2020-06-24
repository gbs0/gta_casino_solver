#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1
XP1 := A_ScreenWidth / 6
YP1 := A_ScreenHeight / 6
XP2 := A_ScreenWidth / 2
YP2 := A_ScreenHeight - (A_ScreenHeight / 6)

XK1 := A_ScreenWidth / 6
YK1 := A_ScreenHeight / 6
XK2 := A_ScreenWidth - (A_ScreenWidth / 3)
YK2 := A_ScreenHeight - (A_ScreenHeight / 6)

X := A_ScreenWidth / 2
Y := A_ScreenHeight / 6
Z := A_ScreenWidth - (A_ScreenWidth / 4)

IfNotExist, %A_ScriptDir%\%A_ScreenWidth%x%A_ScreenHeight%\1.bmp
{
ToolTip , Unsuported Resolution, 0, 0, 17
Sleep, 4000
ToolTip , Exiting script, 0, 0, 17
Sleep, 4000
Exitapp
}

Loop
{
ToolTip , Script idle, 0, 0, 17
Sleep, 5000
}

^R::Reload

^T::Exitapp

^E::
ToolTip , Print active, 0, 0, 17
Loop
{	
	Pmatch(1, XP1, YP1, XP2, YP2)
	Pmatch(2, XP1, YP1, XP2, YP2)
	Pmatch(3, XP1, YP1, XP2, YP2)
	Pmatch(4, XP1, YP1, XP2, YP2)
	Pmatch(5, XP1, YP1, XP2, YP2)
	Pmatch(6, XP1, YP1, XP2, YP2)
	Pmatch(7, XP1, YP1, XP2, YP2)
	Pmatch(8, XP1, YP1, XP2, YP2)
	Pmatch(9, XP1, YP1, XP2, YP2)
	Pmatch(10, XP1, YP1, XP2, YP2)
	Pmatch(11, XP1, YP1, XP2, YP2)
	Pmatch(12, XP1, YP1, XP2, YP2)
	Pmatch(13, XP1, YP1, XP2, YP2)
	Pmatch(14, XP1, YP1, XP2, YP2)
	Pmatch(15, XP1, YP1, XP2, YP2)
	Pmatch(16, XP1, YP1, XP2, YP2)
}
Return


^D::
ToolTip , Keypad active, 0, 0, 17
Loop
{
	Kmatch(1, XK1, YK1, XK2, YK2)
	Kmatch(2, XK1, YK1, XK2, YK2)
	Kmatch(3, XK1, YK1, XK2, YK2)
	Kmatch(4, XK1, YK1, XK2, YK2)
	Kmatch(5, XK1, YK1, XK2, YK2)
	Kmatch(6, XK1, YK1, XK2, YK2)
}
Return

Pmatch(N, XP1, YP1, XP2, YP2)
{
	ImageSearch, FoundX, FoundY, %XP1%, %YP1%, %XP2%, %YP2%, *50 %A_ScriptDir%\%A_ScreenWidth%x%A_ScreenHeight%\%N%.bmp
        If ErrorLevel = 0 
	{
        ToolTip , Match%N%, FoundX, FoundY-20,%N%
	}
	Else
	{
	ToolTip ,, FoundX, FoundY,%N%
	}
}

Kmatch(N, XK1, YK1, XK2, YK2)
{
	ImageSearch, FoundX, FoundY, %XK1%, %YK1%, %XK2%, %YK2%, *180 %A_ScriptDir%\%A_ScreenWidth%x%A_ScreenHeight%\key.bmp
        If ErrorLevel = 0 
	{
        ToolTip , Match%N%, FoundX, FoundY,%N%
	}
}

Clear(S)
{
	ToolTip ,, FoundX, FoundY,%S%
}