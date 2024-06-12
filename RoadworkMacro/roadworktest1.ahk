#SingleInstance force
SetBatchLines, -1

GetUserUUID() {
    RunWait, %ComSpec% /c wmic csproduct get UUID > "%Temp%\uuid.txt",, Hide

    FileRead, uuid, %Temp%\uuid.txt

    return StrReplace(uuid, " ", "")
}

userUUID := GetUserUUID()

; Function to check if the UUID is present in a Pastebin paste
CheckPastebinUUID(uuid) {
    pasteURL := "https://pastebin.com/raw/7L5EJfuX"

    ; Send HTTP request to retrieve the raw text of the paste
    res := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    res.Open("GET", pasteURL)
    res.Send()

    if (res.Status = 200) {
        ; Extract the raw text of the paste
        rawText := res.ResponseText

        ; Check if the UUID is present in the raw text
        if InStr(rawText, GetUserUUID()) {
        } else {
            MsgBox, Not Whitelisted
	    Clipboard := userUUID
	    MsgBox, UUID has been copypasted, send it to Guest
	 ExitApp
        }
    }
}

; Check if user's UUID is whitelisted on Pastebin
CheckPastebinUUID(userUUID)

Gui, +AlwaysOnTop
Gui, Color, D5D8DC
Gui, Show, x30 y660 w500 h250, Guest Macro by Nexix
Gui, Add, Text, x40 y10, Go in the folder and open the file setting.ini, you have 18 different values.
Gui, Add, Text, x40 y25, They are the duration of your character running in millisecond (1000 = 1s)
Gui, Add, Text, x40 y40, Just change those values until you can do a full roadwork.
Gui, Add, Text, x40 y55, To do this, you have to change the value in the settings.ini, then press "File" and "Save".
Gui, Add, Text, x40 y70, Make sure to run the script again after every changes.
Gui, Add, Text, x40 y85, K to start, L to exit

; Path to the INI file
IniFile := "settings.ini"

; Variables to store the retrieved values
Hold1 := 0
Hold2 := 0
Hold3 := 0
Hold4 := 0
Hold5 := 0
Hold6 := 0
Hold7 := 0
Hold8 := 0
Hold9 := 0
Hold10 := 0
Hold11 := 0
Hold12 := 0
Hold13 := 0
Hold14 := 0
Hold15 := 0
Hold16 := 0
Hold17 := 0
Hold18 := 0

; Read the values from the INI file
IniRead, Hold1, %IniFile%, Duration, Hold1
IniRead, Hold2, %IniFile%, Duration, Hold2
IniRead, Hold3, %IniFile%, Duration, Hold3
IniRead, Hold4, %IniFile%, Duration, Hold4
IniRead, Hold5, %IniFile%, Duration, Hold5
IniRead, Hold6, %IniFile%, Duration, Hold6
IniRead, Hold7, %IniFile%, Duration, Hold7
IniRead, Hold8, %IniFile%, Duration, Hold8
IniRead, Hold9, %IniFile%, Duration, Hold9
IniRead, Hold10, %IniFile%, Duration, Hold10
IniRead, Hold11, %IniFile%, Duration, Hold11
IniRead, Hold12, %IniFile%, Duration, Hold12
IniRead, Hold13, %IniFile%, Duration, Hold13
IniRead, Hold14, %IniFile%, Duration, Hold14
IniRead, Hold15, %IniFile%, Duration, Hold15
IniRead, Hold16, %IniFile%, Duration, Hold16
IniRead, Hold17, %IniFile%, Duration, Hold17
IniRead, Hold18, %IniFile%, Duration, Hold18

; Check if the values were retrieved successfully
if (ErrorLevel)
{
   MsgBox, Could not read one or more values from the INI file.
}

; Return the values (if needed)
ReturnValue1 := Hold1
ReturnValue2 := Hold2
ReturnValue3 := Hold3
ReturnValue4 := Hold4
ReturnValue5 := Hold5
ReturnValue6 := Hold6
ReturnValue7 := Hold7
ReturnValue8 := Hold8
ReturnValue9 := Hold9
ReturnValue10 := Hold10
ReturnValue11 := Hold11
ReturnValue12 := Hold12
ReturnValue13 := Hold13
ReturnValue14 := Hold14
ReturnValue15 := Hold15
ReturnValue16 := Hold16
ReturnValue17 := Hold17
ReturnValue18 := Hold18

k::
; Walk code
Send, {S Down}
Sleep, %Hold1%
Send, {S Up}

Send, {A Down}
Sleep, %Hold2%
Send, {A Up}

; Run code
Send, {W}
Sleep, 100
Send, {W Down}
Sleep, 10
Send, {Up Down}
Sleep, %Hold3%
Send, {Up Up}

Sleep, 20
Send, {A Down}
Sleep, %Hold4%
Send, {A Up}

Sleep, 20
Send, {S Down}
Sleep, %Hold5%
Send, {S Up}

Sleep, 20
Send, {D Down}
Sleep, %Hold6%
Send, {D Up}

Sleep, 20
Send, {S Down}
Sleep, %Hold7%
Send, {S Up}

Sleep, 20
Send, {D Down}
Sleep, %Hold8%
Send, {D Up}

Sleep, 20
Send, {Up Down}
Sleep, %Hold9%
Send, {Up Up}

Sleep, 20
Send, {D Down}
Sleep, %Hold10%
Send, {D Up}

Sleep, 20
Send, {Up Down}
Sleep, %Hold11%
Send, {Up Up}

Sleep, 20
Send, {D Down}
Sleep, %Hold12%
Send, {D Up}

Sleep, 20
Send, {Up Down}
Sleep, %Hold13%
Send, {Up Up}

Sleep, 20
Send, {D Down}
Sleep, %Hold14%
Send, {D Up}

Sleep, 20
Send, {Up Down}
Sleep, %Hold15%
Send, {Up Up}

Sleep, 20
Send, {A Down}
Sleep, %Hold16%
Send, {A Up}

Sleep, 20
Send, {Up Down}
Sleep, %Hold17%
Send, {Up Up}

Sleep, 20
Send, {A Down}
Sleep, %Hold18%
Send, {A Up}
Send, {W Up}

return

GuiClose:
ExitApp
return

l::ExitApp ; Press "l" to exit the script