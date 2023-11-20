cls
@echo off
set P_Pronto=\\10.1.254.70\x\Programacao\PRONTO\AC\CD\Dados
set PathDestino=\\10.1.254.70\Desenvolvimento\AC_Fiscal\Testes\Rubens\BKP\Dados

Title BACKUP
dir %P_Pronto% >"%temp%"\null 2>&1
if %errorlevel% equ 0 (IF EXIST %PathDestino% goto PathDestinoExiste
                       IF NOT EXIST %PathDestino% goto PathDestinoNaoExiste)
if %errorlevel% equ 1 goto P_ProntoNaoExiste

:PathDestinoExiste
set data=%date%
set ano=%data:~6,4%
set mes=%data:~3,2%
set dia=%data:~0,2%
set hora=%time%
set hh=%hora:~0,2%
set mm=%hora:~3,2%
echo Guardando backup dos bancos do %P_Pronto% em %PathDestino%.

set file1=%P_Pronto%\AC.bak
set file2=%PathDestino%\CopiaRealizadaEm_%dia%%mes%%ano%_As_%hh%h%mm%m__AC.bak
copy %file1% %file2% /Y
echo Arquivo copiado: %file2%
set file3="%P_Pronto%\AC.fbk"
set file4="%PathDestino%\CopiaRealizadaEm_%dia%%mes%%ano%_As_%hh%h%mm%m__AC.fbk"
copy %file3% %file4% /Y
echo Arquivo copiado: %file4%
set file5="%P_Pronto%\AC_bak.fbk"
set file6="%PathDestino%\CopiaRealizadaEm_%dia%%mes%%ano%_As_%hh%h%mm%m__AC_bak.fbk"
copy %file5% %file6% /Y
echo Arquivo copiado: %file6%
set file7="%P_Pronto%\cs9.cds"
set file8="%PathDestino%\CopiaRealizadaEm_%dia%%mes%%ano%_As_%hh%h%mm%m__cs9.cds"
copy %file7% %file8% /Y
echo Arquivo copiado: %file8%
echo.
echo.
call CompareArqHashes.bat %file1% %file2%
call CompareArqHashes.bat %file3% %file4%
call CompareArqHashes.bat %file5% %file6%
call CompareArqHashes.bat %file7% %file8%
CLS
echo.
echo Copia realizada com sucesso!
echo.
pause
exit

:PathDestinoNaoExiste
CLS
echo.
echo %PathDestino% Não localizado
echo.
pause
exit

:P_ProntoNaoExiste
CLS
echo.
echo %P_Pronto% Não localizado
echo.
pause
exit