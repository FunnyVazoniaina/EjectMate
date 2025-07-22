@echo off
setlocal

for /f "tokens=1 delims==" %%D in ('wmic logicaldisk where "DriveType=2" get DeviceID /value ^| find "="') do (
    set "drive=%%D"
    call :ejectDrive %%D
)
goto :eof

:ejectDrive
powershell -Command "Get-WmiObject -Class Win32_Volume -Filter \"DriveLetter='%1'\" | ForEach-Object { $_.Dismount($false, $false); $_.Remove($false) }"
echo %1 ejected.
REM Optionally notify here with BurntToast or a MsgBox
goto :eof
