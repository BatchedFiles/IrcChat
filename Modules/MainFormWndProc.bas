#include "MainFormWndProc.bi"

Function MainFormWndProc( _
		ByVal hWin As HWND, _
		ByVal wMsg As UINT, _
		ByVal wParam As WPARAM, _
		ByVal lParam As LPARAM _
	)As LRESULT
	
	Select Case wMsg
		
		' Case WM_CREATE
			
		' Case WM_COMMAND
			
		' Case WM_LBUTTONDOWN
			' MainForm_LeftMouseDown(hWin, wParam, GET_X_LPARAM(lParam), GET_Y_LPARAM(lParam))
			
		' Case WM_KEYDOWN
			' MainForm_KeyDown(hWin, wParam)
			
		' Case WM_TIMER
			
			' Select Case wParam
				
				' Case RightEnemyDealCardTimer
					' RightEnemyDealCardTimer_Tick(hWin)
					
				' Case PlayerDealCardTimer
					' PlayerDealCardTimer_Tick(hWin)
					
				' Case LeftEnemyDealCardTimer
					' LeftEnemyDealCardTimer_Tick(hWin)
					
				' Case BankDealPackTimer
					' BankDealPackTimer_Tick(hWin)
					
				' Case BankDealPackRightEnemyTimer
					' BankDealPackRightEnemyTimer_Tick(hWin)
					
				' Case BankDealPackPlayerTimer
					' BankDealPackPlayerTimer_Tick(hWin)
					
				' Case BankDealPackLeftEnemyTimer
					' BankDealPackLeftEnemyTimer_Tick(hWin)
					
				' Case BankDealPackFinishTimer
					' BankDealPackFinishTimer_Tick(hWin)
					
			' End Select
			
		' Case WM_PAINT
			' MainForm_Paint(hWin)
			
		' Case WM_DRAWITEM 
			' MainForm_DrawItem(hWin, Cast(HWND, wParam), CPtr(DRAWITEMSTRUCT Ptr, lParam))
			
		' Case WM_SIZE
			' MainForm_ReSize(hWin, wParam, LoWord(lParam), HiWord(lParam))
			
		' Case WM_CLOSE
			' MainForm_Close(hWin)
			
		Case WM_DESTROY
			' MainForm_UnLoad(hWin)
			' DeleteObject(BackColorBrush)
			PostQuitMessage(0)
			
		Case Else
			Return DefWindowProc(hWin, wMsg, wParam, lParam)
			
	End Select
	
	Return 0
	
End Function
