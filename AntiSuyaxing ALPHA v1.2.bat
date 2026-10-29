
@echo off
:: 检查是否以管理员权限运行
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :admin
) else (
    echo 请求管理员权限...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:admin
echo 已获得管理员权限。
echo 开始监控并杀死 student.exe 进程...
echo 按 Ctrl+C 可停止脚本。

:loop
tasklist /FI "IMAGENAME eq student.exe" 2>NUL | find /I /N "student.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [%date% %time%] 发现 student.exe，正在终止...
    taskkill /F /IM student.exe >nul 2>&1
    if errorlevel 1 (
        echo 终止失败，可能需要更高权限或进程受保护。
    ) else (
        echo 成功终止 student.exe。
    )
)
:: 等待1秒后再次检查，减少CPU占用
timeout /t 1 /nobreak >nul
goto :loop
