@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>nul
if %errorlevel%==0 (
  echo Opening DUCK MedVision at http://localhost:8877
  start "" "http://localhost:8877"
  py -3 -m http.server 8877 --bind 127.0.0.1
  exit /b
)
where python >nul 2>nul
if %errorlevel%==0 (
  start "" "http://localhost:8877"
  python -m http.server 8877 --bind 127.0.0.1
  exit /b
)
echo Python is not installed. Open index.html in your browser instead.
pause
