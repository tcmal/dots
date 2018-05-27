echo off
echo Generating executable from the script and embedding Resources.resx as resource 
echo .
cscs /e script.cs 
echo .
echo Executing script.exe, which reads and prints embedded resource data ('String1')
script.exe
echo .
pause