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
echo [1] 5.1 (DTS - +768kbps)                 to Dolby Digital 5.1
echo [2] 5.1 (AC3 - 448kbps)                  to Dolby Digital 5.1
echo [3] 5.1 (AC3 - 384kbps)                  to Dolby Digital 5.1
echo [4] 2.0 (AC3 - 192kbps)                  to Dolby Digital 2.0
echo.
echo [5] 5.1 (DTS - +768kbps / AC3 - 448kbps) to Dolby Digital 2.0 [Downmix]
echo [6] 5.1 (AC3 - 384kbps)                  to Dolby Digital 2.0 [Downmix]
echo [7] 5.1                                  to Dolby Digital 1.0 [Downmix]
echo [8] 2.0 (AC3 - 192kbps)                  to Dolby Digital 1.0 [Downmix]
echo [9] 2.0 (AC3 - 192kbps) (Dual mono)      to Dolby Digital 1.0 [Downmix]
echo.
echo [A] 5.1 (DTS - +768kbps)                 to Dolby Digital Plus 5.1
echo.
echo [B] 5.1 (DTS - +768kbps)                 to Dolby Digital Plus 2.0 [Downmix]
echo [C] 5.1 (DTS - +768kbps)                 to Dolby Digital Plus 1.0 [Downmix]
echo.
echo [D] 5.1 (DTS - +768kbps)                 to Dolby AC-4 2.0
echo.

:menu_choice
choice /c 123456789ABCD /n /m "Choose an option (1-9, A-D):"

if errorlevel 13 goto option13
if errorlevel 12 goto option12
if errorlevel 11 goto option11
if errorlevel 10 goto option10
if errorlevel 9 goto option9
if errorlevel 8 goto option8
if errorlevel 7 goto option7
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
deew -f dd -b 640 -i "%file_to_process%"
pause
goto :end

:option2
echo.
echo === Option 2 selected ===
echo.
deew -f dd -b 448 -i "%file_to_process%"
pause
goto :end

:option3
echo.
echo === Option 3 selected ===
echo.
deew -f dd -b 384 -i "%file_to_process%"
pause
goto :end

:option4
echo.
echo === Option 4 selected ===
echo.
deew -f dd -b 192 -i "%file_to_process%"
pause
goto :end

:option5
echo.
echo === Option 5 selected ===
echo.
deew -dm 2 -f dd -b 224 -i "%file_to_process%"
pause
goto :end

:option6
echo.
echo === Option 6 selected ===
echo.
deew -dm 2 -f dd -b 192 -i "%file_to_process%"
pause
goto :end

:option7
echo.
echo === Option 7 selected ===
echo.
deew -dm 1 -f dd -b 224 -i "%file_to_process%"
pause
goto :end

:option8
echo.
echo === Option 8 selected ===
echo.
deew -dm 1 -f dd -b 192 -i "%file_to_process%"
pause
goto :end

:option9
echo.
echo === Option 9 selected ===
echo.
deew -dm 1 -f dd -b 96 -i "%file_to_process%"
pause
goto :end

:option10
echo.
echo === Option 10 selected ===
echo.
deew -f ddp -b 640 -i "%file_to_process%"
pause
goto :end

:option11
echo.
echo === Option 11 selected ===
echo.
deew -dm 2 -f ddp -b 224 -i "%file_to_process%"
pause
goto :end

:option12
echo.
echo === Option 12 selected ===
echo.
deew -dm 1 -f ddp -b 224 -i "%file_to_process%"
pause
goto :end

:option13
echo.
echo === Option 13 selected ===
echo.
deew -f ac4 -i "%file_to_process%"
pause
goto :end

:end
endlocal
echo.
echo Processing complete.
exit