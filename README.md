# Batch utils
Compilation of batch scripts to automate different tasks.

Files and folders
---
[Create folders with the name provided by a .txt file](#create-folders-with-the-name-provided-by-a-txt-file)

[Save files of a directory in folders with the name of file extensions](#save-files-of-a-directory-in-folders-with-the-name-of-file-extensions)

[Backups to an external drive](#backups-to-an-external-drive)

Internet and connections
---
[Remote desktop automatic connection](#remote-desktop-automatic-connection)


Work with files
---
[Replace comma to points in csv file](#replace-comma-to-points-in-csv-file)

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

## Backups to an external drive

```batch
@echo off
setlocal enabledelayedexpansion

rem Set source and destination directories
set "source=C:\SourceFolder"
set "destination=D:\BackupFolder"

rem Set a timestamp for the backup folder
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
  set "datestamp=%%c-%%a-%%b"
)

rem Create a new backup folder with the timestamp
set "backup_folder=!destination!\Backup_!datestamp!"
mkdir "!backup_folder!"

rem Copy files from source to the backup folder
xcopy "!source!\*" "!backup_folder!\" /E /Y

echo Backup completed to !backup_folder!
pause
```

In this script:

- ``source`` should be set to the path of the folder you want to back up.
- ``destination`` should be set to the path where you want to store the backup.
- The script generates a timestamp for the backup folder using the current date (in the format YYYY-MM-DD).
- It creates a new folder in the destination with the timestamp and copies all the files from the source folder to the backup folder using xcopy.
- You can customize the xcopy options to suit your needs. /E copies directories and subdirectories, and /Y suppresses overwrite prompts.

## Remote desktop automatic connection

This script automatize the remote desktop connection using Microsoft Remote Desktop client.


```batch
@echo off

rem Set the IP address or hostname of the remote computer
set "remote_computer=192.168.1.100"

rem Set the username for the remote session
set "username=your_username"

rem Set the password for the remote session (not recommended for security reasons)
set "password=your_password"

rem Launch the Remote Desktop Client (mstsc.exe) with the specified parameters
mstsc.exe /v:%remote_computer% /u:%username% /p:%password%
```

Should define:

- Username
- Password
- IP address or hostname of the remote computer

## Replace comma to points in csv file

```batch
@echo off
setlocal enabledelayedexpansion

rem Set the input and output file names
set "input_file=input.csv"
set "output_file=output.csv"

rem Replace commas with points in the input file and save the result to the output file
(for /f "usebackq tokens=*" %%a in ("%input_file%") do (
    set "line=%%a"
    set "line=!line:,= .!"
    echo !line!>>"%output_file%"
))

echo Comma to point replacement completed.

```

In this script:

- Replace ``input.csv`` with the name of your input CSV file.
- Replace ``output.csv`` with the name of the output file where you want to save the modified data.

This script reads each line of the input file, replaces commas with points (using the ``!line:,=! .!`` part), and writes the modified line to the output file.

 
