@echo off
chcp 1251 >nul
title Utility Tool // @imngkaa the best man
echo ===== Проверка на администратора =====
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Требуются права администратора!
	powershell -Command "Write-Host 'Запустите программу от имени администратора.' -ForegroundColor Red"
	echo.
	echo Эта программа/окно закроется автоматически через 10 секунд...
    timeout /t 10 /nobreak >nul
    exit
)
powershell -Command "Write-Host 'Проверка прошла успешно!' -ForegroundColor Green"
:menu
cls
echo.
echo      @imngkaa the best man
echo.
echo ===============================
echo         ВЫБЕРИ ДЕЙСТВИЕ
echo ===============================
echo 1 — Удалить стрелки с ярлыков
echo 2 — Восстановить стрелки
echo 3 — Выключить компьютер
echo 4 — Перезагрузить компьютер
echo 5 — Перезагрузить проводник
echo 0 — Выход
echo.
set /p choice=Ваш выбор: 

if "%choice%"=="1" goto remove
if "%choice%"=="2" goto restore
if "%choice%"=="3" goto shutdown
if "%choice%"=="4" goto restart
if "%choice%"=="5" goto :restart_explorer
if "%choice%"=="0" goto end
goto menu

:remove
echo.
echo ===============================
echo    Удалить стрелки с ярлыков
echo ===============================
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t REG_SZ /d "%SystemRoot%\System32\shell32.dll,50" /f
taskkill /IM explorer.exe /F
start explorer.exe
echo Проводник перезапущен.
echo Стрелки удалены!
pause
goto menu

:restore
echo.
echo ===============================
echo      Восстановить стрелки
echo ===============================
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /f
taskkill /IM explorer.exe /F
start explorer.exe
echo Проводник перезапущен.
echo Стрелки восстановлены!
pause
goto menu

:restart_explorer
echo.
echo ===============================
echo     Перезагрузить проводник
echo ===============================
echo Перезагрузка проводника...
taskkill /f /im explorer.exe
start explorer.exe
echo Проводник перезапущен.
timeout /t 2 /nobreak
goto menu

:shutdown
echo.
echo ===============================
echo       Выключить компьютер
echo ===============================
echo Выключение...
shutdown /s /t 0
goto end

:restart
echo.
echo ===============================
echo     Перезагрузить компьютер
echo ===============================
echo Перезагрузка...
shutdown /r /t 0
goto end

:end
echo.
echo Bye, bye, see you later!
timeout /t 1 /nobreak >nul
exit
