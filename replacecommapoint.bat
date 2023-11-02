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
