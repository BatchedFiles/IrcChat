#include "WinMain.bi"
#include "win\shellapi.bi"
#include "win\commctrl.bi"
#include "DisplayError.bi"
#include "MainFormWndProc.bi"
#include "Resources.rh"

Const MainWindowClassName = "MainWindow"

Function wWinMain( _
		Byval hInst As HINSTANCE, _
		ByVal hPrevInstance As HINSTANCE, _
		ByVal Args As LPWSTR Ptr, _
		ByVal ArgsCount As DWORD, _
		ByVal iCmdShow As Long _
	)As Integer	
	
	Dim NineWindowTitle As WString * 256 = Any
	LoadString(hInst, IDS_WINDOWTITLE, @NineWindowTitle, 255)
	
	Scope
		Dim icc As INITCOMMONCONTROLSEX = Any
		icc.dwSize = SizeOf(INITCOMMONCONTROLSEX)
		icc.dwICC = ICC_ANIMATE_CLASS Or _
			ICC_BAR_CLASSES Or _
			ICC_COOL_CLASSES Or _
			ICC_DATE_CLASSES Or _
			ICC_HOTKEY_CLASS Or _
			ICC_INTERNET_CLASSES Or _
			ICC_LINK_CLASS Or _
			ICC_LISTVIEW_CLASSES Or _
			ICC_NATIVEFNTCTL_CLASS Or _
			ICC_PAGESCROLLER_CLASS Or _
			ICC_PROGRESS_CLASS Or _
			ICC_STANDARD_CLASSES Or _
			ICC_TAB_CLASSES Or _
			ICC_TREEVIEW_CLASSES Or _
			ICC_UPDOWN_CLASS Or _
			ICC_USEREX_CLASSES Or _
		ICC_WIN95_CLASSES
		
		If InitCommonControlsEx(@icc) = False Then
			DisplayError(GetLastError(), "Failed to register Common Controls")
			Return 1
		End If
	End Scope
	
	Dim hAccel As HACCEL = LoadAccelerators(hInst, Cast(WString Ptr, ID_ACCEL))
	If hAccel = NULL Then
		DisplayError(GetLastError(), "Failed to load Accelerators")
		Return 1
	End If
	
	Dim wcls As WNDCLASSEX = Any
	With wcls
		.cbSize        = SizeOf(WNDCLASSEX)
		.style         = CS_HREDRAW Or CS_VREDRAW
		.lpfnWndProc   = @MainFormWndProc
		.cbClsExtra    = 0
		.cbWndExtra    = 0
		.hInstance     = hInst
		.hIcon         = LoadIcon(hInst, Cast(WString Ptr, IDR_ICON))
		.hCursor       = LoadCursor(NULL, IDC_ARROW)
		.hbrBackground = Cast(HBRUSH, COLOR_BTNFACE + 1)
		.lpszMenuName  = Cast(WString Ptr, NULL)
		.lpszClassName = @MainWindowClassName
		.hIconSm       = NULL
	End With
	
	If RegisterClassEx(@wcls) = FALSE Then
		DisplayError(GetLastError(), "Failed to register WNDCLASSEX")
		Return 1
	End If
	
	Dim hWndMain As HWND = CreateWindowEx(WS_EX_OVERLAPPEDWINDOW, _
		@MainWindowClassName, _
		NineWindowTitle, _
		WS_OVERLAPPEDWINDOW Or WS_CLIPCHILDREN, _
		CW_USEDEFAULT, _
		CW_USEDEFAULT, _
		CW_USEDEFAULT, _
		CW_USEDEFAULT, _
		NULL, _
		NULL, _
		hInst, _
		NULL _
	)
	
	If hWndMain = NULL Then
		DisplayError(GetLastError(), "Failed to create Main Window")
		Return 1
	End If
	
	ShowWindow(hWndMain, iCmdShow)
	UpdateWindow(hWndMain)
	
	Dim m As MSG = Any
	Dim GetMessageResult As Integer = GetMessage(@m, NULL, 0, 0)
	
	Do While GetMessageResult <> 0
		
		If GetMessageResult = -1 Then
			
			DisplayError(GetLastError(), "Error in GetMessage")
			Return 1
			
		Else
			
			If TranslateAccelerator(hWndMain, hAccel, @m) = 0 Then
				
				' If IsDialogMessage(hWndMain, @m) = 0 Then
					
					TranslateMessage(@m)
					DispatchMessage(@m)
					
				' End If
				
			End If
			
		End If
		
		GetMessageResult = GetMessage(@m, NULL, 0, 0)
		
	Loop
	
	Return m.WPARAM
	
End Function
