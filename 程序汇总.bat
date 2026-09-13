
@echo off
set "PSexecPath=D:\PSTools\psexec.exe"
set "ExpectedArgs=-i -s cmd.exe"
net session >nul 2>&1
if %errorLevel% neq 0 (
    pause
    exit /b
)
if not exist "%PSexecPath%" (
    pause
    exit /b
)
start "" "%PSexecPath%" %ExpectedArgs%
exit
