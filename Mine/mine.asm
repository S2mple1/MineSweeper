.386
.model flat,stdcall
option casemap:none

include		windows.inc
include		gdi32.inc
includelib	gdi32.lib
include		user32.inc
includelib	user32.lib
include		kernel32.inc
includelib	kernel32.lib
include		winmm.inc
includelib	winmm.lib
include		shell32.inc
includelib	shell32.lib
include		msvcrt.inc
includelib 	msvcrt.lib
;===============================================================
IDD_MINE_DIALOG		equ		102
IDR_MAINFRAME		equ		128
IDR_MENU			equ		129
IDB_MINE_COLOR		equ		131
IDB_BTN_GRAY		equ		132
IDB_MINE_GRAY		equ		133
IDB_NUM_COLOR		equ		134
IDB_NUM_GRAY		equ		135
IDB_BTN_COLOR		equ		136
IDR_WAVE_DEAD		equ		139
IDR_WAVE_CLOCK		equ		140
IDR_WAVE_VICTORY	equ		141
IDD_DLG_NEWRECORD	equ		142
IDD_DLG_HERO		equ		143
IDD_DLG_CUSTOM 		equ		144
IDD_DLG_RULE		equ		145
IDD_DLG_INFO        equ     146
IDC_EDIT_NAME		equ		1000
IDC_RESET			equ		1001
IDC_B_R				equ		1002
IDC_B_H				equ		1003
IDC_I_R				equ		1004
IDC_I_H				equ		1005
IDC_E_R				equ		1006
IDC_E_H				equ		1007
IDC_DESCRIBE		equ		1008
IDC_HEIGHT			equ		1009
IDC_WIDTH			equ		1010
IDC_NUMBER			equ		1011
IDC_R1              equ     1012
IDC_R2              equ     1013
IDC_R3              equ     1014
IDC_R4              equ     1015
IDM_START			equ		32771
IDM_PRIMARY			equ		32772
IDM_SECOND			equ		32773
IDM_ADVANCE			equ		32774
IDM_CUSTOM			equ		32775
IDM_MARK			equ		32776
IDM_COLOR			equ		32777
IDM_SOUND			equ		32778
IDM_HERO			equ		32779
IDM_EXIT			equ		32780
IDM_RULE			equ		32782
IDM_ABOUT			equ		32784
;==============================================================
DEFAULT_FRAME_X		equ		16				;窗口X方向宽
DEFAULT_FRAME_Y		equ		60				;窗口Y方向宽
LINE_WIDTH_0		equ		3				;线边0的宽度
LINE_WIDTH_1		equ		2				;线边1的宽度
SIDE_WIDTH_0		equ		6				;边0的宽度
SIDE_WIDTH_1		equ		5				;边1的宽度
SHELL_S_H			equ		37				;小外壳的高度
SHELL_S_START_X		equ		9				;小外壳的x坐标始发点
SHELL_S_START_Y		equ		9				;小外壳的y坐标始发点
SHELL_L_START_X		equ		9				;大外壳的x坐标始发点
SHELL_L_START_Y		equ		52 				;大外壳的y坐标始发点
MINEAREA_FRAME_X	equ		12				;左侧间距
MINEAREA_FRAME_Y	equ		55				;顶部间距
MINE_WIDTH			equ		16				;雷方块的宽度为16
MINE_HEIGHT			equ		16				;雷方块的长度为16
MINE_AREA_LEFT		equ		12				;左侧边距
MINE_AREA_TOP		equ		55				;顶部边距
STATE_NORMAL		equ		0				;正常状态
STATE_FLAG			equ		1				;插旗标记
STATE_DICEY			equ		2				;不确定状态1
STATE_BLAST			equ		3				;爆炸状态
STATE_ERROR			equ		4				;错误状态
STATE_MINE			equ		5				;有雷状态
STATE_DICEY_DOWN	equ		6				;不确定状态2
STATE_NUM8			equ		7				;周围有8个雷
STATE_NUM7			equ		8				;周围有7个雷		
STATE_NUM6			equ		9				;周围有6个雷
STATE_NUM5			equ		10				;周围有5个雷
STATE_NUM4			equ		11				;周围有4个雷
STATE_NUM3			equ		12				;周围有3个雷
STATE_NUM2			equ		13				;周围有2个雷
STATE_NUM1			equ		14				;周围有1个雷
STATE_EMPTY			equ		15				;周围没有雷
ATTRIB_EMPTY		equ		0				;不含地雷
ATTRIB_MINE			equ		1				;包含地雷
DEFAULT_RECORD		equ		666				;默认时间记录
COLOR_BLACK			equ		0
COLOR_DARK_GRAY		equ		128+128*256+128*256*256
COLOR_GRAY			equ		192+192*256+256*256*192
COLOR_WHITE			equ		255+255*256+256*256*255
PRIMARY_XNUM		equ		9				;初级x宽度
PRIMARY_YNUM		equ		9				;初级y宽度
PRIMARY_MINENUM		equ		10				;初级地雷个数
SECONDARY_XNUM		equ		16				;中级x宽度
SECONDARY_YNUM		equ		16				;中级y宽度
SECONDARY_MINENUM	equ		40				;中级地雷个数
ADVANCE_XNUM		equ		30				;高级x宽度
ADVANCE_YNUM		equ		16				;高级x宽度
ADVANCE_MINENUM		equ		99				;高级地雷个数
; 游戏状态
GameState_WAIT		equ		0				;等待开始
GameState_RUN		equ		1				;进行中
GameState_DEAD		equ		2				;游戏失败
GameState_VICTORY	equ		3				;游戏胜利
; 游戏级别
LEVEL_PRIMARY		equ		0				;初级
LEVEL_SECONDARY		equ		1				;中级
LEVEL_ADVANCE		equ		2				;高级
LEVEL_CUSTOM		equ		3				;自定义
; 笑脸按钮状态
BUTTON_DOWN			equ		0				;被按下
BUTTON_VICTORY		equ		1				;游戏胜利
BUTTON_DEAD			equ		2				;游戏失败
BUTTON_CLICK		equ		3				;点击别处
BUTTON_NORMAL		equ		4				;正常状态
ID_TIMER_EVENT		equ		20				;计时器
;==============================================================
.data?
hInstance			HINSTANCE	?
hWinMain			HWND		?
hMenu 				HMENU		?
g_dc				dword 		?
MINESTRUCT struct
	uRow			UINT 	?;所在雷区二维数组的行
	uCol			UINT 	?;所在雷区二位数组的列
	uNowState		UINT 	?;方块当前状态
	uAttribute		UINT 	?;方块属性
	uOldState		UINT 	?;方块历史状态
MINESTRUCT ends
g_uXNum				UINT 	?;X方向小方块个数
g_uYNum				UINT 	?;Y方向小方块个数
g_uMineNum			UINT 	?;总的雷个数
g_nLeaveNum			dword 	?;剩余的雷个数
g_uSpendTime		UINT 	?
g_uGameState		UINT 	?;游戏状态
g_uTimer			UINT 	?
g_uNewState 		UINT 	?
g_uLevel 			UINT 	?;当前游戏等级
g_uPrimary 			UINT 	?
g_uSecond 			UINT 	?
g_uAdvance 			UINT 	?
g_szPrimary 		CHAR 20 dup(?)
g_szSecond 			CHAR 20 dup(?)
g_szAdvance 		CHAR 20 dup(?)
g_bLRBtnDown 		BOOL 	?
g_bClickBtn 		BOOL 	?
g_bMarkful 			BOOL 	?
g_bColorful 		BOOL 	?
g_bSoundful 		BOOL 	?
g_pSubMenu 			HMENU 	?

g_bmpMine 			HBITMAP ?
g_bmpNumber 		HBITMAP ?
g_bmpButton 		HBITMAP ?
g_brsBG 			HBRUSH 	?
g_clrDark 			COLORREF ?
g_uBtnRect 			UINT 3 dup(?)
g_uBtnState 		UINT 	?
g_uNumRect 			UINT 3 dup(?)
g_uShellRcX 		UINT 2 dup(?)
g_uShellRcY 		UINT 2 dup(?)
g_rcClient 			RECT 	<>
point 				POINT 	<>
rcBtn 				RECT 	<>
rcMineArea 			RECT 	<>
g_pMines 			MINESTRUCT 100*100 dup(<>)
g_pNewMine 			dword 	?
g_pOldMine 			dword 	?
g_pSndDead 			dword 	?
g_pSndVictory 		dword 	?
g_strPath 			CHAR MAX_PATH dup(?)
;==============================================================
	.const
szClassName			CHAR	'MineClass',0
szRule				CHAR	'规则',0
szAbout				CHAR	'开发者：周豪捷——北京理工大学2021级计算机学院',0
szCaptionMain 		CHAR	'扫雷',0
szconfigPath 		CHAR 	'\config.ini',0;
szWINDOW 			CHAR 	'WINDOW',0
szXNum 				CHAR 	'XNum',0
szYNum 				CHAR 	'YNum',0
szMINE 				CHAR 	'MINE',0
szMineNum 			CHAR 	'MineNum',0
szLevel 			CHAR 	'Level',0
szSCORE 			CHAR	'SCORE',0
szPrimary 			CHAR 	'Primary',0
szSecond 			CHAR 	'Second',0
szAdvance 			CHAR 	'Advance',0
szHOLDER 			CHAR 	'HOLDER',0
szPrimaryHolder		CHAR	'PrimaryHolder',0
szSecondHolder 		CHAR	'SecondHolder',0
szAdvanceHolder		CHAR	'AdvanceHolder',0
szNiMing 			CHAR 	'神秘人',0
szCONFIG 			CHAR	'CONFIG',0
szMarkful 			CHAR 	'Markful',0
szColorful 			CHAR 	'Colorful',0
szSoundful 			CHAR 	'Soundful',0
szBu 				CHAR	'%u',0
szBd 				CHAR	'%d',0
szWAVE 				CHAR 	'WAVE',0
szBdm 				CHAR 	'%d秒',0
szChuji 			CHAR 	'初级',0
szZhongji  			CHAR	'中级',0
szGaoji 			CHAR 	'高级',0
szwww 				CHAR 	'打破%s记录！',0dh,0ah,'留下您的姓名：',0
;==============================================================
; 代码段
	.code
DrawArea1 proc uses eax ebx ecx edx esi edi
local dcMemory
local temp1
local temp2
local temp3
local temp4
	invoke CreateCompatibleDC, g_dc
	mov dcMemory, eax
	invoke SelectObject, dcMemory, g_bmpMine
	mov esi, 0
	mov edi, 0
	mov eax, 0 
	.while eax < g_uYNum
		mov ebx, 0 ; j
		.while ebx < g_uXNum
			pushad
			mov ecx, 16
			mul ecx
			mov temp2, eax
			add temp2, MINEAREA_FRAME_Y
			mov eax, ebx
			mov ecx, 16
			mul ecx
			mov temp1, eax
			add temp1, MINEAREA_FRAME_X
			mov eax, dword ptr g_pMines[esi + 8]
			mov ecx, 16
			mul ecx
			mov temp3, eax
			invoke StretchBlt, g_dc, temp1, temp2, 16, 16, dcMemory, 0, temp3, 16, 16, SRCCOPY
			popad
			inc ebx
			add esi, 20
		.endw
		inc eax
		add edi, 2000
		mov esi, edi
	.endw
	invoke DeleteObject, g_bmpMine
	invoke ReleaseDC, hWinMain, dcMemory
	ret
DrawArea1 endp
;===============================================================
OpenToMine proc uses ecx edx ebx esi edi row, col
local minRow
local maxRow
local minCol
local maxCol
local around
local temp
	mov temp,eax
	.if eax != temp
		ret
	.endif
	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
	mov maxRow ,eax
	add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2
	mov eax,minRow
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,minCol
	mov ecx,20
	mul ecx
	add esi,eax
	mov edi,esi
	mov eax,minRow
	.while eax<maxRow
		mov ebx,minCol
		.while  ebx<maxCol
			push eax
			.if !eax
				pop eax
				inc ebx
				add esi,20
				.continue;
			.endif
			pop eax
			.if dword ptr g_pMines[esi+8]== STATE_NORMAL
				push eax
				push ebx
				pop ebx
				pop eax
				push eax
				push ebx
				mov around ,eax
				mov eax,15
				sub eax,around
				mov dword ptr g_pMines[esi+8] ,eax
				mov dword ptr g_pMines[esi+16] ,eax
				pop ebx
				pop eax
			.endif
			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw
ret
OpenToMine endp
;===============================================================
Dead proc uses ecx edx esi ebx eax row, col
local timersound
	mov eax,g_uBtnRect[4]
	mov rcBtn.left,eax
	mov eax,g_uBtnRect[8]
	mov rcBtn.right,eax
	mov eax,g_uXNum
	mov ecx,MINE_WIDTH
	mul ecx
	add eax,MINE_AREA_LEFT
	mov rcMineArea.right,eax
	mov eax, g_uYNum
	mov ecx,MINE_HEIGHT
	mul ecx
	add eax,MINE_AREA_TOP
	mov rcMineArea.bottom,eax
	mov eax,row
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,col
	mov ecx,20
	mul ecx
	add esi,eax
	.if dword ptr g_pMines[esi+12]== ATTRIB_MINE ;失败
		mov esi,0
		mov edi,0
		mov eax,0
		.while eax<g_uYNum
			mov ebx,0
			.while  ebx<g_uXNum

				.if (dword ptr g_pMines[esi+12] == ATTRIB_MINE)&& (dword ptr g_pMines[esi+8] != STATE_FLAG)
					mov dword ptr g_pMines[esi+8] , STATE_MINE
					mov dword ptr g_pMines[esi+16] , STATE_MINE
				.endif
				inc ebx
				add esi,20
			.endw
			inc eax
			add edi,2000
			mov esi,edi
		.endw
		mov eax,row
		mov ecx,2000
		mul ecx
		mov esi,eax
		mov eax,col
		mov ecx,20
		mul ecx
		add esi,eax
		mov dword ptr g_pMines[esi+8],STATE_BLAST
		mov dword ptr g_pMines[esi+16],STATE_BLAST
	.else  ;错误
		mov esi,0
		mov edi,0
		mov eax,0
		.while eax<g_uYNum
			mov ebx,0
			.while  ebx<g_uXNum
				.if (dword ptr g_pMines[esi+12] == ATTRIB_MINE)&& (dword ptr g_pMines[esi+8] != STATE_FLAG)

					mov dword ptr g_pMines[esi+8] , STATE_MINE;
					mov dword ptr g_pMines[esi+16] , STATE_MINE;
				.endif
				inc ebx
				add esi,20
			.endw
			inc eax
			add edi,2000
			mov esi,edi
		.endw
		mov eax,row
		mov ecx,2000
		mul ecx
		mov esi,eax
		mov eax,col
		mov ecx,20
		mul ecx
		add esi,eax
		mov dword ptr g_pMines[esi+8],STATE_ERROR
		mov dword ptr g_pMines[esi+16],STATE_ERROR
	.endif
	;失败
	mov g_uBtnState , BUTTON_DEAD;
	mov g_uGameState , GameState_DEAD;
	invoke InvalidateRect,hWinMain,addr rcMineArea,0
	invoke InvalidateRect,hWinMain,addr rcBtn,0
	.if g_uTimer != 0
    ;将定时器去激活
		invoke KillTimer,hWinMain,ID_TIMER_EVENT
		mov g_uTimer , 0
	.endif
	.if g_bSoundful
		invoke LockResource,g_pSndDead
		mov timersound,eax
		invoke sndPlaySound,timersound, SND_MEMORY or SND_ASYNC or SND_NODEFAULT
	.endif
	ret
Dead endp
;==============================================================
LayMines proc uses ecx edx esi ebx eax row, col
local tempt
local i
local j
local tempa
local ok
	invoke crt_time ,NULL
	invoke crt_srand,eax
	assume esi :ptr MINESTRUCT
	mov ebx,0
	mov tempa,0
	.while ebx <g_uMineNum
		invoke crt_rand
		mov edx,0
		mov ecx,g_uYNum
		div ecx
		mov i,edx
		invoke crt_rand
		mov edx,0
		mov ecx, g_uXNum
		div ecx
		mov j,edx
		mov eax,i
		.if (eax == row )&&(edx ==col)
			.continue
		.endif
		mov eax,i
		mov ecx,2000
		mul ecx
		mov ok,eax
		mov eax,j
		mov ecx,20
		mul ecx
		add ok,eax
		mov esi,offset g_pMines
		add esi,ok

		.if [esi].uAttribute != ATTRIB_MINE
			mov [esi].uAttribute, ATTRIB_MINE
			inc ebx
		.endif
	.endw
	assume esi :nothing
	ret
LayMines endp
;==============================================================
IsMine proc uses ecx edx esi row,col
local temp
	mov eax,offset g_pMines
	mov temp,eax
	mov eax,row
	mov ecx,2000
	mul ecx
	add temp,eax
	mov eax,col
	mov ecx,20
	mul ecx
	add temp,eax
	mov esi,temp
	assume esi :ptr MINESTRUCT
	mov eax,[esi].uAttribute
	.if eax== ATTRIB_MINE
		mov eax,1
	.else
		mov eax,0
	.endif
	assume esi :nothing
	ret
IsMine endp
;==============================================================
DrawANum proc uses esi ecx edx mine, num
local rcMine:RECT
assume esi :ptr MINESTRUCT
	mov esi, mine
	mov eax, 15
	sub eax, num
	mov [esi].uNowState, eax
	mov [esi].uOldState, eax
	mov eax, [esi].uCol
	mov ecx, 16
	mul ecx
	mov rcMine.left, eax
	add eax, 16
	mov rcMine.right, eax
	mov eax, [esi].uRow
	mov ecx, 16
	mul ecx
	mov rcMine.top, eax
	add eax, 16
	mov rcMine.bottom, eax
	invoke InvalidateRect, hWinMain, addr rcMine, 0
	assume esi : nothing
	ret
DrawANum endp
;==============================================================
GetMine proc uses ecx edx x, y
local uCol
local uRow
    .if (x < MINEAREA_FRAME_X) || (y < MINEAREA_FRAME_Y)
        mov eax, 0
        ret
    .endif
    mov edx, 0
    mov eax, x
    sub eax, MINEAREA_FRAME_X
    mov ecx, 16
    div ecx
    mov ecx, 20
    mul ecx
    mov uCol, eax
    mov edx, 0
    mov eax, y
    sub eax, MINEAREA_FRAME_Y
    mov ecx, 16
    div ecx
    mov ecx, 2000
    mul ecx
    mov uRow, eax
    mov eax, offset g_pMines
    add eax, uRow
    add eax, uCol
    ret
GetMine endp
;==============================================================
DrawDownNum proc uses esi ecx edx mine, num
local rcMine:RECT
assume esi :ptr MINESTRUCT
	mov esi, mine
	mov eax, 15
	sub eax, num
	mov [esi].uNowState, eax
	mov [esi].uOldState, eax
	mov eax, [esi].uCol
	mov ecx, 16
	mul ecx
	mov rcMine.left, eax
	add eax, 16
	mov rcMine.right, eax
	mov eax, [esi].uRow
	mov ecx, 16
	mul ecx
	mov rcMine.top, eax
	add eax, 16
	mov rcMine.bottom, eax
	invoke InvalidateRect, hWinMain, addr rcMine, 0
	assume esi : nothing
	ret
DrawDownNum endp
;==============================================================
IsInMineArea proc uses ecx row, col
    ; 获取雷区的行数和列数
    mov eax, g_uYNum
    mov ecx, g_uXNum
    ; 检查坐标是否在雷区范围内
    .if (row >= 0) && (eax > row) && (col >= 0) && (ecx > col)
        mov eax, 1  ; 如果在雷区内，设置 eax 为 1
        ret
    .endif
    ; 如果不在雷区内，设置 eax 为 0
    mov eax, 0
    ret
IsInMineArea endp
;==============================================================
FillSolidRect proc hdc, x, y, cc, cy, clr
local rect:RECT
    ; 设置背景颜色为指定的颜色
    invoke SetBkColor, hdc, clr
    ; 设置矩形的左、右、上、下边界
    mov eax, x
    mov rect.left, eax
    add eax, cc
    mov rect.right, eax
    mov eax, y
    mov rect.top, eax
    add eax, cy
    mov rect.bottom, eax
    invoke ExtTextOut, hdc, 0, 0, ETO_OPAQUE, addr rect, NULL, 0, NULL
    ret
FillSolidRect endp
;==============================================================
Draw3dRect proc hdc, x, y, cc, cy, clrTopLeft, clrBottomRight
local temp
    ; 绘制左边框
	mov eax, cc
	dec eax
	mov temp, eax
	invoke FillSolidRect, hdc, x, y, temp, 1, clrTopLeft
	mov eax, cy
	dec eax
	mov temp, eax
    ; 绘制上边框
	invoke FillSolidRect, hdc, x, y, 1, temp, clrTopLeft
	mov eax, x
	add eax, cc
	mov temp, eax
    ; 绘制右边框
	invoke FillSolidRect, hdc, temp, y, -1, cy, clrBottomRight
	mov eax, y
	add eax, cy
	mov temp, eax
    ; 绘制下边框
	invoke FillSolidRect, hdc, x, temp, cc, -1, clrBottomRight
	ret
Draw3dRect endp
;=======================================================================================================================
DrawNumber proc uses edx esi edi ecx eax ebx
local dcMemory
local temp
local num
local numtemp
local oi
	invoke CreateCompatibleDC, g_dc
	mov dcMemory, eax
	invoke SelectObject, dcMemory, g_bmpNumber
    ; 绘制矩形边框
	invoke Draw3dRect, g_dc, 16, 15, 41, 25, g_clrDark, COLOR_WHITE
	invoke Draw3dRect, g_dc, g_uNumRect[0], 15, 41, 25, g_clrDark, COLOR_WHITE
	mov oi, 0
    ; 绘制剩余雷数的百位数字
	cmp g_nLeaveNum, 0
	jge Tn1
	mov eax, 11
	jmp Tn2
Tn1:
	mov eax, g_nLeaveNum
	mov ecx, 100
	mov edx, 0
	div ecx
	mov num, eax
Tn2:
	add eax, 1
	mov ecx, 23
	mul ecx
	sub eax, 276
	neg eax
	mov numtemp, eax
	invoke StretchBlt, g_dc, g_uNumRect[0], 16, 13, 23, dcMemory, 0, numtemp, 13, 23, SRCCOPY
    ; 绘制剩余雷数的十位数字
	cmp g_nLeaveNum, 0
	jge Tn3
	mov oi, 1
	mov eax, g_nLeaveNum
	neg eax
	mov g_nLeaveNum, eax
	mov ecx, 100
	mov edx, 0
	div ecx
	mov num, eax
Tn3:
	mov eax, num
	mov ecx, 100
	mul ecx
	sub eax, g_nLeaveNum
	neg eax
	mov edx, 0
	mov ecx, 10
	div ecx
	mov num, eax
	add eax, 1
	mov ecx, 23
	mul ecx
	sub eax, 276
	neg eax
	mov numtemp, eax
	mov eax, g_uNumRect[0]
	add eax, 13
	mov temp, eax
	invoke StretchBlt, g_dc, temp, 16, 13, 23, dcMemory, 0, numtemp, 13, 23, SRCCOPY
    ; 绘制剩余雷数的个位数字
	mov eax, g_nLeaveNum
	mov ecx, 10
	mov edx, 0
	div ecx
	mov eax, edx
	mov num, eax
	add eax, 1
	mov ecx, 23
	mul ecx
	sub eax, 276
	neg eax
	mov numtemp, eax
	add temp, 13
	invoke StretchBlt, g_dc, temp, 16, 13, 23, dcMemory, 0, numtemp, 13, 23, SRCCOPY
	.if oi == 1
		mov eax, g_nLeaveNum
		neg eax
		mov g_nLeaveNum, eax
	.endif
    ; 绘制时间的百位数字
	mov edx, 0
	mov eax, g_uSpendTime
	mov ecx, 100
	div ecx
	mov num, eax
	add eax, 1
	mov ecx, 23
	mul ecx
	sub eax, 276
	neg eax
	mov numtemp, eax
	invoke StretchBlt, g_dc, 17, 16, 13, 23, dcMemory, 0, numtemp, 13, 23, SRCCOPY
    ; 绘制时间的十位数字
	mov eax, num
	mov ecx, 100
	mul ecx
	sub eax, g_uSpendTime
	neg eax
	mov edx, 0
	mov ecx, 10
	div ecx
	mov num, eax
	add eax, 1
	mov ecx, 23
	mul ecx
	sub eax, 276
	neg eax
	mov numtemp, eax
	invoke StretchBlt, g_dc, 30, 16, 13, 23, dcMemory, 0, numtemp, 13, 23, SRCCOPY
    ; 绘制时间的个位数字
	mov eax, g_uSpendTime
	mov ecx, 10
	mov edx, 0
	div ecx
	mov eax, edx
	mov num, eax
	add eax, 1
	mov ecx, 23
	mul ecx
	sub eax, 276
	neg eax
	mov numtemp, eax
	invoke StretchBlt, g_dc, 43, 16, 13, 23, dcMemory, 0, numtemp, 13, 23, SRCCOPY
	invoke DeleteObject, g_bmpNumber
	invoke ReleaseDC, hWinMain, dcMemory
	ret
DrawNumber endp
;=======================================================================================================================
DrawMineArea proc uses eax ebx ecx edx esi edi
local dcMemory
local temp
local t1
local t2
local t3
	invoke CreateCompatibleDC, g_dc
	mov dcMemory, eax
	invoke SelectObject, dcMemory, g_bmpMine
	mov esi, 0
	mov edi, 0
    ; 循环遍历雷区的行
	mov eax, 0
	.while eax < g_uYNum
		mov ebx, 0
		.while ebx < g_uXNum
			pushad
            ; 计算绘制位置
			mov ecx, 16
			mul ecx
			mov t2, eax
			add t2, MINEAREA_FRAME_Y
			mov eax, ebx
			mov ecx, 16
			mul ecx
			mov t1, eax
			add t1, MINEAREA_FRAME_X
			mov eax, dword ptr g_pMines[esi + 8]
			mov ecx, 16
			mul ecx
			mov t3, eax
			invoke StretchBlt, g_dc, t1, t2, 16, 16, dcMemory, 0, t3, 16, 16, SRCCOPY
			popad
			inc ebx
			add esi, 20 ; 移动到下一列
		.endw
		inc eax
		add edi, 2000 ; 移动到下一行
		mov esi, edi
	.endw
	invoke DeleteObject, g_bmpMine
	invoke ReleaseDC, hWinMain, dcMemory
	ret
DrawMineArea endp
;=======================================================================================================================
DrawButton proc uses edx esi edi ecx eax ebx
local ButtonDc
local temp
	invoke CreateCompatibleDC, g_dc
	mov ButtonDc, eax
	mov eax, g_uBtnState
	mov ecx, 24
	mul ecx
	mov temp, eax
    ; 选择位图
	invoke SelectObject, ButtonDc, g_bmpButton
    ; 绘制按钮的图像
	invoke StretchBlt, g_dc, g_uBtnRect[0], 16, 24, 24, ButtonDc, 0, temp, 24, 24, SRCCOPY
	invoke DeleteObject, g_bmpButton
    ; 在按钮的边框上绘制立体效果
	invoke Draw3dRect, g_dc, g_uBtnRect[4], 15, 26, 26, g_clrDark, g_clrDark
	invoke ReleaseDC, hWinMain, ButtonDc
	ret
DrawButton endp
;=======================================================================================================================
DrawShell proc uses  edx esi edi ecx eax ebx
local rect:RECT
local temp
local tempt
    ; 绘制两条白色条纹
	mov rect.left, 0
	mov rect.top, 0
	mov eax, g_uShellRcX[0]
	mov rect.right, eax
	mov rect.bottom, LINE_WIDTH_0
	invoke FillRect, g_dc, addr rect, COLOR_WHITE
	mov rect.left, 0
	mov rect.top, 0
	mov rect.right, LINE_WIDTH_0
	mov eax, g_uShellRcY[0]
	mov rect.bottom, eax
	invoke FillRect, g_dc, addr rect, COLOR_WHITE
    ; 画小的外壳
	invoke Draw3dRect, g_dc, SHELL_S_START_X, SHELL_S_START_Y, \
	g_uShellRcX[4], SHELL_S_H, g_clrDark, COLOR_WHITE
	mov eax, g_uShellRcX[4]
	sub eax, 2
	mov temp, eax
	invoke Draw3dRect, g_dc, SHELL_S_START_X + 1, SHELL_S_START_Y + 1, \
	temp, SHELL_S_H - 2, g_clrDark, COLOR_WHITE
	mov eax, g_uShellRcY[4]
	sub eax, 2
	mov tempt, eax
    ; 画大的外壳
	invoke Draw3dRect, g_dc, SHELL_L_START_X, SHELL_L_START_Y, \
	g_uShellRcX[4], g_uShellRcY[4], g_clrDark, COLOR_WHITE
	invoke Draw3dRect, g_dc, SHELL_L_START_X + 1, SHELL_L_START_Y + 1, \
	temp, tempt, g_clrDark, COLOR_WHITE
	sub temp, 2
	sub tempt, 2
	invoke Draw3dRect, g_dc, SHELL_L_START_X + 2, SHELL_L_START_Y + 2, \
	temp, tempt, g_clrDark, COLOR_WHITE
	ret
DrawShell endp

;=======================================================================================================================
DrawSpecialMine proc uses ecx row, col
local rcMine:RECT
    ; 计算雷方块的矩形区域
	mov eax, col
	mov ecx, 16
	mul ecx
	mov rcMine.left, eax
	add eax, 16
	mov rcMine.right, eax
	mov eax, row
	mov ecx, 16
	mul ecx
	mov rcMine.top, eax
	add eax, 16
	mov rcMine.bottom, eax
	invoke InvalidateRect, hWinMain, addr rcMine, 0
	ret
DrawSpecialMine endp
;=======================================================================================================================
LoadWaveSrc proc
local hSrc:HRSRC
    ; 加载死亡音效资源
	invoke FindResource, hInstance, IDR_WAVE_DEAD, addr szWAVE
	mov hSrc, eax
	invoke LoadResource, hInstance, hSrc
	mov g_pSndDead, eax
    ; 加载胜利音效资源
	invoke FindResource, hInstance, IDR_WAVE_VICTORY, addr szWAVE
	mov hSrc, eax
	invoke LoadResource, hInstance, hSrc
	mov g_pSndVictory, eax

	ret
LoadWaveSrc endp
;=======================================================================================================================
FreeWaveSrc proc
	; 释放死亡音效资源
	.if g_pSndDead
		invoke FreeResource, g_pSndDead
		mov g_pSndDead, NULL
	.endif
	; 释放胜利音效资源
	.if g_pSndVictory
		invoke FreeResource, g_pSndVictory
		mov g_pSndVictory, NULL
	.endif

	ret
FreeWaveSrc endp
;=======================================================================================================================
LoadConfig proc
	invoke GetCurrentDirectory, MAX_PATH, addr g_strPath
	invoke lstrcat, addr g_strPath, addr szconfigPath
	; 从配置文件中读取窗口的 X、Y 方向小方块个数和雷的总数
	invoke GetPrivateProfileInt, addr szWINDOW, addr szXNum, 9, addr g_strPath
	mov g_uXNum, eax
	invoke GetPrivateProfileInt, addr szWINDOW, addr szYNum, 9, addr g_strPath
	mov g_uYNum, eax
	invoke GetPrivateProfileInt, addr szMINE, addr szMineNum, 10, addr g_strPath
	mov g_uMineNum, eax
	; 从配置文件中读取游戏等级和记录信息
	invoke GetPrivateProfileInt, addr szMINE, addr szLevel, 0, addr g_strPath
	mov g_uLevel, eax
	invoke GetPrivateProfileInt, addr szSCORE, addr szPrimary, 666, addr g_strPath
	mov g_uPrimary, eax
	invoke GetPrivateProfileInt, addr szSCORE, addr szSecond, 666, addr g_strPath
	mov g_uSecond, eax
	invoke GetPrivateProfileInt, addr szSCORE, addr szAdvance, 666, addr g_strPath
	mov g_uAdvance, eax
	; 从配置文件中读取记录保持者的信息
	invoke GetPrivateProfileString, addr szHOLDER, addr szPrimaryHolder, addr szNiMing, addr g_szPrimary, 80, addr g_strPath
	invoke GetPrivateProfileString, addr szHOLDER, addr szSecondHolder, addr szNiMing, addr g_szSecond, 80, addr g_strPath
	invoke GetPrivateProfileString, addr szHOLDER, addr szAdvanceHolder, addr szNiMing, addr g_szAdvance, 80, addr g_strPath
	; 从配置文件中读取彩色显示和声音开关的设置
	invoke GetPrivateProfileInt, addr szCONFIG, addr szColorful, 1, addr g_strPath
	mov g_bColorful, eax
	invoke GetPrivateProfileInt, addr szCONFIG, addr szSoundful, 1, addr g_strPath
	mov g_bSoundful, eax
	ret
LoadConfig endp
;=======================================================================================================================
;保存程序配置信息到.ini文件
SaveConfig proc
local strXNum[5]:CHAR;雷区行列数
local strYNum[5]:CHAR
local strMineNum[5]:CHAR
local strLevel[5]:CHAR ;雷数 选择级别
local strPrimary[5]:CHAR ;记录保持分数
local strSecond[5]:CHAR
local strAdvance[5]:CHAR ;记录保持者
local strMarkful[5]:CHAR
local strColorful[5]:CHAR
local strSoundful[5]:CHAR

	invoke  wsprintf,addr strXNum,addr szBu,g_uXNum
	invoke  wsprintf,addr strYNum,addr szBu,g_uYNum
	invoke  wsprintf,addr strMineNum,addr szBu,g_uMineNum
	invoke   wsprintf,addr strLevel,addr szBu,g_uLevel
	invoke   wsprintf, addr strPrimary,addr szBu,g_uPrimary
	invoke wsprintf, addr strSecond,addr szBu,g_uSecond
	invoke   wsprintf,addr strAdvance,addr szBu,g_uAdvance
	invoke   wsprintf,addr strColorful,addr szBd,g_bColorful
	invoke  wsprintf, addr strSoundful,addr szBd,g_bSoundful

	invoke  WritePrivateProfileString,addr szWINDOW,addr szXNum ,  addr strXNum,addr g_strPath
	invoke  WritePrivateProfileString,addr szWINDOW,addr szYNum ,  addr strYNum,addr g_strPath
	invoke  WritePrivateProfileString,addr szMINE,addr szMineNum ,  addr strMineNum,addr g_strPath
	invoke  WritePrivateProfileString,addr szMINE,addr  szLevel ,  addr strLevel,addr g_strPath
	invoke    WritePrivateProfileString,addr szSCORE, addr szPrimary ,  addr strPrimary,addr g_strPath
	invoke  WritePrivateProfileString,addr szSCORE, addr szSecond ,  addr strSecond,addr g_strPath
	invoke  WritePrivateProfileString,addr szSCORE, addr szAdvance ,  addr strAdvance,addr g_strPath

	invoke  WritePrivateProfileString,addr szHOLDER, addr szPrimaryHolder , addr g_szPrimary,addr g_strPath
	invoke  WritePrivateProfileString,addr szHOLDER, addr szSecondHolder ,  addr g_szSecond,addr g_strPath
	invoke  WritePrivateProfileString,addr szHOLDER, addr szAdvanceHolder ,  addr g_szAdvance,addr g_strPath

	invoke  WritePrivateProfileString,addr szCONFIG, addr szColorful ,  addr strColorful,addr g_strPath
	invoke WritePrivateProfileString,addr szCONFIG, addr szSoundful , addr  strSoundful,addr g_strPath
	ret
SaveConfig endp

;=======================================================================================================================
SizeWindow proc uses edx ecx eax
local uWidth:UINT
local uHeight:UINT
	mov eax,g_uXNum
	mov ecx,MINE_WIDTH
	mul ecx
	add eax,DEFAULT_FRAME_X +  LINE_WIDTH_0 * 3 + SIDE_WIDTH_0 + SIDE_WIDTH_1
	mov uWidth ,eax
	mov eax,g_uYNum
	mov ecx,MINE_HEIGHT
	mul ecx
	add eax,DEFAULT_FRAME_Y +  LINE_WIDTH_0 * 3 + SIDE_WIDTH_0 * 2 + SIDE_WIDTH_1 + SHELL_S_H
	mov uHeight ,eax
	; 计算并设置主窗口的大小，确保雷区、计时器、按钮、外壳等都能完全显示在窗口中
	invoke SetWindowPos,hWinMain,HWND_TOPMOST, 0, 0, uWidth, uHeight,\
	SWP_NOZORDER or SWP_NOMOVE or SWP_NOCOPYBITS
	invoke GetClientRect,hWinMain,addr g_rcClient
	mov eax,g_rcClient.right
	mov g_uNumRect[0] ,eax
	sub g_uNumRect[0],55
	mov g_uNumRect[4] ,eax
	sub g_uNumRect[4],15
	mov g_uNumRect[8]  ,eax
	sub g_uNumRect[8],54
	mov g_uShellRcX[0]  ,eax
	mov g_uShellRcX[4]  ,eax
	sub g_uShellRcX[4] ,14
	mov edx,0
	mov ecx,2
	div ecx
	mov g_uBtnRect[0] ,eax
	sub g_uBtnRect[0] ,12
	mov g_uBtnRect[4] ,eax
	sub g_uBtnRect[4] ,13
	mov g_uBtnRect[8] , eax
	add g_uBtnRect[8] ,12
	mov eax,g_rcClient.bottom
	mov    g_uShellRcY[0] ,eax				
	mov    g_uShellRcY[4],eax
	sub g_uShellRcY[4],SHELL_L_START_Y
	sub g_uShellRcY[4],5
	ret
SizeWindow endp
;=======================================================================================================================
SetCheckedLevel proc
	invoke CheckMenuItem,       hMenu  ,IDM_PRIMARY, MF_UNCHECKED or MF_BYCOMMAND
	invoke  CheckMenuItem,hMenu,IDM_SECOND, MF_UNCHECKED or MF_BYCOMMAND
	invoke  CheckMenuItem,hMenu,IDM_ADVANCE, MF_UNCHECKED or MF_BYCOMMAND
	invoke  CheckMenuItem,hMenu,IDM_CUSTOM, MF_UNCHECKED or MF_BYCOMMAND
	.if g_uLevel ==LEVEL_PRIMARY
		invoke       CheckMenuItem,hMenu,IDM_PRIMARY, MF_CHECKED or MF_BYCOMMAND

	.elseif g_uLevel == LEVEL_SECONDARY
		invoke        CheckMenuItem,hMenu,IDM_SECOND, MF_CHECKED or MF_BYCOMMAND

	.elseif g_uLevel == LEVEL_ADVANCE
		invoke        CheckMenuItem,hMenu,IDM_ADVANCE, MF_CHECKED or MF_BYCOMMAND

	.elseif g_uLevel == LEVEL_CUSTOM
		invoke        CheckMenuItem,hMenu,IDM_CUSTOM, MF_CHECKED or MF_BYCOMMAND

	.endif
	ret
SetCheckedLevel  endp
;=======================================================================================================================
SetCheckedMark proc
	; 根据全局变量 g_bMarkful 的值设置菜单项 IDM_MARK 的选中状态
	.if g_bMarkful
		invoke CheckMenuItem,hMenu,IDM_MARK, MF_CHECKED or MF_BYCOMMAND
	.else
		invoke CheckMenuItem,hMenu,IDM_MARK, MF_UNCHECKED or MF_BYCOMMAND
	.endif
	ret
SetCheckedMark endp
;=======================================================================================================================
SetCheckedColor proc
	; 根据全局变量 g_bColorful 的值设置菜单项 IDM_COLOR 的选中状态
	.if g_bColorful
		invoke CheckMenuItem,hMenu,IDM_COLOR, MF_CHECKED or MF_BYCOMMAND
	.else
		invoke CheckMenuItem,hMenu,IDM_COLOR, MF_UNCHECKED or MF_BYCOMMAND
	.endif
	ret
SetCheckedColor endp
;=======================================================================================================================
SetCheckedSound proc
	; 根据全局变量 g_bSoundful 的值设置菜单项 IDM_SOUND 的选中状态
	.if g_bSoundful
		invoke CheckMenuItem,hMenu,IDM_SOUND, MF_CHECKED or MF_BYCOMMAND
	.else
		invoke CheckMenuItem,hMenu,IDM_SOUND, MF_UNCHECKED or MF_BYCOMMAND
	.endif
	ret
SetCheckedSound endp
;=======================================================================================================================
Loadmap proc
	; 根据全局变量 g_bColorful 加载相应的位图资源，并设置颜色
	.if g_bColorful
		mov g_clrDark ,COLOR_DARK_GRAY
		invoke DeleteObject,g_bmpMine
		invoke LoadBitmap,hInstance,IDB_MINE_COLOR
		mov g_bmpMine,eax
		invoke DeleteObject,g_bmpNumber
		invoke LoadBitmap,hInstance,IDB_NUM_COLOR
		mov  g_bmpNumber,eax
		invoke DeleteObject,g_bmpButton
		invoke LoadBitmap,hInstance, IDB_BTN_COLOR
		mov g_bmpButton,eax
	.else
		mov g_clrDark ,COLOR_BLACK
		invoke DeleteObject,g_bmpMine
		invoke LoadBitmap,hInstance, IDB_MINE_GRAY
		mov g_bmpMine,eax
		invoke DeleteObject,g_bmpNumber
		invoke LoadBitmap,hInstance, IDB_NUM_GRAY
		mov  g_bmpNumber,eax
		invoke DeleteObject,g_bmpButton
		invoke LoadBitmap,hInstance, IDB_BTN_GRAY
		mov g_bmpButton,eax
	.endif
	ret
Loadmap endp
;=======================================================================================================================
InitGame proc uses ebx edi esi eax ecx edx
	; 初始化游戏相关变量，包括地图、雷数、计时器等
	invoke Loadmap
	mov eax,g_uMineNum
	mov g_nLeaveNum ,eax
	mov g_uSpendTime , 0
	mov g_uBtnState, BUTTON_NORMAL
	mov g_uGameState , GameState_WAIT
	; 如果计时器已启动，停止计时器
	.if g_uTimer
		invoke KillTimer,hWinMain,ID_TIMER_EVENT
		mov g_uTimer , 0
	.endif
	mov g_pNewMine ,NULL
	mov g_pOldMine , NULL
	; 初始化地图
	mov esi,0
	mov edi,0
	mov eax,0
	.while eax<g_uYNum
		mov ebx,0
		.while  ebx<g_uXNum
			mov dword ptr g_pMines[esi],eax
			mov dword ptr g_pMines[esi+4],ebx
			mov dword ptr g_pMines[esi+8],STATE_NORMAL
			mov dword ptr g_pMines[esi+12], ATTRIB_EMPTY
			mov dword ptr g_pMines[esi+16], STATE_NORMAL
			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw
	ret
InitGame endp
;=======================================================================================================================
DlgCProc	proc	uses ebx edi esi hDlg,message,wParam,lParam
	; 自定义难度对话框的处理过程
	local tempw[10]:CHAR
	local temph[10]:CHAR
	local tempm[10]:CHAR
	local temp
	mov eax,message
	.if eax==WM_INITDIALOG
		; 在对话框初始化时，将全局变量中的值填充到编辑框中
		invoke crt__itoa,g_uXNum, addr tempw, 10
		invoke GetDlgItem ,hDlg, IDC_WIDTH
		mov temp,eax
		invoke SetWindowText,temp, addr tempw

		invoke crt__itoa,g_uYNum, addr temph, 10
		invoke GetDlgItem ,hDlg,  IDC_HEIGHT
		mov temp,eax
		invoke SetWindowText,temp, addr temph

		invoke crt__itoa,g_uMineNum, addr tempm, 10
		invoke GetDlgItem ,hDlg,  IDC_NUMBER
		mov temp,eax
		invoke SetWindowText,temp, addr tempm

	.elseif eax==WM_COMMAND
		mov eax,wParam
		movzx eax,ax
		.if eax== IDOK
			; 在用户点击确定按钮时，获取编辑框中的值，更新全局变量
			invoke GetDlgItem ,hDlg, IDC_WIDTH
			mov temp,eax
			invoke    GetWindowText,temp, addr tempw,10
			invoke GetDlgItem ,hDlg,  IDC_HEIGHT
			mov temp,eax
			invoke           GetWindowText,temp, addr temph,10
			invoke GetDlgItem ,hDlg,  IDC_NUMBER
			mov temp,eax
			invoke          GetWindowText,temp, addr tempm,10
			invoke crt_atoi,addr tempw
			mov g_uXNum ,eax
			invoke crt_atoi,addr temph
			mov g_uYNum ,eax
			invoke crt_atoi,addr tempm
			mov g_uMineNum ,eax
			; 对输入值进行合理性检查
			.if g_uXNum < 9
				mov g_uXNum , 9
			.endif
			.if g_uXNum > 30
				mov g_uXNum , 30
			.endif
			.if g_uYNum < 9
				mov g_uYNum , 9
			.endif
			.if g_uYNum > 24
				mov g_uYNum , 24
			.endif
			.if g_uMineNum < 10
				mov g_uMineNum , 10
			.endif
			mov eax,g_uXNum
			dec eax
			mov ecx,g_uYNum
			dec ecx
			mul ecx
			.if eax<g_uMineNum
				mov g_uMineNum , eax
			.endif
			; 关闭对话框
			invoke EndDialog,hDlg, 0
			mov eax,1
			ret
		.elseif eax==IDCANCEL
            invoke EndDialog,hDlg, 0
            mov eax,1
            ret
		.endif
	.endif
	mov eax,0
	ret
DlgCProc endp

DlgHProc	proc	uses ebx edi esi hDlg,message,wParam,lParam
	; 排行榜对话框的处理过程
	local tempw[10]:CHAR
	local temph[10]:CHAR
	local tempm[10]:CHAR
	local temp
	mov eax,message
	.if eax==WM_INITDIALOG
		; 在对话框初始化时，将全局变量中的值填充到编辑框中
		invoke wsprintf,addr tempw,addr szBdm,g_uPrimary
		invoke       wsprintf,addr temph,addr szBdm,g_uSecond
		invoke      wsprintf,addr tempm,addr szBdm,g_uAdvance
		invoke GetDlgItem,hDlg, IDC_B_R
		mov temp,eax
		invoke SetWindowText,temp,addr tempw
		invoke GetDlgItem,hDlg, IDC_I_R
		mov temp,eax
		invoke        SetWindowText,temp, addr temph
		invoke GetDlgItem,hDlg, IDC_E_R
		mov temp,eax
		invoke       SetWindowText,temp, addr tempm
		invoke GetDlgItem,hDlg, IDC_B_H
		mov temp,eax
		invoke             SetWindowText,temp,addr g_szPrimary
		invoke GetDlgItem,hDlg, IDC_I_H
		mov temp,eax
		invoke            SetWindowText,temp,addr  g_szSecond
		invoke GetDlgItem,hDlg, IDC_E_H
		mov temp,eax
		invoke           SetWindowText,temp,addr g_szAdvance
	.elseif eax==WM_COMMAND
		mov eax,wParam
		movzx eax,ax
		.if eax==  IDC_RESET
			; 重置按钮，将英雄榜中的数据重置为默认值
			invoke crt_strcpy ,addr g_szPrimary,addr szNiMing
			invoke          crt_strcpy ,addr g_szSecond,addr szNiMing
			invoke			crt_strcpy ,addr g_szAdvance,addr szNiMing
			mov			g_uPrimary,DEFAULT_RECORD
			mov			g_uSecond,DEFAULT_RECORD
			mov			g_uAdvance,DEFAULT_RECORD
			; 更新编辑框中的值
			invoke wsprintf,addr tempw,addr szBdm,g_uPrimary
			invoke       wsprintf,addr temph,addr szBdm,g_uSecond
			invoke      wsprintf,addr tempm,addr szBdm,g_uAdvance
			invoke GetDlgItem,hDlg, IDC_B_R
			mov temp,eax
			invoke SetWindowText,temp,addr tempw
			invoke GetDlgItem,hDlg, IDC_I_R
			mov temp,eax
			invoke        SetWindowText,temp, addr temph
			invoke GetDlgItem,hDlg, IDC_E_R
			mov temp,eax
			invoke       SetWindowText,temp, addr tempm
			invoke GetDlgItem,hDlg, IDC_B_H
			mov temp,eax
			invoke             SetWindowText,temp,addr g_szPrimary
			invoke GetDlgItem,hDlg, IDC_I_H
			mov temp,eax
			invoke            SetWindowText,temp,addr  g_szSecond
			invoke GetDlgItem,hDlg, IDC_E_H
			mov temp,eax
			invoke           SetWindowText,temp,addr g_szAdvance
		.elseif eax== IDOK
			invoke EndDialog ,hDlg, 0
			mov eax,1
			ret
		.elseif eax== IDCANCEL
			invoke EndDialog ,hDlg, 0
			mov eax,1
			ret
		.endif
	.endif
	mov eax,0
	ret
DlgHProc endp
;======================================================================
DlgNProc	proc	uses ebx edi esi hDlg,message,wParam,lParam
local sztLevel[6]:CHAR
local szDesc[50]:CHAR
local szName[10]:CHAR
local temp
	mov eax,message
	.if eax==WM_INITDIALOG
		.if g_uLevel == LEVEL_PRIMARY
			invoke crt_strcpy,addr sztLevel,addr szChuji
		.elseif g_uLevel == LEVEL_SECONDARY
			invoke crt_strcpy,addr sztLevel,addr szZhongji
		.elseif g_uLevel == LEVEL_ADVANCE
			invoke crt_strcpy,addr sztLevel,addr szGaoji
		.endif
		invoke wsprintf,addr szDesc,addr szwww, addr sztLevel
		invoke        GetDlgItem,hDlg, IDC_EDIT_NAME
		mov temp ,eax
		invoke SetWindowText,temp, addr szNiMing;
		invoke GetDlgItem,hDlg, IDC_DESCRIBE
		mov temp ,eax
		invoke  SetWindowText,temp, addr szDesc
	.elseif eax==WM_COMMAND
		mov eax,wParam
		movzx eax,ax
		.if eax==IDOK
			invoke GetDlgItem,hDlg, IDC_EDIT_NAME
			mov temp ,eax
			invoke  GetWindowText,temp, addr szName,10
			.if g_uLevel==LEVEL_PRIMARY
				mov eax, g_uSpendTime;
				mov g_uPrimary,eax
				invoke         crt_strcpy,addr g_szPrimary,addr szName

			.elseif g_uLevel==LEVEL_SECONDARY
				mov eax, g_uSpendTime;
				mov g_uSecond,eax

				invoke     crt_strcpy,addr g_szSecond,addr szName

			.elseif g_uLevel==LEVEL_ADVANCE
				mov eax, g_uSpendTime
				mov g_uAdvance,eax
				invoke crt_strcpy,addr g_szAdvance,addr szName

			.elseif g_uLevel==LEVEL_CUSTOM

			.endif

			invoke EndDialog,hDlg, 0
			mov eax,1
			ret

		.endif
	.endif
	mov eax,0
	ret

DlgNProc endp
;=======================================================================================================================
Victory proc
local timersound
local ok

	mov eax,g_uBtnRect[4]
	mov rcBtn.left,eax
	mov eax,g_uBtnRect[8]
	mov rcBtn.right,eax
	mov ok,0
	mov esi,0
	mov edi,0
	mov eax,0
	.while eax<g_uYNum
		mov ebx,0
		.while  ebx<g_uXNum
			.if dword ptr g_pMines[esi+8] == STATE_NORMAL
				inc ok
			.endif
			.if dword ptr g_pMines[esi+8] == STATE_DICEY
				inc ok
			.endif
			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw
	mov eax,ok
	.if eax!=g_nLeaveNum
		mov eax,0
		ret
	.endif
	mov esi,0
	mov edi,0
	mov eax,0
	.while eax<g_uYNum
		mov ebx,0
		.while  ebx<g_uXNum
			.if (dword ptr g_pMines[esi+8] == STATE_NORMAL)|| (dword ptr g_pMines[esi+8] == STATE_DICEY)
				mov dword ptr g_pMines[esi+8] ,STATE_FLAG;
			.endif
			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw
	mov g_nLeaveNum , 0
	;胜利则作胜利处理
	mov g_uBtnState ,BUTTON_VICTORY
	mov g_uGameState , GameState_VICTORY
	invoke InvalidateRect,hWinMain,NULL,0
	.if g_uTimer != 0
		invoke KillTimer,hWinMain,ID_TIMER_EVENT
		mov g_uTimer , 0
	.endif
	.if g_bSoundful
		invoke LockResource,g_pSndVictory
		mov timersound,eax
		invoke sndPlaySound,timersound, SND_MEMORY or SND_ASYNC or SND_NODEFAULT
	.endif

	.if (g_uLevel == LEVEL_PRIMARY)
		mov eax, g_uPrimary
	.elseif (g_uLevel == LEVEL_SECONDARY)
		mov eax,  g_uSecond
	.elseif (g_uLevel == LEVEL_ADVANCE)
		mov eax,  g_uAdvance
	.endif

	.if (eax > g_uSpendTime)

		invoke DialogBoxParam,hInstance,IDD_DLG_NEWRECORD,hWinMain,DlgNProc,NULL
		invoke DialogBoxParam,hInstance,IDD_DLG_HERO,hWinMain,DlgHProc,NULL
	.endif
	mov eax,1
	ret
Victory endp
;=======================================================================================================================
;  获取某个小方块区域相邻8个区域的雷个数
GetAroundNum proc uses ebx ecx edx esi edi row, col
local around
local minRow
local maxRow
local minCol
local maxCol

	mov  around,0
	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
	mov maxRow ,eax
	add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2

	mov eax,minRow
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,minCol
	mov ecx,20
	mul ecx
	add esi,eax
	mov edi,esi
	mov eax,minRow
	.while eax<maxRow
		mov ebx,minCol
		.while  ebx<maxCol
			push eax
			push ebx
			invoke IsInMineArea,eax,ebx
			.if !eax
				pop ebx
				pop eax
				inc ebx
				add esi,20
				.continue
			.endif
			.if dword ptr g_pMines[esi+12]== ATTRIB_MINE
				inc around
			.endif
			pop ebx
			pop eax

			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw
	mov eax,around
	ret
GetAroundNum endp
;=======================================================================================================================
Expand proc uses ecx edx ebx esi edi row, col
local around
local minRow
local maxRow
local minCol
local maxCol

	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
	mov maxRow ,eax
	add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2
	invoke     GetAroundNum,row, col
	mov around ,eax
	mov eax,row
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,col
	mov ecx,20
	mul ecx
	add esi,eax
	mov eax,15
	sub eax,around
	mov dword ptr g_pMines[esi+8] , eax
	mov dword ptr g_pMines[esi+16] ,eax

	;重绘
	invoke DrawSpecialMine,row, col

	;对周围一个雷都没有的空白区域
	.if around == 0
		mov eax,minRow
		mov ecx,2000
		mul ecx
		mov esi,eax
		mov eax,minCol
		mov ecx,20
		mul ecx
		add esi,eax
		mov edi,esi
		mov eax,minRow
		.while eax<maxRow
			mov ebx,minCol
			.while  ebx<maxCol

				.if eax != row || ebx != col
					.if dword ptr g_pMines[esi+8]== STATE_NORMAL
						.if dword ptr g_pMines[esi+12]!= ATTRIB_MINE
							push eax
							invoke IsInMineArea,eax,ebx
							.if !eax
								pop eax
								inc ebx
								add esi,20
								.continue;
							.endif
							pop eax
							push eax
							invoke Expand,eax,ebx
							pop eax
						.endif
					.endif
				.endif

				inc ebx
				add esi,20
			.endw
			inc eax
			add edi,2000
			mov esi,edi
		.endw

	.endif
	ret
Expand endp

;=======================================================================================================================
OnLRBtnDown proc uses ecx edx ebx esi edi row, col
local minRow
local maxRow
local minCol
local maxCol

	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
	mov maxRow ,eax
	add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2
	mov eax,minRow
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,minCol
	mov ecx,20
	mul ecx
	add esi,eax
	mov edi,esi
	mov eax,minRow
	.while eax<maxRow
		mov ebx,minCol
		.while  ebx<maxCol
			push eax
			invoke IsInMineArea,eax,ebx
			.if !eax
				pop eax
				inc ebx
				add esi,20
				.continue
			.endif
			pop eax
			.if dword ptr g_pMines[esi+8]== STATE_NORMAL
				mov dword ptr g_pMines[esi+8] , STATE_EMPTY

			.elseif dword ptr g_pMines[esi+8]== STATE_DICEY
				mov  dword ptr g_pMines[esi+8] , STATE_DICEY_DOWN
			.endif

			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw

	ret
OnLRBtnDown endp

OnLRBtnUp proc uses ecx edx ebx esi edi row, col
local minRow
local maxRow
local minCol
local maxCol

	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
    mov maxRow ,eax
    add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2
	mov eax,minRow
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,minCol
	mov ecx,20
	mul ecx
	add esi,eax
	mov edi,esi
	mov eax,minRow
	.while eax<maxRow
		mov ebx,minCol
		.while  ebx<maxCol

			push eax
			invoke IsInMineArea,eax,ebx
			.if !eax
				pop eax
				inc ebx
				add esi,20
				.continue;
			.endif
			pop eax

			.if dword ptr g_pMines[esi+16]== STATE_NORMAL

				mov dword ptr g_pMines[esi+8] , STATE_NORMAL

			.elseif dword ptr g_pMines[esi+16]== STATE_DICEY

				mov  dword ptr g_pMines[esi+8] , STATE_DICEY
			.endif

			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw

	ret
OnLRBtnUp endp
;=======================================================================================================================
GetAroundFlags proc uses ecx edx ebx esi edi row, col
local flags
local minRow
local maxRow
local minCol
local maxCol
    mov  flags , 0;
	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
    mov maxRow ,eax
    add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2
	mov eax,minRow
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,minCol
	mov ecx,20
	mul ecx
	add esi,eax
	mov edi,esi
	mov eax,minRow
	.while eax<maxRow
		mov ebx,minCol
		.while  ebx<maxCol
			push eax
			invoke IsInMineArea,eax,ebx
			.if !eax
				pop eax
				inc ebx
				add esi,20
				.continue;
			.endif
			pop eax

			.if dword ptr g_pMines[esi+8]== STATE_FLAG
				inc flags
			.endif

			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw

    mov eax,flags
    ret
GetAroundFlags endp
;=======================================================================================================================
OpenAround proc uses ecx edx ebx esi edi row, col
local minRow
local maxRow
local minCol
local maxCol
local around
local temp
   ; 如果周围相邻的标志雷数 != 周围相邻的雷数 则返回
	invoke GetAroundFlags,row, col
	mov temp,eax
	invoke GetAroundNum,row, col
	.if eax != temp

		ret
	.endif
	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
	mov maxRow ,eax
	add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2
	mov eax,minRow
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,minCol
	mov ecx,20
	mul ecx
	add esi,eax
	mov edi,esi
	mov eax,minRow
	.while eax<maxRow
		mov ebx,minCol
		.while  ebx<maxCol
			push eax
			invoke IsInMineArea,eax,ebx
			.if !eax
				pop eax
				inc ebx
				add esi,20
				.continue;
			.endif
			pop eax

			.if dword ptr g_pMines[esi+8]== STATE_NORMAL;如果该区域为正常区域
				;拓展该雷区
				push eax
				push ebx
				invoke Expand,eax,ebx
				pop ebx
				pop eax
				push eax
				push ebx
				invoke GetAroundNum,eax,ebx
				mov around ,eax
				mov eax,15
				sub eax,around
				mov dword ptr g_pMines[esi+8] ,eax
				mov dword ptr g_pMines[esi+16] ,eax
				pop ebx
				pop eax
			.endif
			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw

ret
OpenAround endp
;=======================================================================================================================
ErrorAroundFlag proc uses ecx edx ebx esi edi row, col
local minRow
local maxRow
local minCol
local maxCol
local temp
    ;如果周围相邻的标志雷数不等于周围相邻的雷数，则返回
    invoke GetAroundFlags,row, col
    mov temp,eax
	invoke GetAroundNum,row, col
	.if eax != temp
		mov eax,0
		ret
	.endif
	.if row == 0
		mov minRow,0
	.else
		mov eax,row
		mov minRow,eax
		dec minRow
	.endif
	mov eax,row
	mov maxRow ,eax
	add maxRow ,2
	.if col== 0
		mov minCol ,0
	.else
		mov eax,col
		mov minCol ,eax
		dec minCol
	.endif
	mov eax,col
	mov maxCol  ,eax
	add maxCol  ,2
	mov eax,minRow
	mov ecx,2000
	mul ecx
	mov esi,eax
	mov eax,minCol
	mov ecx,20
	mul ecx
	add esi,eax

	mov edi,esi
	mov eax,minRow
	.while eax<maxRow
		mov ebx,minCol
		.while  ebx<maxCol
			push eax
			invoke IsInMineArea,eax,ebx
			.if !eax
				pop eax
				inc ebx
				add esi,20
				.continue
			.endif
			pop eax
			.if dword ptr g_pMines[esi+8]== STATE_FLAG
				.if dword ptr g_pMines[esi+12] != ATTRIB_MINE
					invoke Dead,eax,ebx
					mov eax,1
					ret
				.endif
			.endif
			inc ebx
			add esi,20
		.endw
		inc eax
		add edi,2000
		mov esi,edi
	.endw
	mov eax,0
    ret
ErrorAroundFlag endp

;=======================================================================================================================
; 窗口
ProcWinMain	proc	uses ebx edi esi hWnd,uMsg,wParam,lParam
local	Ps:PAINTSTRUCT
local	@stRect:RECT
local	hdc
local	timersound
local	dcMemory
local	bitmap
local	around
	mov	eax,uMsg
;============================================================================================
	.if	eax ==	WM_COMMAND
		mov eax,wParam
		movzx eax,ax
		.if eax==IDM_EXIT
			invoke SendMessage,hWnd,WM_CLOSE,0,0
		.elseif eax== IDM_START;开局按钮
			invoke InitGame
			invoke InvalidateRect,hWnd,NULL,0


		.elseif eax== IDM_PRIMARY;初级按钮
			mov g_uLevel , LEVEL_PRIMARY
			mov g_uXNum , PRIMARY_XNUM
			mov g_uYNum , PRIMARY_YNUM
			mov g_uMineNum , PRIMARY_MINENUM

			invoke SetCheckedLevel
			invoke InitGame
			invoke SizeWindow
			invoke InvalidateRect,hWnd,NULL,0

		.elseif eax== IDM_SECOND;中级按钮
			mov           g_uLevel , LEVEL_SECONDARY
			mov           g_uXNum , SECONDARY_XNUM
			mov         g_uYNum , SECONDARY_YNUM
			mov          g_uMineNum , SECONDARY_MINENUM

			invoke SetCheckedLevel
			invoke InitGame
			invoke SizeWindow
			invoke InvalidateRect,hWnd,NULL,0

		.elseif eax== IDM_ADVANCE;高级按钮
			mov          g_uLevel , LEVEL_ADVANCE
			mov          g_uXNum , ADVANCE_XNUM
			mov        g_uYNum , ADVANCE_YNUM
			mov       g_uMineNum , ADVANCE_MINENUM

			invoke SetCheckedLevel
			invoke InitGame
			invoke SizeWindow
			invoke InvalidateRect,hWnd,NULL,0

		.elseif eax== IDM_CUSTOM;/自定义
			mov    g_uLevel , LEVEL_CUSTOM
			invoke SetCheckedLevel

			invoke DialogBoxParam,hInstance,IDD_DLG_CUSTOM,hWnd,DlgCProc,NULL;
			invoke InitGame
			invoke SizeWindow
			invoke InvalidateRect,hWnd,NULL,0

		

		.elseif eax== IDM_COLOR;颜色
			.if g_bColorful==0
				mov g_bColorful,1
			.else
				mov g_bColorful,0
			.endif
			invoke           SetCheckedColor

			invoke InvalidateRect,hWnd,NULL,0

		.elseif eax== IDM_SOUND;声音
			.if g_bSoundful==0
				mov g_bSoundful,1
			.else
				mov g_bSoundful,0
			.endif

			invoke SetCheckedSound
			.if g_bSoundful
				invoke LoadWaveSrc
			.else
				invoke FreeWaveSrc
			.endif

		.elseif eax== IDM_HERO;排行榜
			invoke DialogBoxParam,hInstance,IDD_DLG_HERO,hWnd,DlgHProc,NULL

		.elseif eax== IDM_RULE;规则
			invoke DialogBoxParam,hInstance,IDD_DLG_RULE,hWnd,DlgHProc,NULL

		.elseif eax== IDM_ABOUT;关于
			invoke DialogBoxParam,hInstance,IDD_DLG_INFO,hWnd,DlgHProc,NULL
		.endif
;============================================================================================
 	.elseif	eax ==WM_LBUTTONUP
		mov eax,lParam
		movzx eax,ax
		mov point.x,eax
		mov eax,lParam
		shr eax,16
		movzx eax,ax
		mov point.y,eax

		;笑脸图按钮所在的区域
		mov eax,g_uBtnRect[4];
		mov rcBtn.left,eax
		mov eax,g_uBtnRect[8];
		mov rcBtn.right,eax

		;雷区所在的区域
		mov eax,g_uXNum
		mov ecx,MINE_WIDTH
		mul ecx
		add eax,MINE_AREA_LEFT
		mov rcMineArea.right,eax

		mov eax, g_uYNum
		mov ecx,MINE_HEIGHT;
		mul ecx
		add eax,MINE_AREA_TOP
		mov rcMineArea.bottom,eax

		invoke PtInRect,addr rcBtn,point.x,point.y
		.if eax
			invoke InvalidateRect,hWinMain,NULL,0
			invoke           InitGame
			jmp lb1
		.else
			invoke PtInRect,addr rcMineArea,point.x,point.y
			.if eax 
				mov around , 0
				.if g_uGameState==GameState_WAIT || g_uGameState== GameState_RUN
					invoke GetMine,point.x, point.y
					mov g_pOldMine,eax
					.if !g_pOldMine
						jmp lb1
					.endif
					assume esi :ptr MINESTRUCT
					mov esi,g_pOldMine
					.if  wParam&MK_RBUTTON

						mov g_bLRBtnDown , FALSE
						invoke OnLRBtnUp,[esi].uRow, [esi].uCol
						.if g_uGameState == GameState_WAIT

							mov g_uBtnState , BUTTON_NORMAL
							invoke InvalidateRect,hWinMain,NULL,0
							jmp lb1
						.endif
						.if [esi].uNowState != STATE_FLAG
							invoke OpenAround,[esi].uRow, [esi].uCol
						.endif
						invoke  ErrorAroundFlag,[esi].uRow, [esi].uCol
						.if eax
							invoke Dead,[esi].uRow, [esi].uCol
							jmp lb1
						.endif
					.else
						.if g_uGameState == GameState_WAIT
							.if g_uTimer
								invoke KillTimer,hWinMain,ID_TIMER_EVENT
								mov g_uTimer , 0
							.endif
							mov g_uSpendTime , 1
							invoke InvalidateRect,hWinMain,NULL,0
							invoke SetTimer,hWinMain,ID_TIMER_EVENT, 1000, NULL
							mov g_uTimer ,eax
							invoke LayMines,[esi].uRow,[esi].uCol
							mov g_uGameState , GameState_RUN
						.endif
						.if [esi].uOldState == STATE_NORMAL
							invoke IsMine,[esi].uRow, [esi].uCol
							.if eax
								invoke Dead,[esi].uRow, [esi].uCol
								jmp lb1
							.endif
							invoke GetAroundNum,[esi].uRow, [esi].uCol
							mov around,eax
							.if around == 0
								invoke Expand,[esi].uRow, [esi].uCol
							.else
								invoke DrawDownNum,g_pOldMine, around
							.endif
						.elseif [esi].uOldState == STATE_DICEY
							mov [esi].uNowState , STATE_DICEY
						.endif
						invoke Victory
						.if eax
							invoke InvalidateRect,hWinMain,NULL,0
							jmp lb1
						.endif
					.endif
				.elseif g_uGameState==GameState_VICTORY || g_uGameState==GameState_DEAD
					jmp lb1
				.endif
				mov g_uBtnState , BUTTON_NORMAL
				invoke InvalidateRect,hWinMain,NULL,0
			.else
				.if  g_uGameState == GameState_WAIT || g_uGameState == GameState_RUN
					mov g_uBtnState ,BUTTON_NORMAL
					invoke InvalidateRect,hWinMain,addr rcBtn,0
				.endif
			.endif
		.endif
lb1:
		invoke ReleaseCapture
		assume esi :nothing
;============================================================================================
	.elseif	eax ==WM_LBUTTONDOWN
		mov eax,lParam
		movzx eax,ax
		mov point.x,eax
		mov eax,lParam
		shr eax,16
		movzx eax,ax
		mov point.y,eax
		mov eax,g_uBtnRect[4]
		mov rcBtn.left,eax
		mov eax,g_uBtnRect[8]
		mov rcBtn.right,eax
		mov eax,g_uXNum
		mov ecx,MINE_WIDTH
		mul ecx
		add eax,MINE_AREA_LEFT
		mov rcMineArea.right,eax
		mov eax, g_uYNum
		mov ecx,MINE_HEIGHT
		mul ecx
		add eax,MINE_AREA_TOP
		mov rcMineArea.bottom,eax
		invoke SetCapture,hWinMain
		mov g_bClickBtn ,FALSE
		mov g_bLRBtnDown , FALSE
		invoke PtInRect,addr rcBtn,point.x,point.y
		.if eax
			mov          g_bClickBtn , TRUE
			mov          g_uBtnState, BUTTON_DOWN
			invoke       InvalidateRect,hWinMain,addr rcBtn,0
			jmp lb2
		.else
			invoke PtInRect,addr rcMineArea,point.x,point.y
			.if eax
				.if (g_uGameState==GameState_WAIT) || (g_uGameState==GameState_RUN)
					invoke GetMine,point.x, point.y
					mov g_pNewMine ,eax
					.if (!g_pNewMine)
						jmp lb2
					.endif
					assume esi :ptr MINESTRUCT
					mov esi,g_pNewMine
					.if ([esi].uNowState == STATE_NORMAL)
						mov [esi].uNowState , STATE_EMPTY
					.endif
					.if ([esi].uNowState == STATE_DICEY)
						mov [esi].uNowState , STATE_DICEY_DOWN
					.endif
					mov		eax, g_pNewMine
					mov     g_pOldMine ,eax
				.elseif (g_uGameState==GameState_DEAD) || (g_uGameState==GameState_VICTORY)
					jmp lb2
				.endif
				mov g_uBtnState , BUTTON_CLICK
				invoke InvalidateRect,hWinMain,addr rcBtn,0
				.if  wParam & MK_RBUTTON
					mov g_bLRBtnDown ,TRUE
					invoke OnLRBtnDown,[esi].uRow, [esi].uCol
				.endif
				invoke InvalidateRect,hWinMain,addr rcMineArea,0
			.else
				.if (g_uGameState == GameState_WAIT )|| (g_uGameState == GameState_RUN)
					mov g_uBtnState , BUTTON_CLICK
					invoke InvalidateRect,hWinMain,addr rcBtn,0
				.endif
			.endif
		.endif
lb2:
		assume esi :nothing
;============================================================================================
 	.elseif	eax ==WM_RBUTTONDOWN
		mov eax,lParam
		movzx eax,ax
		mov point.x,eax
		mov eax,lParam
		shr eax,16
		movzx eax,ax
		mov point.y,eax
		mov eax,g_uBtnRect[4]
		mov rcBtn.left,eax
		mov eax,g_uBtnRect[8]
		mov rcBtn.right,eax
		mov eax,g_uXNum
		mov ecx,MINE_WIDTH
		mul ecx
		add eax,MINE_AREA_LEFT
		mov rcMineArea.right,eax
		mov eax, g_uYNum
		mov ecx,MINE_HEIGHT
		mul ecx
		add eax,MINE_AREA_TOP
		mov rcMineArea.bottom,eax
		mov g_bLRBtnDown ,FALSE
		invoke PtInRect,addr rcMineArea,point.x,point.y
		.if eax
			.if (g_uGameState==GameState_WAIT) || (g_uGameState==GameState_RUN)
				invoke GetMine,point.x, point.y
				mov g_pNewMine ,eax
				.if (!g_pNewMine)
					jmp lb3
				.endif
				assume esi :ptr MINESTRUCT
				mov esi,g_pNewMine
				.if wParam & MK_LBUTTON
					mov g_bLRBtnDown , TRUE
					invoke OnLRBtnDown,[esi].uRow, [esi].uCol
				.else
					.if [esi].uNowState==STATE_NORMAL
						mov			[esi].uNowState ,STATE_FLAG
						mov			[esi].uOldState , STATE_FLAG
						sub			g_nLeaveNum,1
					.elseif [esi].uNowState==STATE_FLAG
						mov         [esi].uNowState , STATE_DICEY
						mov         [esi].uOldState , STATE_DICEY
						add			g_nLeaveNum,1
					.elseif [esi].uNowState== STATE_DICEY
						mov			[esi].uNowState , STATE_NORMAL
						mov			[esi].uOldState ,STATE_NORMAL
					.endif
				.endif
				invoke InvalidateRect,hWinMain,NULL,0
			.endif
		.endif
lb3:
		assume esi :nothing
;============================================================================================
	.elseif	eax ==WM_RBUTTONUP
		mov eax,lParam
		movzx eax,ax
		mov point.x,eax
		mov eax,lParam
		shr eax,16
		movzx eax,ax
		mov point.y,eax
		mov eax,g_uBtnRect[4]
		mov rcBtn.left,eax
		mov eax,g_uBtnRect[8]
		mov rcBtn.right,eax
		mov eax,g_uXNum
		mov ecx,MINE_WIDTH
		mul ecx
		add eax,MINE_AREA_LEFT
		mov rcMineArea.right,eax
		mov eax, g_uYNum
		mov ecx,MINE_HEIGHT
		mul ecx
		add eax,MINE_AREA_TOP
		mov rcMineArea.bottom,eax
		invoke GetMine,point.x, point.y
		mov g_pOldMine,eax
		.if (!g_pOldMine)
			jmp lb4
		.endif
		assume esi :ptr MINESTRUCT
		mov esi,g_pOldMine
		.if g_bLRBtnDown
			mov g_bLRBtnDown , FALSE
			invoke OnLRBtnUp,[esi].uRow, [esi].uCol
			.if g_uGameState == GameState_WAIT
				mov g_uBtnState, BUTTON_NORMAL
				invoke InvalidateRect,hWinMain,NULL,0
				jmp lb4
			.endif
			.if ([esi].uNowState != STATE_FLAG)
				invoke OpenAround,[esi].uRow, [esi].uCol
			.endif
			invoke ErrorAroundFlag,[esi].uRow, [esi].uCol
			.if eax
				invoke Dead,[esi].uRow, [esi].uCol
				invoke ReleaseCapture
				jmp lb4
			.endif
		.else
			.if g_uGameState != GameState_VICTORY
				invoke Victory
			.endif
		.endif
lb4:
		assume esi :nothing
;============================================================================================
	.elseif	eax ==WM_MOUSEMOVE
		assume esi :ptr MINESTRUCT
		assume edi :ptr MINESTRUCT
		mov eax,lParam
		movzx eax,ax
		mov point.x,eax
		mov eax,lParam
		shr eax,16
		movzx eax,ax
		mov point.y,eax
		mov eax,g_uBtnRect[4]
		mov rcBtn.left,eax
		mov eax,g_uBtnRect[8]
		mov rcBtn.right,eax
		mov eax,g_uXNum
		mov ecx,MINE_WIDTH
		mul ecx
		add eax,MINE_AREA_LEFT
		mov rcMineArea.right,eax
		mov eax, g_uYNum
		mov ecx,MINE_HEIGHT
		mul ecx
		add eax,MINE_AREA_TOP
		mov rcMineArea.bottom,eax
		.if wParam &MK_LBUTTON
			invoke PtInRect,addr rcBtn,point.x,point.y
			.if eax
				.if g_uGameState==GameState_WAIT || g_uGameState==GameState_RUN
					.if g_bClickBtn
						mov g_uBtnState,BUTTON_DOWN
					.else
						mov g_uBtnState,BUTTON_CLICK
					.endif
				.elseif g_uGameState== GameState_DEAD || g_uGameState==GameState_VICTORY

					.if g_bClickBtn
						mov g_uBtnState , BUTTON_DOWN
					.endif
				.endif
				invoke InvalidateRect,hWinMain,addr rcBtn,0
			.else
				invoke PtInRect,addr rcMineArea,point.x,point.y
				.if eax
					.if g_uGameState==GameState_WAIT || g_uGameState==GameState_RUN
						invoke GetMine,point.x, point.y
						mov g_pNewMine ,eax
						mov esi,eax
						mov edi,g_pOldMine
						.if (!esi) || (!edi)
							jmp cc
						.endif
						mov eax,[esi].uCol
						mov ecx,[esi].uRow
						.if (eax != [edi].uCol || ecx!= [edi].uRow)
							.if [esi].uNowState==STATE_NORMAL
								mov [esi].uNowState , STATE_EMPTY
							.elseif [esi].uNowState== STATE_DICEY
								mov [esi].uNowState , STATE_DICEY_DOWN
							.endif
							.if [edi].uOldState==STATE_NORMAL
								mov [edi].uNowState , STATE_NORMAL
							.elseif [edi].uOldState==STATE_DICEY
								mov              [edi].uNowState , STATE_DICEY
							.endif
							.if g_bLRBtnDown
								invoke OnLRBtnUp,[edi].uRow, [edi].uCol
								invoke OnLRBtnDown,[esi].uRow, [esi].uCol
							.endif
							mov eax,g_pNewMine
							mov g_pOldMine,eax
						.endif
						invoke InvalidateRect,hWinMain, addr rcMineArea,0
					.elseif g_uGameState== GameState_DEAD || g_uGameState==GameState_VICTORY
						jmp cc
					.endif
				.else
					.if g_uGameState==GameState_WAIT || g_uGameState==GameState_RUN
						.if g_bClickBtn
							mov g_uBtnState ,BUTTON_NORMAL
						.else
							mov g_uBtnState ,BUTTON_CLICK
						.endif
						.if g_pNewMine
							mov esi,g_pNewMine
							.if [esi].uOldState == STATE_NORMAL
								mov [esi].uNowState, STATE_NORMAL
							.elseif [esi].uOldState == STATE_DICEY
								mov [esi].uNowState, STATE_DICEY
							.endif
						.endif
						mov edi,g_pOldMine
						invoke OnLRBtnUp,[edi].uRow, [edi].uCol
					.elseif g_uGameState== GameState_DEAD
						mov g_uBtnState , BUTTON_DEAD
					.elseif g_uGameState== GameState_VICTORY
						mov g_uBtnState ,BUTTON_VICTORY
					.endif
					invoke InvalidateRect,hWinMain,NULL,0
				.endif
			.endif
		.endif
cc:
		assume esi :nothing
		assume edi :nothing
	.elseif	eax ==WM_INITMENU
		invoke			SetCheckedLevel
		invoke			SetCheckedMark
		invoke			SetCheckedColor
		invoke			SetCheckedSound
	.elseif	eax ==	WM_TIMER
		mov eax,wParam
		.if eax==ID_TIMER_EVENT
			inc g_uSpendTime
			invoke InvalidateRect,hWnd,NULL,0
			.if g_uSpendTime >= DEFAULT_RECORD
				invoke KillTimer,hWnd,ID_TIMER_EVENT
				mov g_uTimer , 0
			.endif
		.endif
	.elseif	eax ==	WM_SHOWWINDOW
		invoke SizeWindow
	.elseif	eax ==	WM_PAINT
		invoke Loadmap
		invoke	BeginPaint,hWnd,addr Ps
		mov	hdc,eax
		invoke CreateCompatibleDC,hdc
		mov dcMemory,eax
		mov g_dc,eax
		invoke CreateCompatibleBitmap,hdc, g_rcClient.right, g_rcClient.bottom
		mov    bitmap,eax
		invoke SelectObject,dcMemory,bitmap
		invoke FillRect,dcMemory,addr g_rcClient, g_brsBG
		invoke DrawButton					
		invoke DrawNumber					
		invoke DrawShell					
		invoke DrawMineArea					
		invoke BitBlt,hdc,g_rcClient.left, g_rcClient.top, g_rcClient.right, g_rcClient.bottom, dcMemory, 0, 0, SRCCOPY
		invoke DeleteObject,bitmap
		invoke ReleaseDC,hWnd,dcMemory
		invoke	EndPaint,hWnd,addr Ps
	.elseif	eax ==	WM_CLOSE
		invoke	SaveConfig
		invoke	PostQuitMessage,NULL
	.else
		invoke	DefWindowProc,hWnd,uMsg,wParam,lParam
		ret
	.endif
	xor	eax,eax
	ret
ProcWinMain	endp
;=======================================================================================================================
WinMain	proc
local	wc:WNDCLASSEX
local	msg:MSG
local	uWidth:UINT
local	uHeight:UINT
local	uXPos:UINT
local	uYPos:UINT
	invoke	GetModuleHandle,NULL
	mov		hInstance,eax
	mov 	rcBtn.top,15
	mov 	rcBtn.bottom,40
	mov 	rcMineArea.left,MINE_AREA_LEFT
	mov 	rcMineArea.top,MINE_AREA_TOP
	invoke	LoadMenu,hInstance,IDR_MENU
	mov		hMenu,eax
	invoke	RtlZeroMemory,addr wc,sizeof wc
	invoke	LoadCursor,0,IDC_ARROW
	mov		wc.hCursor,eax
	invoke	LoadIcon,hInstance,IDR_MAINFRAME
	mov		wc.hIcon,eax
	push	hInstance
	pop		wc.hInstance
	mov		wc.cbSize,sizeof WNDCLASSEX
	mov		wc.style,CS_HREDRAW or CS_VREDRAW
	mov		wc.lpfnWndProc,offset ProcWinMain
	mov		wc.lpszClassName,offset szClassName
	invoke	GetStockObject,WHITE_BRUSH
	mov 	wc.hbrBackground,eax
	invoke	RegisterClassEx,addr wc
	mov		g_pSndDead,NULL
	mov		g_pSndVictory,NULL
	mov		g_uTimer, 0
	invoke	CreateSolidBrush,COLOR_GRAY
	mov		g_brsBG,eax
	invoke LoadConfig
	.if g_bSoundful
		invoke LoadWaveSrc
	.else
		invoke FreeWaveSrc
	.endif
	invoke	InitGame
	mov eax,g_uXNum
	mov ecx,MINE_WIDTH
	mul ecx
	add eax,DEFAULT_FRAME_X +  LINE_WIDTH_0 * 3 + SIDE_WIDTH_0 + SIDE_WIDTH_1
	mov uWidth ,eax
	mov eax,g_uYNum
	mov ecx,MINE_HEIGHT
	mul ecx
	add eax,DEFAULT_FRAME_Y +  LINE_WIDTH_0 * 3 + SIDE_WIDTH_0 * 2 + SIDE_WIDTH_1 + SHELL_S_H
	mov uHeight ,eax
	invoke	GetSystemMetrics,SM_CXSCREEN
	mov edx,0
	mov ecx,2
	div ecx
	mov uXPos,eax
	invoke	GetSystemMetrics,SM_CYSCREEN
	mov edx,0
	mov ecx,2
	div ecx
	mov uYPos,eax
	mov edx,0
	mov eax,uWidth
	mov ecx,2
	div ecx
	sub uXPos,eax
	mov edx,0
	mov eax,uHeight
	mov ecx,2
	div ecx
	sub uYPos,eax
	invoke CreateWindowEx,NULL,offset szClassName,offset szCaptionMain,\
		WS_SYSMENU or WS_CAPTION or WS_MINIMIZEBOX,\
		uXPos, uYPos, uWidth, uHeight,\
		NULL,hMenu,hInstance,NULL
	mov	hWinMain,eax
	invoke	ShowWindow,hWinMain,SW_SHOWNORMAL
	invoke	UpdateWindow,hWinMain
	.while	TRUE
		invoke	GetMessage,addr msg,NULL,0,0
		.break	.if eax == 0
		invoke	TranslateMessage,addr msg
		invoke	DispatchMessage,addr msg
	.endw
	ret
WinMain	endp
start:
	invoke	WinMain
	invoke	ExitProcess,NULL
end	start
