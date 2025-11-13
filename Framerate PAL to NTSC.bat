@echo off
setlocal

REM === User-defined FFmpeg folder ===
set "ffmpeg_path=apps\FFmpeg\bin"

REM === Check for a dropped file and change to its directory ===
if "%~1"=="" (
    echo.
    echo Error: No file was dropped onto the program.
    echo Please drag an audio file onto this batch file to run it.
    echo.
    pause
    exit
)

REM === Use the file's original directory for processing ===
cd /d "%~dp1"
set "input_file=%~nx1"

REM === Output file name with a clear naming convention ===
set "output_file="%input_file%"_NTSC_audio.wav"

echo.
echo === Processing Audio File for 8-bit WAV Conversion and Resampling ===
echo.
echo Input File: "%input_file%"
echo FFmpeg Path: "%ffmpeg_path%"
echo Output File: "%output_file%"
echo.

REM === The FFmpeg command to convert and resample ===
REM The -c:a pcm_u8 codec is used for 8-bit WAV audio.
REM The -af atempo filter adjusts the audio speed for syncing.
"%ffmpeg_path%\ffmpeg.exe" -i "%input_file%" -af "atempo=23.976/25" -c:a pcm_u8 -ar 48000 "%output_file%"

REM === Check for FFmpeg errors ===
if errorlevel 1 (
    echo.
    echo An error occurred during the FFmpeg process.
    echo Please check your FFmpeg installation and file compatibility.
) else (
    echo.
    echo Resampling successful!
)

pause
exit