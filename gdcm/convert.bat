for /R E:\in\ %%i IN (*.dcm) DO (
gdcmconv -w -i  %%i -o E:\out\%%~nxi
)