@echo off

rem Set the IP address or hostname of the remote computer
set "remote_computer=192.168.1.100"

rem Set the username for the remote session
set "username=your_username"

rem Set the password for the remote session (not recommended for security reasons)
set "password=your_password"

rem Launch the Remote Desktop Client (mstsc.exe) with the specified parameters
mstsc.exe /v:%remote_computer% /u:%username% /p:%password%