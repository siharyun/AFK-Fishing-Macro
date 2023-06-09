;롱빈터 낚시매크로(AFK Fishing)

#NoTrayIcon

#Include AES Encryption.ahk
#Include ImageButton Effects.ahk
#Include ImageButton Effects2.ahk
#Include JSON_FromObj.ahk
#Include ShowTextRectangle.ahk

;웹훅 주소용으로 오류시 사용필요 X
#Include address.ahk

;이미지파일저장할 폴더 만들기
FileCreateDir, %A_ScriptDir%/yulcroimg/

;이미지인스톨(파일따로뺌)
#Include 이미지인스톨.ahk

;생성한 이미지폴더 숨김처리
FileSetAttrib, +H, %A_ScriptDir%\yulcroimg, 1, 1


;ini파일 가져오기
num := 1
While(num <= 17)
{
	IniRead, fish%num%, fishingList.ini, Setting, fish%num%, true
	num := num + 1
}

global fish1
global fish2
global fish3
global fish4
global fish5
global fish6
global fish7
global fish8
global fish9
global fish10
global fish11
global fish12
global fish13
global fish14
global fish15
global fish16
global fish17

global inti := 1

;배포시 꼭 false!
global laggdelay := false

;언어설정 en(default), ko
global lang = "en"

Gui, Add, Picture, x213 y5 w22 h22 vhelp ghelp, %A_ScriptDir%\yulcroimg\btnError.png
Gui, Add, Picture, x155 y405 w40 h40 vsave gsave, %A_ScriptDir%\yulcroimg\btnSave.png
;Gui, Add, Text, x10 y10 w100 h20 vDebug, 디버그

Bhelp := new ImageButtonChange2("help", "yulcroimg\btnError_hover.png", "yulcroimg\btnError_press.png")
Bsave := new ImageButtonChange2("save", "yulcroimg\btnSave_hover.png", "yulcroimg\btnSave_press.png")


if(lang = "ko")
{	;한글
	Gui, Color,F9ECCB
	Gui Show, w240 h485, 잠수낚시

	Gui Font, S10 C694642 W600, Malgun Gothic
	Gui, Add, Text, x60 y15 w120 h20 +Center C694642, 롱빈터
	Gui, Add, Text, x50 y35 w140 h20 +Center C694642, ♪ 낚시매크로 ♬

	Gui Font, S8 CFF5D4F W600, Malgun Gothic
	Gui, Add, Text, x0 y70 w240 h20 +Center vProgress, 낚시포인트: F4  시작: F6  종료: F7

	;그룹박스
	Gui Font, S9 C694642, Batang
	Gui, Add, GroupBox, x20 y100 w200 h365, 물고기 목록
}
else
{	;영어
	Gui, Color,F9ECCB
	Gui Show, w240 h485, AFK Fishing

	Gui Font, S10 C694642 W600, Century Gothic
	Gui, Add, Text, x60 y15 w120 h20 +Center C694642, Longvinter
	Gui, Add, Text, x50 y35 w140 h20 +Center C694642, ♪ Fishing Macro ♬

	Gui Font, S8 CFF5D4F W600, Century Gothic
	Gui, Add, Text, x0 y70 w240 h20 +Center vProgress, SetPoint: F4  Start: F6  Finish: F7

	;그룹박스
	Gui Font, S11 C694642 Bold, Arial
	Gui, Add, GroupBox, x20 y100 w200 h365, Fish List
}

global getPressed1
global getPressed2
global getPressed3
global getPressed4
global getPressed5
global getPressed6
global getPressed7
global getPressed8
global getPressed9
global getPressed10
global getPressed11
global getPressed12
global getPressed13
global getPressed14
global getPressed15
global getPressed16
global getPressed17

Loop 17
{
	check := fish%A_Index%
	;GuiControl, , Debug, %check%

	if (%check% = false)
	{
		getPressed%A_Index% := "_press"
	}
}

Gui, Add, Picture, x45 y130 w40 h40 vfish_1 gfish_1, %A_ScriptDir%\yulcroimg\1fish_pic%getPressed1%.bmp
Gui, Add, Picture, x100 y130 w40 h40 vfish_2 gfish_2, %A_ScriptDir%\yulcroimg\2fish_pic%getPressed2%.bmp
Gui, Add, Picture, x155 y130 w40 h40 vfish_3 gfish_3, %A_ScriptDir%\yulcroimg\3fish_pic%getPressed3%.bmp

Gui, Add, Picture, x45 y185 w40 h40 vfish_4 gfish_4, %A_ScriptDir%\yulcroimg\4fish_pic%getPressed4%.bmp
Gui, Add, Picture, x100 y185 w40 h40 vfish_5 gfish_5, %A_ScriptDir%\yulcroimg\5fish_pic%getPressed5%.bmp
Gui, Add, Picture, x155 y185 w40 h40 vfish_6 gfish_6, %A_ScriptDir%\yulcroimg\6fish_pic%getPressed6%.bmp

Gui, Add, Picture, x45 y240 w40 h40 vfish_7 gfish_7, %A_ScriptDir%\yulcroimg\7fish_pic%getPressed7%.bmp
Gui, Add, Picture, x100 y240 w40 h40 vfish_8 gfish_8, %A_ScriptDir%\yulcroimg\8fish_pic%getPressed8%.bmp
Gui, Add, Picture, x155 y240 w40 h40 vfish_9 gfish_9, %A_ScriptDir%\yulcroimg\9fish_pic%getPressed9%.bmp

Gui, Add, Picture, x45 y295 w40 h40 vfish_10 gfish_10, %A_ScriptDir%\yulcroimg\10fish_pic%getPressed10%.bmp
Gui, Add, Picture, x100 y295 w40 h40 vfish_11 gfish_11, %A_ScriptDir%\yulcroimg\11fish_pic%getPressed11%.bmp
Gui, Add, Picture, x155 y295 w40 h40 vfish_12 gfish_12, %A_ScriptDir%\yulcroimg\12fish_pic%getPressed12%.bmp

Gui, Add, Picture, x45 y350 w40 h40 vfish_13 gfish_13, %A_ScriptDir%\yulcroimg\13fish_pic%getPressed13%.bmp
Gui, Add, Picture, x100 y350 w40 h40 vfish_14 gfish_14, %A_ScriptDir%\yulcroimg\14fish_pic%getPressed14%.bmp
Gui, Add, Picture, x155 y350 w40 h40 vfish_15 gfish_15, %A_ScriptDir%\yulcroimg\15fish_pic%getPressed15%.bmp

Gui, Add, Picture, x45 y405 w40 h40 vfish_16 gfish_16, %A_ScriptDir%\yulcroimg\16fish_pic%getPressed16%.bmp
Gui, Add, Picture, x100 y405 w40 h40 vfish_17 gfish_17, %A_ScriptDir%\yulcroimg\17fish_pic%getPressed17%.bmp


Loop 17
{
	Oripic := "fish_" . A_Index
	Hoverpic := "yulcroimg\" . A_Index . "fish_pic_hover.bmp"

	check := fish%A_Index%

	if(%check% = true)
	{
		Presspic := "yulcroimg\" . A_Index . "fish_pic_press.bmp"
	}
	else if(%check% = false)
	{
		Presspic := "yulcroimg\" . A_Index . "fish_pic.bmp"
	}

	;GuiControl, , Debug, %check%

	B%A_Index% := new ImageButtonChange(Oripic, Hoverpic, Presspic)
}

global fishingX
global fishingY
global betterfish := true

fishingspotX := []
fishingspotY := []

Obj := new ShowTextRectangle() ; 객체생성

return

{
	fish_1:
	  fish1 := BtnPress(fish1)
	  return

	fish_2:
	  fish2 := BtnPress(fish2)
	  return

	fish_3:
	  fish3 := BtnPress(fish3)
	  return

	fish_4:
	  fish4 := BtnPress(fish4)
	  return

	fish_5:
	  fish5 := BtnPress(fish5)
	  return

	fish_6:
	  fish6 := BtnPress(fish6)
	  return

	fish_7:
	  fish7 := BtnPress(fish7)
	  return

	fish_8:
	  fish8 := BtnPress(fish8)
	  return

	fish_9:
	  fish9 := BtnPress(fish9)
	  return

	fish_10:
	  fish10 := BtnPress(fish10)
	  return

	fish_11:
	  fish11 := BtnPress(fish11)
	  return

	fish_12:
	  fish12 := BtnPress(fish12)
	  return

	fish_13:
	  fish13 := BtnPress(fish13)
	  return

	fish_14:
	  fish14 := BtnPress(fish14)
	  return

	fish_15:
	  fish15 := BtnPress(fish15)
	  return

	fish_16:
	  fish16 := BtnPress(fish16)
	  return

	fish_17:
	  fish17 := BtnPress(fish17)
	  return
}

BtnPress(tf)
{
	GuiControl, , Debug, tf:%tf%
	if(%tf% = true)
	{
		GuiControl, , Debug, false됨
		return "false"
	}
	else if (%tf% = false)
	{
		GuiControl, , Debug, true됨
		return "true"
	}
}
return

help:
{
if(lang = "ko")
{	;한글
	MsgBox, 0, 잠수낚시 매크로 사용법,
	(
1. 이 매크로는 1920X1080 해상도의 창모드에 최적화되어있습니다. 이외의 세팅에서는 정상적으로 작동하지 않을 수 있습니다.

2. 빠른 낚시를 위하여 '어부 모자' 및 '미끼 낚시대' 사용을 권장 드리나 다른 낚시대도 모두 사용 가능합니다.

3. 버리고싶은 물고기를 눌러 비활성화 합니다.

4. 마우스를 낚시 포인트에 올리고 F4를 눌러 저장합니다. (다중 설정 가능)

5. 낚시포인트 설정 완료 후 F6을 눌러 낚시를 시작합니다.

6. 이 매크로는 블루베리팩과 지렁이팩이 인벤토리에 있는 경우 먹는 기능을 포함하고 있습니다.

7. 매크로가 오동작하거나 재시작하고 싶은 경우 F7를 누릅니다.

8. 이 매크로는 완벽하지 않습니다. 중요한 아이템을 가지고 사용하지 마십시오. 제작자는 해당 프로그램을 사용하며 발생한 어떠한 결과에 책임을 지지 않습니다.

제작자 시하륜
디스코드 문의 siharyun#6555
	)
}
else
{	;영어
	MsgBox, 0, how to use AFK Fishing Macro,
	(
1. This macro is optimized for the 1920X1080 resolution window mode. It may not function properly in other settings.

2. Please use 'Fishing Hat' and 'Bait Buster' for the best experience but you can use any other fishing rods too.

3. Disable the fish you want to throw away

4. Place your mouse on the fishing point and Press F4 to set Fishing spots (you can select multiple spots)

5. After set all the spots around, press F6 to start Fishing

6. The program also contains auto eating pack of worms or pack of blueberries.

7. Whenever you want macro to be stopped, Press F7

8. This is not Perfect Program. Do not have any important things together. Creater doesn't have responsibility on any kind of action of the user using this program.

Created by Siharyun
contact discord - siharyun#6555
	)
}
}
return

save()
{
	Gui, Submit, nohide
	num := 1

	While(num <= 17)
	{
		check := fish%num%

		if(%check% = true)
			IniWrite, true, fishingList.ini, Setting, fish%num%
		else if(%check% = false)
			IniWrite, false, fishingList.ini, Setting, fish%num%

		num := num + 1
	}

	MsgBox, 0, successfully, saved!, 0.5
}
return

discord:
{
	;discord("test")
}
return

GuiClose:
{
	;배포시 이거주석풀고 laggdelay false!
	;FileRemoveDir, %A_ScriptDir%\yulcroimg, 1
	ExitApp
}
return

F7::
{
	Reload
}
return

F4::
{
	MouseGetpos, fishingX, fishingY
	GuiControl, , Debug, %fishingX%

	fishingspotX.Insert(fishingX)
	fishingspotY.Insert(fishingY)

	squareX := fishingX - 35
	squareY := fishingY - 53
	Obj.Show(squareX, squareY, 50, 50, "", "FFC31E", "000000")

	MouseGetpos, fishingX, fishingY
	GuiControl, , Debug, %fishingX%
}
return

F6::
{
	;매크로 진행
	Gui, Submit, nohide

	SetMouseDelay, -1
	SetKeyDelay, -1

	; 저장한 낚시스팟이 없으면 break
	if(fishingspotX.MaxIndex() = null)
	{
		if(lang = "ko") ;한글
			MsgBox, 0, 설정된 낚시포인트가 없습니다!, F4를 눌러 낚시포인트를 설정하세요!
		else ;영어
			MsgBox, 0, No spot to fish, Use F4 to set the fishing spots!
		return
	}
	Sleep 100

	GuiControl, , Debug, 낚시시작
	discord("start")

	spotnum := 1
	betterfish = true

	Obj.Hide()

	While(true)
	{
		;betterfish effect관련------------------------------------
		if (%betterfish% = true)
		{
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\better_fish_effect.bmp
			if (ErrorLevel != 0)
			{
				GuiControl, , Debug, 미끼이펙트없음
				Send {tab}
				Sleep 100
				MouseMove, 0, 0, ,
				Sleep 1000

				;지렁이팩부터 먹기
				ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\pack_of_worms.bmp
				if (ErrorLevel = 0)
				{
					fishfoundX := FoundX + 10
					fishfoundY := FoundY + 10

					Send {Click Left %fishfoundX% %fishfoundY%}
					Sleep 200

				}
				else
				{
					;블루베리팩 먹기
					ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\pack_of_blueberries.bmp
					if (ErrorLevel = 0)
					{
						fishfoundX := FoundX + 10
						fishfoundY := FoundY + 10

						Send {Click Left %fishfoundX% %fishfoundY%}
						Sleep 200
					}
					else
					{
						betterfish = false
					}
				}
				Send {tab}
				Sleep 1000
			}
		}

		Sleep 100
		MouseMove, fishingspotX[spotnum], fishingspotY[spotnum]
		Sleep 100
		Send {Click Left}
		Sleep 200
		GuiControl, , Debug, 찌던짐

		MouseMove, 200, 0, ,R

		Sleep 1000
		if(laggdelay = 1)	;렉용딜레이
			Sleep 1000

		;인벤꽉찼는지 확인용
		if(lang = "ko") ;한글
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\fish_full_ko.bmp
		else ;영어
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\fish_full.bmp
		if (ErrorLevel = 0)
		{
			;인벤꽉참
			GuiControl, , Debug, full
			Send {tab}
			Sleep 100
			MouseMove, 0, 0, ,

			inti := 1

			fishthrow := false
			;GuiControl, , Debug, %fishnow%
			Sleep 1000

			While (inti <= 17)
			{
				fishnow := fish%inti%

				;GuiControl, , Debug, 지금%inti%
				if (%fishnow% = false)
				{
					while(true)
					{
						GuiControl, , Debug, fish%inti%
						ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\%inti%fish_pic.bmp
						if (ErrorLevel = 0)
						{
							GuiControl, , Debug, %inti%fish 버림

							fishfoundX := FoundX + 10
							fishfoundY := FoundY + 10

							Send {Click Right %fishfoundX% %fishfoundY%}
							fishthrow := true
							Sleep 200
							MouseMove, -800, 0, ,R
							Sleep 500
							if(laggdelay = 1)	;렉용딜레이
								Sleep 300
						}
						else
						{
							Sleep 100
							inti := inti + 1
							break
						}
					}
				}
				else
				{
					inti := inti + 1
				}
			}
			GuiControl, , Debug, %inti%까지함
			Sleep 100
			;가방 꽉찼는지 확인
			if (fishthrow = true)
			{
				GuiControl, , Debug, 가방안꽉참
				;빈공간 있을때
				Send {tab}
				Sleep 1500
			}
			else if (fishthrow = false)
			{
				GuiControl, , Debug, 가방꽉참
				break
			}

		}
		else
		{
			;물고기 없는지 확인용
			if(lang = "ko") ;한글
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\fish_none_ko.bmp
			else
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\yulcroimg\fish_none.bmp
			if (ErrorLevel = 0)
			{
				GuiControl, , Debug, 물고기없음%spotnum%
				Sleep 4000

				if(laggdelay = 1)	;렉용딜레이
					Sleep 2000

				if (spotnum = fishingspotX.MaxIndex())
					spotnum := 1
				else
					spotnum++
			}
			else
			{
				;찌 잘 던져졌을때
				While(A_TimeIdle < 30000)
				{
					GuiControl, , Debug, 찌대기중
					ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\yulcroimg\fish_got.bmp
					if (ErrorLevel = 0)
					{
						GuiControl, , Debug, 잡힘
						Send {e}
						Sleep 100
						Send {e}
						Sleep 100
						Send {e}
						Sleep 100
						Send {e}
						Sleep 1000
						break
					}
				}
				GuiControl, , Debug, 빠져나감
				Sleep 200
			}
		}
	}
	discord("finished")

	if(lang = "ko") ;한글
		MsgBox, 0, 낚시, 끝!,
	else ;영어
		MsgBox, 0, fishing, finished!,
}
return

getMyMac()
{
	Runwait, %ComSpec% /c getmac /NH | clip,,hide
	RegExMatch(clipboard, ".*?([0-9A-Z].{16})(?!\w\\Device)", mac)
	return %mac1%
}
return

discord(status)
{
	;낚시 완료 시 디스코드 메세지로 전송 개발중(미완)

	;내 맥주소 확인
	myMacOri := getMyMac()

	StringReplace,myMac,myMacOri,-,,ALL

	;맥주소 암호화
	new AES
	myMac := AES.Encrypt(myMac, "longvinter", 256)

	;시간찍기(참고용)
	formattime, time, , yyyy년 MM월 dd일  tt h시 mm분 ss초

	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("POST", webhook, true)
	whr.SetRequestHeader("Content-Type", "application/json")
	;POST로 데이터 전송

	if (status = "test")
		data := ({ "content" : "``````ansi`n[1;33mTest Message[0m`n[0;36mUser : [0m" . myMac . "`n[0;36mTime : [0m" . time . "``````" })
	else if (status = "start")
		data := ({ "content" : "``````ansi`n[1;32mStart Fishing[0m`n[0;36mUser : [0m" . myMac . "`n[0;36mTime : [0m" . time . "``````" })
	else if (status = "finished")
		data := ({ "content" : "``````ansi`n[1;31mFinished Fishing[0m`n[0;36mUser : [0m" . myMac . "`n[0;36mTime : [0m" . time . "``````" })

	Body := json_fromobj(data)
	whr.Send(Body)
	whr.WaitForResponse()
}
return


