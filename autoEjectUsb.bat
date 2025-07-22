@echo off
setlocal

REM Parcourir tous les lecteurs amovibles
for /f "tokens=1 delims==" %%D in ('wmic logicaldisk where "DriveType=2" get DeviceID /value ^| find "="') do (
    set "drive=%%D"
    call :ejectDrive %%D
)
goto :eof

:ejectDrive
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$drive = '%1';" ^
    "$vol = Get-WmiObject -Class Win32_Volume -Filter \"DriveLetter='$drive'\";" ^
    "if ($vol) {" ^
    "    $vol.Dismount($false, $false) | Out-Null;" ^
    "    $vol.Remove($false) | Out-Null;" ^
    "    Import-Module BurntToast;" ^
    "    New-BurntToastNotification -Text 'USB Ejected', \"Drive $drive has been safely ejected.\";" ^
    "} else {" ^
    "    Import-Module BurntToast;" ^
    "    New-BurntToastNotification -Text 'Ejection Failed', \"Drive $drive could not be found.\";" ^
    "}"
goto :eof
