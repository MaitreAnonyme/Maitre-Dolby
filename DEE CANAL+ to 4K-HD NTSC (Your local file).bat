@echo off
setlocal

rem === Checks if a file was dropped onto the program ===
if "%~1"=="" (
    echo.
    echo Error: No file was dropped onto the program.
    echo Please drag a file onto this batch script to run it.
    echo.
    pause
    goto :end
)

rem === Stores the file path in a variable ===
set "file_to_process=%~1"

rem === Checks if the file exists ===
if not exist "%file_to_process%" (
    echo.
    echo Error: The file "%file_to_process%" does not exist.
    echo.
    pause
    goto :end
)

echo.
echo === File Detected: "%file_to_process%" ===
echo.
echo Please choose an option to process the file:
echo.
echo [1] 2.0 (AAC - 128kbps)                         to Dolby Digital 2.0
echo.
echo [2] 5.1 (EAC3 Atmos - 576kbps)                  to Dolby Digital Plus 5.1
echo [3] 5.1/2.0 (EAC3 - 384kbps)                    to Dolby Digital Plus 5.1/2.0
echo.
echo [4] 5.1 (EAC3 Atmos - 576kbps / EAC3 - 384kbps) to Dolby Digital Plus 2.0 [Downmix]
echo [5] 5.1/2.0 (EAC3 - 384kbps)                    to Dolby Digital Plus 1.0 [Downmix]
echo.
echo [6] 5.1 (EAC3 Atmos - 576kbps / EAC3 - 384kbps) to Dolby AC-4 2.0
echo.

:menu_choice
choice /c 123456 /n /m "Choose an option (1-6):"

if errorlevel 6 goto option6
if errorlevel 5 goto option5
if errorlevel 4 goto option4
if errorlevel 3 goto option3
if errorlevel 2 goto option2
if errorlevel 1 goto option1

:option1
echo.
echo === Option 1 selected ===
echo.
deew -f dd -b 128 -i "%file_to_process%"
pause
goto :end

:option2
echo.
echo === Option 2 selected ===
echo.
deew -f ddp -b 576 -i "%file_to_process%"
pause
goto :end

:option3
echo.
echo === Option 3 selected ===
echo.
deew -f ddp -b 384 -i "%file_to_process%"
pause
goto :end

:option4
echo.
echo === Option 4 selected ===
echo.
deew -dm 2 -f ddp -b 224 -i "%file_to_process%"
pause
goto :end

:option5
echo.
echo === Option 5 selected ===
echo.
deew -dm 1 -f ddp -b 224 -i "%file_to_process%"
pause
goto :end

:option6
echo.
echo === Option 6 selected ===
echo.
deew -f ac4 -i "%file_to_process%"
pause
goto :end

:end
endlocal
echo.
echo Processing complete.
exit