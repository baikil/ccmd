::::::::::::::::::::::::::::::::::::
::Initiation
@echo off
if not "%1" == "" call :%1 %2 %3 & exit /b
set page=Menu
set "appn=ccmd"
set /p appv=<ver
::::::::::::::::::::::::::::::::::::

:AutoUpdater


:Menu
cls
title %appn% [v%appv%] - %page%
echo Welcome to %appn% [v%appv%]
echo.
echo 1. Install
echo 2. Manage
echo 3. About
choice /c D123 /cs /n
if %errorlevel% == 1 set page=Debug
if %errorlevel% == 2 set page=Install
if %errorlevel% == 3 set page=Manage
if %errorlevel% == 4 set page=About
goto %page%
exit

:Debug

::::::::::::::::::::::::::::::::::::
::Functions [input] > output
:syntaxerror [command]
echo.
echo.
echo Syntax error in : [91m%1 %2 %3 %4 %5 %6 %7 %8 %9[0m
pause
goto %page%
exit /b

:line_read [file] [line] > %lr%
set "file=%1"
set skip=%2
set /a skip-=1
for /f "skip=%skip% delims=" %%i in (%file%) do set "output=%%i"
exit /b

:download [url] [output file]
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
exit /b
::::::::::::::::::::::::::::::::::::