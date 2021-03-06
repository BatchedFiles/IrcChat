#include "EntryPoint.bi"
#include "WinMain.bi"

#include "windows.bi"
#include "win\shellapi.bi"

#ifdef WITHOUT_RUNTIME
Function EntryPoint Alias "EntryPoint"()As Integer
#endif
	
	Dim RetCode As Integer = Any
	
	Scope
		' Оконные функции: wWinMain() и winMain()
		' Консольные функции: wmain() и main()
		
		Dim ArgsCount As DWORD = Any
		Dim Args As LPWSTR Ptr = CommandLineToArgvW(GetCommandLine(), @ArgsCount)
		RetCode = wWinMain(GetModuleHandle(0), NULL, Args, CInt(ArgsCount), SW_SHOW)
		LocalFree(Args)
		
	End Scope
	
	#ifdef WITHOUT_RUNTIME
		Return RetCode
	#else
		End(RetCode)
	#endif
	
#ifdef WITHOUT_RUNTIME
End Function
#endif
