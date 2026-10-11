@echo off
set "PSexecPath=D:\PSTools\psexec.exe"
set "ExpectedArgs=-i -s cmd.exe"
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请以“管理员身份”运行此脚本！
    pause
    exit /b
)
if not exist "%PSexecPath%" (
    echo 找不到 PsExec，路径是否正确？当前路径：%PSexecPath%。
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
