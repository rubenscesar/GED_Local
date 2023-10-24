echo off
CD\
RD /S /Q C:\Fortes\Atualizadores
DEL /S /Q %temp%\*.*
RD /S /Q %temp%
rd /s /q C:\$Recycle.bin
DEL C:\Fortes\AC\AC*.log
DEL C:\Fortes\Patrio\Patrio*.log
::SET ERRORLEVEL=0
cls
echo.
echo Digite [1] Para encerrar programas que possam estar abertos
echo ou
echo [Enter] para sair
echo.
echo.
echo.
echo.
set /p choice=Digite o numero correspondente a sua opcao: 
if "%choice%"=="1" goto encerrarAC
if "%choice%" goto sair

:sair
exit

:encerrarAC
taskkill.exe /F /FI "IMAGENAME eq AC.exe"
taskkill.exe /F /FI "IMAGENAME eq AC_6*"
taskkill.exe /F /FI "IMAGENAME eq AC_7*"
taskkill.exe /f /FI "IMAGENAME eq Patrio*"
