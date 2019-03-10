@echo off
echo What is the YouTube channel's id?
set /p id=
echo.
echo What is your key?
set /p key=
:gohere
echo Invoke-WebRequest -Uri "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=%id%&key=&key%" -OutFile "orgdata.txt" >>subs.ps1
Powershell.exe -executionpolicy remotesigned -File subs.ps1
findstr subscriberCount orgdata.txt >subdata.txt
for /f "delims=" %%x in (subdata.txt) do set rmqu=%%x
set rmqu=%rmqu:"=%
set rmqu=%rmqu:,=%
set rmqu=%rmqu: =%
set rmqu=%rmqu:s=%
set rmqu=%rmqu:u=%
set rmqu=%rmqu:b=%
set rmqu=%rmqu:c=%
set rmqu=%rmqu:r=%
set rmqu=%rmqu:i=%
set rmqu=%rmqu:e=%
set rmqu=%rmqu:o=%
set rmqu=%rmqu:n=%
set rmqu=%rmqu:t=%
set rmqu=%rmqu::=%
echo Subscribers: %rmqu%
del /F subs.ps1
del /F orgdata.txt
del /F subdata.txt
goto gohere
pause >nul