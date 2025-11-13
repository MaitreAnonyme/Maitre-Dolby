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
echo [1] 5.1           to Dolby Digital 5.1 (640kbps)
echo [2] 2.0/1.0       to Dolby Digital 2.0/1.0 (224kbps)
echo.
echo [3] 7.1           to Dolby Digital 5.1 [Downmix] (640kbps)
echo [4] 7.1/5.1       to Dolby Digital 2.0 [Downmix] (224kbps)
echo [5] 7.1/5.1/2.0   to Dolby Digital 1.0 [Downmix] (224kbps)
echo.
echo [6] 7.1           to Dolby Digital Plus 7.1 (Blu-Ray / 1024kbps)
echo [7] 7.1           to Dolby Digital Plus 7.1 (768kbps)
echo [8] 5.1           to Dolby Digital Plus 5.1 (640kbps)
echo [9] 2.0/1.0       to Dolby Digital Plus 2.0/1.0 (224kbps)
echo.
echo [A] 7.1           to Dolby Digital Plus 5.1 [Downmix] (640kbps)
echo [B] 7.1/5.1       to Dolby Digital Plus 2.0 [Downmix] (224kbps)
echo [C] 7.1/5.1/2.0   to Dolby Digital Plus 1.0 [Downmix] (224kbps)
echo.
echo [D] 7.1/5.1/2.0   to Dolby TrueHD 7.1/5.1/2.0
echo.
echo [E] Atmos         to Dolby Digital Plus Atmos 7.1.4 (Blu-Ray / 1280kbps) (WAV / MKV file source)
echo [F] Atmos         to Dolby Digital Plus Atmos 5.1.4 (Streaming / 768kbps) (WAV / MKV file source)
echo.
echo [G] 5.1           to Dolby AC-4 2.0 (320kbps)
echo.

:menu_choice
choice /c 123456789ABCDEFG /n /m "Choose an option (1-9, A-G): "

:: Note: IF ERRORLEVEL checks must be in descending order.
if errorlevel 16 goto option16
if errorlevel 15 goto option15
if errorlevel 14 goto option14
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
deew -f dd -b 224 -i "%file_to_process%"
pause
goto :end

:option3
echo.
echo === Option 3 selected ===
echo.
deew -dm 6 -f dd -b 640 -i "%file_to_process%"
pause
goto :end

:option4
echo.
echo === Option 4 selected ===
echo.
deew -dm 2 -f dd -b 224 -i "%file_to_process%"
pause
goto :end

:option5
echo.
echo === Option 5 selected ===
echo.
deew -dm 1 -f dd -b 224 -i "%file_to_process%"
pause
goto :end

:option6
echo.
echo === Option 6 selected ===
echo.
deezy encode ddp-bluray --bitrate 1024 --channels 8 "%file_to_process%"
pause
goto :end

:option7
echo.
echo === Option 7 selected ===
echo.
deew -f ddp -b 768 -i "%file_to_process%"
pause
goto :end

:option8
echo.
echo === Option 8 selected ===
echo.
deew -f ddp -b 640 -i "%file_to_process%"
pause
goto :end

:option9
echo.
echo === Option 9 selected ===
echo.
deew -f ddp -b 224 -i "%file_to_process%"
pause
goto :end

:option10
echo.
echo === Option 10 selected ===
echo.
deew -dm 6 -f ddp -b 640 -i "%file_to_process%"
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
deew -f thd -i "%file_to_process%"
pause
goto :end

:option14
echo.
echo === Option 14 selected ===
echo.
deezy encode atmos --atmos-mode bluray ""%file_to_process%""
pause
goto :end

:option15
echo.
echo === Option 15 selected ===
echo.
deezy encode atmos --atmos-mode streaming --bitrate 768 ""%file_to_process%""
pause
goto :end

:option16
echo.
echo === Option 16 selected ===
echo.
deew -f ac4 -i "%file_to_process%"
pause
goto :end

:end
endlocal
echo.
echo Processing complete.
exit