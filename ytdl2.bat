@echo off
setlocal EnableDelayedExpansion
chcp 65001
rem pushd J:\nxx\DEV\youtube-dl-2021.12.17

:zpet1
cls
echo 1. mp3
echo 2. mp4
echo 3. quit

set /p volba=choose:

if %volba%==1 (
    set prepinac= -x --audio-format mp3 --audio-quality 0 --no-mtime -o C:\Users\Paposh\Downloads\%%(title^^^)s.%%(ext^^^)s
) else if %volba%==2 (
    set prepinac= -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[height<=1080][ext=mp4]" --no-mtime -o C:\Users\Paposh\Downloads\%%(title^^^)s.%%(ext^^^)s
) else  if %volba%==3 (
    goto quit
) else (
    cls
    echo wrong input
    pause
    goto zpet1
)


:zpet2
cls
echo 1. single file
echo 2. whole playlist
echo 3. playlist given start/end

set /p volba2=choose:

if %volba2%==1 (
    set prepinac=%prepinac% --no-playlist
    set /p link=zadej link:
    echo !link! 
    echo !prepinac!
    start /D "J:\nxx\DEV\youtube-dl-2021.12.17" yt-dlp.exe !prepinac! -v !link!
    goto zpet1
) else if %volba2%==2 (
    set prepinac=%prepinac% -ciw
    set /p link=zadej link:
    echo !link! 
    echo !prepinac!
    start /D "J:\nxx\DEV\youtube-dl-2021.12.17" yt-dlp.exe !prepinac! -v !link!
    goto zpet1
) else if %volba2%==3 (
    set /p pos=zadej startovni a koncici pozici:
    set prepinac=%prepinac% -ciw --playlist-items !pos!
    set /p link=zadej link:
    echo !link! 
    echo !prepinac!
    start /D "J:\nxx\DEV\youtube-dl-2021.12.17" yt-dlp.exe !prepinac! -v !link!
    goto zpet1
) else (
    cls
    echo wrong input
    pause
    goto zpet2
)


rem set prepinac= -x --audio-format mp3 -f best --no-playlist --audio-quality 0


pause > nul
:quit