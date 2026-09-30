
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
timeout /t 3

@echo off
set "proc=student.exe"
echo 监控进程 %proc%，出现就杀死，Ctrl+C退出
:loop
tasklist | findstr /i "%proc%" >nul
if %errorlevel% equ 0 (
    echo 正在杀死student.exe
    taskkill /f /im %proc% >nul 2>&1
)
timeout /t 1 /nobreak >nul
goto loop
