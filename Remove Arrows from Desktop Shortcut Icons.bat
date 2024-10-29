@echo off
chcp 65001 >nul
setlocal

echo Выберите опцию:
echo 1 - Убрать стрелки с ярлыков
echo 2 - Включить стрелки на ярлыках
echo 3 - Выйти
set /p choice=Введите номер опции и нажмите Enter: 

if "%choice%"=="1" (
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /t REG_SZ /d "%SystemRoot%\System32\shell32.dll,-50" /f
    echo Стрелки на ярлыках отключены.
    goto :restart
) else if "%choice%"=="2" (
    reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
    echo Стрелки на ярлыках включены.
    goto :restart
) else (
    echo
    echo Выход из программы.
    exit /b
)

:restart
echo Перезапуск проводника...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo Готово.
endlocal
pause