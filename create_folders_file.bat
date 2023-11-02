@echo off
setlocal enabledelayedexpansion

rem Change the path to the text file that contains the folder names
set "txt_file=Foldersname.txt"

rem Change the path to the directory where you want to create the folders
set "output_dir=.\"

rem Check if the output directory exists, and if not, create it
if not exist "!output_dir!" (
    mkdir "!output_dir!"
)

rem Read the text file line by line and create folders
for /f "delims=" %%A in (!txt_file!) do (
    set "folder_name=%%A"
    mkdir "!output_dir!\!folder_name!"
)

echo Folders created from the text file.
pause
