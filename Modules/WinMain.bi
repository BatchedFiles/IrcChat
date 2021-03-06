#ifndef WINMAIN_BI
#define WINMAIN_BI

#include "windows.bi"

Declare Function WinMain( _
	Byval hInst As HINSTANCE, _
	ByVal hPrevInstance As HINSTANCE, _
	ByVal Args As LPSTR Ptr, _
	ByVal ArgsCount As DWORD, _
	ByVal iCmdShow As Long _
)As Integer

Declare Function wWinMain( _
	Byval hInst As HINSTANCE, _
	ByVal hPrevInstance As HINSTANCE, _
	ByVal Args As LPWSTR Ptr, _
	ByVal ArgsCount As DWORD, _
	ByVal iCmdShow As Long _
)As Integer

#endif
