# Batch utils
Recopilation of batch utils to automatize different tasks

[Create folders with the name provided by a .txt file](#create-folders-with-the-name-provided-by-a-txt-file)

[Save files of a directory in folders with the name of file extensions](#save-files-of-a-directory-in-folders-with-the-name-of-file-extensions)

## Create folders with the name provided by a txt file
The script is ``create_folders_file.bat``. This script create folders in a directory with the name of the lines provided by a .txt file. Useful for repetitive folder creation tasks.

```batch
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

```


## Save files of a directory in folders with the name of file extensions

This script is ``folder_extension.bat``. For each file extension detected in a directory, create a folder and moves the file into.

```batch
@echo off

rem For each file in your folder
for %%a in (".\*") do (
rem check if the file has an extension and if it is not our script
if "%%~xa" NEQ "" if "%%~dpxa" NEQ "%~dpx0" (
rem check if extension folder exists, if not it is created
if not exist "%%~xa" mkdir "%%~xa"
rem Move the file to directory
move "%%a" "%%~dpa%%~xa\"
))
```



