@echo off
echo.
echo Digite [1] Para renomear e preparar para transmissao ao Kaspersky
echo Digite [2] Para renomear e voltar para a nomenclatura original
echo ou
echo [Enter] para Sair
echo.
echo.
echo.
echo.
set /p NumeroVersao=Informe o numero restante da versao com pontos. Ex.: 6.195.0.1. Versao 6.: 
echo.
set /p choice=Digite o numero correspondente a sua opcao: 
if "%choice%"=="1" goto RenTransmiteKaspersky
if "%choice%"=="2" goto RenNomenclaturaOriginal
if "%choice%" goto Sair

:RenTransmiteKaspersky
Title Renomear e preparar para transmissão ao Kaspersky
cls
echo.
echo.
echo D7
echo --
echo.
echo.
@echo on
if exist A:\Portal\%NumeroVersao%_Previa\AC.exe ren A:\Portal\%NumeroVersao%_Previa\AC.exe AC_D7_619402.exe
if exist A:\Portal\%NumeroVersao%_Previa\AC.exe (echo D7/Portal - NAO DEU CERTO) else (echo D7/Portal - Renomeado com sucesso)
@echo off
timeout -t 10
echo.
echo.
echo D7/Nuvem
echo --------
echo.
echo.
@echo on
if exist A:\Portal\%NumeroVersao%_Previa\Nuvem\AC.exe ren A:\Portal\%NumeroVersao%_Previa\Nuvem\AC.exe AC_D7_Nuvem_619402.exe
if exist A:\Portal\%NumeroVersao%_Previa\Nuvem\AC.exe (echo D7/Portal/Nuvem - NAO DEU CERTO) else (echo D7/Portal/Nuvem - Renomeado com sucesso)
@echo off
timeout -t 10
echo.
echo.
echo =======================================================
echo.
echo.
echo XE6
echo ---
echo.
echo.
@echo on
if exist B:\Portal\%NumeroVersao%_Previa\AC.exe ren B:\Portal\%NumeroVersao%_Previa\AC.exe AC_XE6_719402.exe
if exist B:\Portal\%NumeroVersao%_Previa\AC.exe (echo XE6/Portal - NAO DEU CERTO) else (echo XE6/Portal - Renomeado com sucesso)
@echo off
timeout -t 10
echo.
echo.
echo XE6\Nuvem
echo ---------
echo.
echo.
@echo on
if exist B:\Portal\%NumeroVersao%_Previa\Nuvem\AC.exe ren B:\Portal\%NumeroVersao%_Previa\Nuvem\AC.exe AC_XE6_Nuvem_719402.exe
if exist B:\Portal\%NumeroVersao%_Previa\Nuvem\AC.exe (echo XE6/Portal/Nuvem - NAO DEU CERTO) else (echo XE6/Portal/Nuvem - Renomeado com sucesso)
@echo off
timeout -t 10
goto Sair




:RenNomenclaturaOriginal
color 0a
Title Renomear e preparar para transmissão ao Kaspersky
cls
echo.
echo.
echo D7
echo --
echo.
echo.
@echo on
if exist A:\Portal\%NumeroVersao%_Previa\AC_D7_619402.exe ren A:\Portal\%NumeroVersao%_Previa\AC_D7_619402.exe AC.exe
if exist A:\Portal\%NumeroVersao%_Previa\AC_D7_619402.exe (echo D7/Portal - NAO DEU CERTO) else (echo D7/Portal - Renomeado com sucesso)
@echo off
timeout -t 10
echo.
echo.
echo D7/Nuvem
echo --------
echo.
echo.
@echo on
if exist A:\Portal\%NumeroVersao%_Previa\Nuvem\AC_D7_Nuvem_619402.exe ren A:\Portal\%NumeroVersao%_Previa\Nuvem\AC_D7_Nuvem_619402.exe AC.exe
if exist A:\Portal\%NumeroVersao%_Previa\Nuvem\AC_D7_Nuvem_619402.exe (echo D7/Portal/Nuvem - NAO DEU CERTO) else (echo D7/Portal/Nuvem - Renomeado com sucesso)
@echo off
timeout -t 10
echo.
echo.
echo =======================================================
echo.
echo.
echo XE6
echo ---
echo.
echo.
@echo on
if exist B:\Portal\%NumeroVersao%_Previa\AC_XE6_719402.exe ren B:\Portal\%NumeroVersao%_Previa\AC_XE6_719402.exe AC.exe
if exist B:\Portal\%NumeroVersao%_Previa\AC_XE6_719402.exe (echo XE6/Portal - NAO DEU CERTO) else (echo XE6/Portal - Renomeado com sucesso)
@echo off
timeout -t 10
echo.
echo.
echo XE6\Nuvem
echo ---------
echo.
echo.
@echo on
if exist B:\Portal\%NumeroVersao%_Previa\Nuvem\AC_XE6_Nuvem_719402.exe ren B:\Portal\%NumeroVersao%_Previa\Nuvem\AC_XE6_Nuvem_719402.exe AC.exe
if exist B:\Portal\%NumeroVersao%_Previa\Nuvem\AC_XE6_Nuvem_719402.exe (echo XE6/Portal/Nuvem - NAO DEU CERTO) else (echo XE6/Portal/Nuvem - Renomeado com sucesso)
@echo off
timeout -t 10
goto Sair




:Sair
exit