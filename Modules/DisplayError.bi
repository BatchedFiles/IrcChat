#ifndef DISPLAYERROR_BI
#define DISPLAYERROR_BI

#include "windows.bi"

Declare Sub DisplayErrorW Alias "DisplayErrorW"( _
	ByVal dwErrorCode As DWORD, _
	ByVal Caption As LPCWSTR _
)

Declare Sub DisplayErrorA Alias "DisplayErrorA"( _
	ByVal dwErrorCode As DWORD, _
	ByVal Caption As LPCSTR _
)

#endif

#ifdef UNICODE
	Declare Sub DisplayError Alias "DisplayErrorW"( _
		ByVal dwErrorCode As DWORD, _
		ByVal Caption As LPCWSTR _
	)
#else
	Declare Sub DisplayError Alias "DisplayErrorA"( _
		ByVal dwErrorCode As DWORD, _
		ByVal Caption As LPCSTR _
	)
#endif
