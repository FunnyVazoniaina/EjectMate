@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%D in ('wmic logicaldisk where "DriveType=2" get DeviceID ^| find ":"') do (
    set "drive=%%D"
    call :ejectDrive !drive!
)

pause
goto :eof

:ejectDrive
echo Tentative d'éjection : %1

powershell -NoProfile -Command ^
    "$ErrorActionPreference = 'Stop';" ^
    "$drive = '%1';" ^
    "try {" ^
    "  $shell = New-Object -ComObject Shell.Application;" ^
    "  $shell.Namespace(17).ParseName($drive).InvokeVerb('Eject');" ^
    "  Write-Host ('✅ Ejection réussie : ' + $drive) -ForegroundColor Green;" ^
    "  Import-Module BurntToast;" ^
    "  New-BurntToastNotification -Text 'USB Ejected', ('Drive ' + $drive + ' has been safely removed.')" ^
    "} catch {" ^
    "  Write-Host ('❌ Erreur : ' + $_.Exception.Message) -ForegroundColor Red;" ^
    "  Import-Module BurntToast;" ^
    "  New-BurntToastNotification -Text 'Ejection Failed', $_.Exception.Message" ^
    "}"
goto :eof
