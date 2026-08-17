@echo off
pushd "%~dp0.."
set GRADLE_OPTS=-Xmx5048m
chcp 65001 %= set console code page to Unicode =%
call .\gradlew.bat xspec_clean xspec_test
set exit_code=%ERRORLEVEL%
popd
exit /b %exit_code%
