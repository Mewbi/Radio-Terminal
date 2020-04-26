echo off
cls
title Radio

set PATH=%PATH%;C:\Users\T-GAMER\Documents\mpg123-1.25.13-x86-64

echo 	Radio

:: Adicione Títulos da rádio
echo 1 - Chillsky - LoFi
echo 2 - Chill - Indie
echo 3 - Trap Eletronic
echo 4 - Synthwave Retrowave

set /p radio= Choose a radio: 

:: Adicione o link da rádio
if %radio% == 1 set play=http://hyades.shoutca.st:8043/autodj
if %radio% == 2 set play=http://192.227.85.169:4303/stream
if %radio% == 3 set play=http://149.56.151.181:9992/stream
if %radio% == 4 set play=http://139.162.14.151:9090/160mp3

mpg123.exe %play%

exit