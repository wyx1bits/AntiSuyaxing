@echo off
:: 自动以 SYSTEM 权限启动 CMD
:: 需要管理员权限运行此脚本

set "PSexecPath=D:\PSTools\psexec.exe"
set "ExpectedArgs=-i -s cmd.exe"

:: 检查是否以管理员身份运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请以【管理员身份】运行此脚本！
    pause
    exit /b
)

:: 检查 PsExec 是否存在
if not exist "%PSexecPath%" (
    echo 找不到 PsExec，路径是否正确？当前路径：%PSexecPath%
    pause
    exit /b
)

:: 启动 SYSTEM 权限的 CMD
echo 正在启动 SYSTEM 权限的 CMD...
start "" "%PSexecPath%" %ExpectedArgs%
exit