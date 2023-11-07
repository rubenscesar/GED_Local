cls
@echo off
Title BACKUP
IF EXIST "C:\Fortes\AC\AC.fdb" goto EXISTE
IF NOT EXIST "C:\Fortes\AC\AC.fdb" goto dbNEXISTE
rem copy C:\Fortes\AC\AC.fdb C:\Projetos\TestesFuncionais\FORTES FISCAL\Dados
pause

:EXISTE
IF NOT EXIST "C:\Projetos\TestesFuncionais\FORTES FISCAL\Dados" goto pastaDestinoNEXISTE
color 0a
set data=%date%
set ano=%data:~6,4%
set mes=%data:~3,2%
set dia=%data:~0,2%
set hora=%time%
set hh=%hora:~0,2%
set mm=%hora:~3,2%
copy /y "C:\Fortes\AC\AC.fdb" "C:\Projetos\TestesFuncionais\FORTES FISCAL\Dados\AC.%dia%%mes%%ano%.%hh%%mm%.FDB"
CLS
echo.
echo.
echo.   COPIA DE SEGURANCA REALIZADA COM SUCESSO.
echo.
echo.
pause
exit

:dbNEXISTE
color 4e
CLS
echo.
echo.
echo.          ARQUIVO
echo.   "C:\Fortes\AC\AC.fdb"
echo.
echo.      NAO LOCALIZADO
echo.
echo.
pause
exit

:pastaDestinoNEXISTE
color 4e
CLS
echo.
echo.
echo.                    PASTA DE DESTINO
echo.   "C:\Projetos\TestesFuncionais\FORTES FISCAL\Dados"
echo.
echo.                     NAO LOCALIZADA
echo.
echo.
pause
exit