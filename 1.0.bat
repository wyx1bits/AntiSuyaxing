@echo off
set "proc=student.exe"
echo 监控进程 %proc%，出现就杀死，Ctrl+C退出
:loop
tasklist | findstr /i "%proc%" >nul
if %errorlevel% equ 0 (
    echo 检测到进程，执行杀死
    taskkill /f /im %proc% >nul 2>&1
)
timeout /t 1 /nobreak >nul
goto loop