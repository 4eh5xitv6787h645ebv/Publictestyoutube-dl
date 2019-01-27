#SingleInstance force ; Skips the dialog box and replaces the old instance automatically

strPsScriptFile := "C:\Program Files\Youtube Download\" . "Multi Menu.ps1"
Loop, %strPsScriptFile%
	if StrLen(A_LoopFileShortPath) ; in case the file system does not support 8.3 (NtfsDisable8dot3NameCreation)
		strPsScriptFile := A_LoopFileShortPath

RunWait, PowerShell.exe -ExecutionPolicy Bypass -Command %strPsScriptFile%
return