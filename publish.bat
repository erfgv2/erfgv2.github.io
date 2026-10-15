@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

set "SITE_ROOT=%~dp0"
set "HUGO=%SITE_ROOT%hugo.exe"

echo.
echo ============================================================
echo   Build + publish  -  erfgv2.github.io
echo ============================================================
echo.

if not exist "%HUGO%" (
  echo   ERROR: hugo.exe not found at
  echo   %HUGO%
  pause
  exit /b 1
)

echo [1/4] Building static site ...
"%HUGO%" --minify --gc --cleanDestinationDir
if errorlevel 1 (
  echo.
  echo   BUILD FAILED - nothing was staged or committed.
  pause
  exit /b 1
)
if not exist "public\index.html" (
  echo.
  echo   ERROR: public\index.html missing after build.
  pause
  exit /b 1
)
echo   OK
echo.

echo [2/4] Staging changes ...
git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo   Nothing changed - nothing to publish.
  echo.
  pause
  exit /b 0
)
git --no-pager diff --cached --stat
echo.

set "MSG="
set /p "MSG=Commit message (Enter = Update site): "
if "%MSG%"=="" set "MSG=Update site"
echo.

echo [3/4] Committing ...
git commit -m "%MSG%"
if errorlevel 1 (
  echo.
  echo   COMMIT FAILED - nothing was pushed.
  pause
  exit /b 1
)
echo.

echo [4/4] Pushing to GitHub ...
set /a TRY=0
:pushtry
set /a TRY+=1
echo   attempt %TRY% ...
git push origin main
if not errorlevel 1 goto pushed
if %TRY% GEQ 5 goto pushfail
ping -n 6 127.0.0.1 >nul
goto pushtry

:pushfail
echo.
echo   PUSH FAILED after %TRY% attempts.
echo   Your commit is safe locally. Retry later with:  git push origin main
echo.
pause
exit /b 1

:pushed
echo.
echo ============================================================
echo   Done. GitHub publishes it in about 40 seconds:
echo   https://erfgv2.github.io/
echo ============================================================
echo.
pause
exit /b 0
