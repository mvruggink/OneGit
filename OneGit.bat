::Coding is an form of art, comments are overrated



@echo off
setlocal

set "installDir=%APPDATA%\OneGit"
set "scriptName=OneGit.bat"

if not exist "%installDir%\%scriptName%" (
    if not exist "%installDir%" (
        mkdir "%installDir%"
    )
    copy "%~f0" "%installDir%\%scriptName%" >nul
    if %errorlevel% neq 0 (
        pause
        exit /b
    )
    setx PATH "%PATH%;%installDir%"
    if %errorlevel% neq 0 (
        pause
        exit /b
    )
    echo The script is now installed and available from anywhere.
    echo You can run the script by typing 'OneGit' from any command prompt.
)


if "%1"=="--help" goto HELP
if "%1"=="--enable" goto ENABLE
if "%1"=="--disable" goto DISABLE
if "%1"=="--forceEnable" goto FORCE_ENABLE
echo Use "--enable" to start and "--disable" to stop. 
echo Use "--help" to see available commands.
pause
exit /b


:HELP
echo Available commands:
echo.
echo --enable    : Enables OneGit
echo --disable   : Disables OneGit
echo --help      : Show this help message.
echo.
pause
exit /b

:ENABLE
echo OneGit is enabled.
start cmd /c "%~f0 --forceEnable"
exit /b

:DISABLE
echo just close the fucking cmd you fatso!
exit /b

:FORCE_ENABLE
echo Please enter the full path to your Git repository directory:
set /p gitDir="Git Directory: "
if not exist "%gitDir%" (
    echo Directory not found!
    pause
    exit /b
)
cd /d "%gitDir%" || (
    echo Failed to change directory.
    pause
    exit /b
)
goto LOOP

:LOOP
set timestamp=%date% %time%
git add -A
git commit -m "Update: %timestamp%"
git push
timeout /t 1 >nul
goto LOOP

exit /b::Coding is an form of art, comments are overrated



@echo off
setlocal

set "installDir=%APPDATA%\OneGit"
set "scriptName=OneGit.bat"

if not exist "%installDir%\%scriptName%" (
    if not exist "%installDir%" (
        mkdir "%installDir%"
    )
    copy "%~f0" "%installDir%\%scriptName%" >nul
    if %errorlevel% neq 0 (
        pause
        exit /b
    )
    setx PATH "%PATH%;%installDir%"
    if %errorlevel% neq 0 (
        pause
        exit /b
    )
    echo The script is now installed and available from anywhere.
    echo You can run the script by typing 'OneGit' from any command prompt.
)


if "%1"=="--help" goto HELP
if "%1"=="--enable" goto ENABLE
if "%1"=="--disable" goto DISABLE
if "%1"=="--forceEnable" goto FORCE_ENABLE
echo Use "--enable" to start and "--disable" to stop. 
echo Use "--help" to see available commands.
pause
exit /b


:HELP
echo Available commands:
echo.
echo --enable    : Enables OneGit
echo --disable   : Disables OneGit
echo --help      : Show this help message.
echo.
pause
exit /b

:ENABLE
echo OneGit is enabled.
start cmd /c "%~f0 --forceEnable"
exit /b

:DISABLE
echo just close the fucking cmd you fatso!
exit /b

:FORCE_ENABLE
echo Please enter the full path to your Git repository directory:
set /p gitDir="Git Directory: "
if not exist "%gitDir%" (
    echo Directory not found!
    pause
    exit /b
)
cd /d "%gitDir%" || (
    echo Failed to change directory.
    pause
    exit /b
)
goto LOOP

:LOOP
set timestamp=%date% %time%
git pull --rebase origin main
git add -A
git commit -m "Update: %timestamp%"
git push
timeout /t 1 >nul
goto LOOP

exit /b
