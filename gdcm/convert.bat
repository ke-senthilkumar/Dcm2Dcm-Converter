@echo off
setlocal enabledelayedexpansion

set "IN_DIR=d:\in"
set "OUT_DIR=d:\out"

for /R "%IN_DIR%" %%i in (*.*) do (
    :: Get full input file path
    set "INFILE=%%i"

    :: Build relative path (remove input base path)
    set "REL_PATH=!INFILE:%IN_DIR%=!"

    :: Build output file path with same subdirectory structure
    set "OUTFILE=%OUT_DIR%!REL_PATH!"

    :: Make sure destination folder exists
    for %%D in ("!OUTFILE!") do if not exist "%%~dpD" mkdir "%%~dpD"

    :: Process file with gdcmconv, preserving structure
    echo Processing "%%i"
    gdcmconv -r -w -i "%%i" -o "!OUTFILE!"
)

echo Done!
pause 
