#include "DisplayError.bi"

Sub DisplayErrorW( _
		ByVal dwErrorCode As DWORD, _
		ByVal Caption As LPCWSTR _
	)
	
	Dim Buffer As WString * 100 = Any
	_itow(dwErrorCode, @Buffer, 10)
	
	MessageBoxW(0, @Buffer, Caption, MB_ICONERROR)
	
End Sub
