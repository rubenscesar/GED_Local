@echo off
chcp 65001 > null

echo.
echo Digite [1] para renomear e preparar para transmissao ao Kaspersky
echo Digite [2] para renomear e voltar para a nomenclatura original
echo ou
echo [Enter] para Sair
echo.
echo.
echo.
echo.
set /p choice=Digite o numero correspondente a sua opcao: 
if "%choice%"=="1" goto RenTransmiteKaspersky
if "%choice%"=="2" goto RenNomenclaturaOriginal
if "%choice%" goto Sair

:RenTransmiteKaspersky
cls
Title Renomear e preparar para transmissao ao Kaspersky
echo.
echo A inclusao do primero numero da versao sera automatico.
set /p NumeroVersao=Informe o numero restante da versao sem pontos. Ex.: 19501. Versao 6: 
echo.
set /p NumeroVersaoMask=Informe o numero restante da versao com pontos. Ex.: 195.0.1. Versao 6.: 
echo.
cls
echo.
echo As versoes digitadas foram:
echo 6%NumeroVersao% e 6.%NumeroVersaoMask% respectivamente.
echo Estao corretas?
echo.
echo Digite [1] para Sim
echo Digite [2] para Nao
echo ou
echo [Enter] para Sair
echo.
echo.
echo.
echo.
set /p SimNao=Digite o numero correspondente a sua opcao: 
if "%SimNao%"=="1" goto 
if "%SimNao%"=="2" goto RenTransmiteKaspersky
if "%SimNao%" goto Sair
cls
echo.
echo D7 Desktop
echo ----------
echo.
@echo on
if exist A:\Portal\6.%NumeroVersaoMask%\FortesACInstalador.exe ren A:\Portal\6.%NumeroVersaoMask%\FortesACInstalador.exe FortesACInstalador_D7_6%NumeroVersao%.exe
if exist A:\Portal\6.%NumeroVersaoMask%\FortesACInstalador.exe (echo D7 Desktop/Portal - NAO DEU CERTO) else (echo D7 Desktop/Portal - Renomeado com sucesso)

if exist A:\Portal\6.%NumeroVersaoMask%\FortesACAtualizador.exe ren A:\Portal\6.%NumeroVersaoMask%\FortesACAtualizador.exe FortesACAtualizador_D7_6%NumeroVersao%.exe
if exist A:\Portal\6.%NumeroVersaoMask%\FortesACAtualizador.exe (echo D7 Desktop/Portal - NAO DEU CERTO) else (echo D7 Desktop/Portal - Renomeado com sucesso)

if exist A:\Portal\6.%NumeroVersaoMask%\ACPessoalService.exe ren A:\Portal\6.%NumeroVersaoMask%\ACPessoalService.exe ACPessoalService_D7_6%NumeroVersao%.exe
if exist A:\Portal\6.%NumeroVersaoMask%\ACPessoalService.exe (echo D7 Desktop/Portal - NAO DEU CERTO) else (echo D7 Desktop/Portal - Renomeado com sucesso)
@echo off
timeout -t 10









REM @echo off
REM echo D7 Nuvem
REM ren A:\Portal\6.195.0.1\Nuvem\AC.exe AC_D7Nuvem_619501.exe
REM ren A:\Portal\6.195.0.1\Nuvem\Instala.exe Instala_D7Nuvem_619501.exe
REM ren A:\Portal\6.195.0.1\Nuvem\Atualiza.exe Atualiza_D7Nuvem_619501.exe
REM ren A:\Portal\6.195.0.1\Nuvem\AtualizaCMD.exe AtualizaCMD_D7Nuvem_619501.exe
REM ren A:\Portal\6.195.0.1\Nuvem\FortesACInstaladorNuvem.exe FortesACInstaladorNuvem_D7Nuvem_619501.exe
REM ren A:\Portal\6.195.0.1\Nuvem\FortesACAtualizadorNuvem.exe FortesACAtualizadorNuvem_D7Nuvem_619501.exe
REM ren A:\Portal\6.195.0.1\Nuvem\ACPessoalServiceCL.exe ACPessoalServiceCL_D7Nuvem_619501.exe
REM echo.
REM echo.
REM echo.
REM echo XE6 Desktop
REM ren B:\Portal\7.195.0.1\FortesACInstalador.exe FortesACInstalador_XE6_619501.exe
REM ren B:\Portal\7.195.0.1\FortesACAtualizador.exe FortesACAtualizador_XE6_619501.exe
REM ren B:\Portal\7.195.0.1\ACPessoalService.exe ACPessoalService_XE6_619501.exe
REM echo.
REM echo XE6 Nuvem
REM ren B:\Portal\7.195.0.1\Nuvem\AC.exe AC_XE6Nuvem_619501.exe
REM ren B:\Portal\7.195.0.1\Nuvem\FortesACInstalador.exe FortesACInstalador_XE6Nuvem_619501.exe
REM ren B:\Portal\7.195.0.1\Nuvem\FortesACAtualizador.exe FortesACAtualizador_XE6Nuvem_619501.exe
REM ren B:\Portal\7.195.0.1\Nuvem\AtualizaCMD.exe AtualizaCMD_XE6Nuvem_619501.exe
REM ren B:\Portal\7.195.0.1\Nuvem\ACPessoalServiceCL.exe ACPessoalServiceCL_XE6Nuvem_619501.exe
REM 
REM 
REM 
REM 
REM 
REM 
REM 
REM pause
REM 
REM 
REM ren A:\Portal\6.195.0.1\FortesACInstalador_D7_619501.exe FortesACInstalador.exe
REM ren A:\Portal\6.195.0.1\FortesACAtualizador_D7_619501.exe FortesACAtualizador.exe
REM ren A:\Portal\6.195.0.1\ACPessoalService_D7_619501.exe ACPessoalService.exe
REM echo.
REM echo D7 Nuvem
REM ren A:\Portal\6.195.0.1\Nuvem\AC_D7Nuvem_619501.exe AC.exe
REM ren A:\Portal\6.195.0.1\Nuvem\Instala_D7Nuvem_619501.exe Instala.exe
REM ren A:\Portal\6.195.0.1\Nuvem\Atualiza_D7Nuvem_619501.exe Atualiza.exe
REM ren A:\Portal\6.195.0.1\Nuvem\AtualizaCMD_D7Nuvem_619501.exe AtualizaCMD.exe
REM ren A:\Portal\6.195.0.1\Nuvem\FortesACInstaladorNuvem_D7Nuvem_619501.exe FortesACInstaladorNuvem.exe
REM ren A:\Portal\6.195.0.1\Nuvem\FortesACAtualizadorNuvem_D7Nuvem_619501.exe FortesACAtualizadorNuvem.exe
REM ren A:\Portal\6.195.0.1\Nuvem\ACPessoalServiceCL_D7Nuvem_619501.exe ACPessoalServiceCL.exe
REM echo.
REM echo.
REM echo.
REM echo XE6 Desktop
REM ren B:\Portal\7.195.0.1\FortesACInstalador_XE6_619501.exe FortesACInstalador.exe
REM ren B:\Portal\7.195.0.1\FortesACAtualizador_XE6_619501.exe FortesACAtualizador.exe
REM ren B:\Portal\7.195.0.1\ACPessoalService_XE6_619501.exe ACPessoalService.exe
REM echo.
REM echo XE6 Nuvem
REM ren B:\Portal\7.195.0.1\Nuvem\AC_XE6Nuvem_619501.exe AC.exe
REM ren B:\Portal\7.195.0.1\Nuvem\FortesACInstalador_XE6Nuvem_619501.exe FortesACInstalador.exe
REM ren B:\Portal\7.195.0.1\Nuvem\FortesACAtualizador_XE6Nuvem_619501.exe FortesACAtualizador.exe
REM ren B:\Portal\7.195.0.1\Nuvem\AtualizaCMD_XE6Nuvem_619501.exe AtualizaCMD.exe
REM ren B:\Portal\7.195.0.1\Nuvem\ACPessoalServiceCL_XE6Nuvem_619501.exe ACPessoalServiceCL.exe
