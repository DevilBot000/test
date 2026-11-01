@echo off
setlocal

:: Temp folder mein PowerShell script ka path set karo
set "PS_SCRIPT=%TEMP%\popup_script_%RANDOM%.ps1"

:: PowerShell script ko temp file mein likho
(
echo Add-Type -AssemblyName PresentationFramework
echo $result = [System.Windows.MessageBox]::Show^(
echo     "Do you want to continue?",
echo     "Confirmation",
echo     [System.Windows.MessageBoxButton]::YesNo,
echo     [System.Windows.MessageBoxImage]::Question
echo ^)
echo if ^($result -eq "Yes"^) {
echo     Write-Host "User clicked Yes"
echo } else {
echo     Write-Host "User clicked No"
echo }
) > "%PS_SCRIPT%"

:: PowerShell script ko execution policy bypass ke saath run karo
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"

:: Temp file ko delete karo
if exist "%PS_SCRIPT%" (
    del /f /q "%PS_SCRIPT%"
    echo Temp script deleted: %PS_SCRIPT%
)

endlocal
del %0