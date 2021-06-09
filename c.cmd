::::::::::::::::::::::::::::::::::::
::Initiation
@echo off
set page=Menu
set "appn=ccmd"
set appv=3
set "rawurl=https://raw.githubusercontent.com/baikil/ccmd/main/"
if not "%1" == "" call :%1 %2 %3 & exit /b
::::::::::::::::::::::::::::::::::::

:AutoUpdater
title %appn% [v%appv%] - %page%
call :download %rawurl%ver ver
set /p cver=<ver
if %appv% leq %cver% set page=Update
goto %page%

:Update
title %appn% [v%appv%] - %page%
echo Updating from [%appv%] to [%cver%] ...
echo.
echo The program will restart when the update is completed
call :download %rawurl%c.cmd c.cmd
start %0 & exit

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
echo DEBUG PAGE
pause /n
goto Menu

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