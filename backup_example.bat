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