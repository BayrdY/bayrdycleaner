@echo off
title BayrdY - Very Comprehensive Cleaning
color c
setlocal enabledelayedexpansion
rd updates /S /Q
md updates
powershell -Command "$client = New-Object System.Net.WebClient; $url = 'https://bayrdyofficial.com.tr/updates/bayrdy-cleaner-eng-v1.txt'; $response = $client.DownloadString($url); $response | Out-File .\updates\updatechecked.txt"

for /f "delims=" %%A in ('type "%~dp0updates\updatechecked.txt"') do (
    set firstline=%%A
    goto :done
)

:done

if "!firstline!"=="1" (
    echo New Update Availible
    start notepad.exe "%~dp0updates\updatechecked.txt"
) else (
    echo .
)

endlocal
cls

echo.
echo.
echo ------------------------------------------
echo     ____                       ____  __
echo    / __ )____ ___  ___________/ /\ \/ /
echo   / __  / __ `/ / / / ___/ __  /  \  / 
echo  / /_/ / /_/ / /_/ / /  / /_/ /   / /  
echo /_____/\__,_/\__, /_/   \__,_/   /_/   
echo             /____/   
echo.      www.bayrdyofficial.com.tr
echo ------------------------------------------             
echo.

echo Options:
echo [e] Do Cleaning Process
echo [b] Do Backup Process
echo [r] Create Battery Report (Laptop)
echo [p] Internet Ping Test
echo [w] Show Network Connections
echo [g] Do Update Check
echo [h] Exit
echo.
set /p action="Select a Option (e/b/r/p/w/g/h): "

if /i "%action%" equ "e" (
    color 4
    rd %temp% /s /q
    md %temp%
	timeout /T 3
    color 2
    echo Cleaning Process Finished.
)

if /i "%action%" equ "b" (
    echo.
    echo Please Enter The Folder Path You Want To Backup:
    set /p SOURCE=Kaynak Klasor: 

    set DESTINATION=%~dp0Backups
    set DATE=%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%
    set BACKUP_FOLDER=%DESTINATION%\\Backup_%DATE%_No_%RANDOM%
    color 4
    mkdir "%DESTINATION%"
    mkdir "%BACKUP_FOLDER%"
    xcopy "%SOURCE%" "%BACKUP_FOLDER%" /E /I /H /Y

    title BayrdY - Backup Finished
    color c
    cls
)

if /i "%action%" equ "r" (
    powercfg /batteryreport
    start "" "battery-report.html"
    timeout /t 1
    del battery-report.html
)

if /i "%action%" equ "w" (
    title BayrdY - Show Network Connections
    color 2
    cls
    echo Showing Network Connections
    start cmd /k "color 6 & title BayrdY - Ag Baglantilari & cls & ipconfig & timeout /T 2 && netstat"
)

if /i "%action%" equ "p" (
    title BayrdY - Internet Ping Test
    color b
    cls
    hostname
    ping bayrdyofficial.com.tr
    timeout /T 5 
)

if /i "%action%" equ "g" (
    echo Update Checking...
    powershell -Command "$client = New-Object System.Net.WebClient; $url = 'https://bayrdyofficial.com.tr/updates/bayrdy-cleaner-eng-v1.txt'; $response = $client.DownloadString($url); $response | Out-File .\updates\update_status.txt -Encoding utf8; start notepad .\updates\update_status.txt"
)

if not "%action%" equ "e" if not "%action%" equ "g" if not "%action%" equ "b" if not "%action%" equ "r" if not "%action%" equ "h" if not "%action%" equ "w" if not "%action%" equ "p" (
   start "" "%~f0"
   exit
)
title BayrdY - All Process Finished
color c
cls
echo.
echo.
echo ------------------------------------------
echo     ____                       ____  __
echo    / __ )____ ___  ___________/ /\ \/ /
echo   / __  / __ `/ / / / ___/ __  /  \  / 
echo  / /_/ / /_/ / /_/ / /  / /_/ /   / /  
echo /_____/\__,_/\__, /_/   \__,_/   /_/   
echo             /____/   
echo.      www.bayrdyofficial.com.tr
echo ------------------------------------------             
echo.
echo ------------------------------------
echo     All Process Finished!
echo    / - Discord: bayrdy - \
echo / www.bayrdyofficial.com.tr \
echo ------------------------------------
echo.

pause
start "" "%~f0"
exit
