@ECHO OFF

echo Digite o Ano e Semestre da versao Academica a ser gerada (Com ponto). Ex.:
echo Ano de 2023  = 2023
echo 1o. Semestre = 1
echo.
echo Resultado: 2023.1
echo.
set /p VersaoPAE=Resposta: 
set DeployDir=..\Deploy
set PastaPronto=PAE\%VersaoPAE%
set ProntoDir=P:\PRONTO\%PastaPronto%
set HomologacaoDir=O:\PRONTO\%PastaPronto%\Homologacao
set PortalDir=O:\PRONTO\%PastaPronto%\Portal

Title Criando Binarios e Backups dos Bancos
echo Criando Binarios e Backups dos Bancos
want AssertFirebirdVersion AssertMSSQLVersion
if errorlevel 1 goto exit
pause
cls

Title ImportFortesLib
echo ImportFortesLib
want ImportFortesLib
if errorlevel 1 goto exit
pause
cls

Title Deploy
echo Deploy
want Deploy
if errorlevel 1 goto exit
pause
cls
@echo on
RD /S /Q %DeployDir%
pause
pause


Title Copia P:\Pronto\AC para %ProntoDir%
echo Copia P:\Pronto\AC para %ProntoDir%
IF not exist %ProntoDir% mkdir %ProntoDir%
xcopy "P:\Pronto\AC" "%ProntoDir%" /S /E /C /H /O /R /Y /D /V

Title AjustaVersao
echo AjustaVersao
call AjustaVersao.bat

Title PAE
C:
want PAE
if errorlevel 1 goto exit
pause

if not exist %DeployDir% goto exit
if not exist %ProntoDir% goto SemPronto
if not exist %DeployDir%\AC.exe goto NaoGerouAlgo
pause

copy %DeployDir%\AC.exe %ProntoDir%\CD\Programas /Y
pause

Title Rodando makei em %ProntoDir%\Internet
ECHO Rodando makei
P:
cd %ProntoDir%\Internet
call makei.bat
pause
cls

Title Assinando Instalador %filever%
ECHO Assinando Instalador %filever%
wget 10.1.2.185:50016/v1/signapp/fortes --post-file="%ProntoDir%\Internet\FortesACInstalador.exe" -O "%ProntoDir%\Internet\FortesACInstalador_signed.exe"
IF EXIST "%ProntoDir%\Internet\FortesACInstalador_signed.exe" DEL "%ProntoDir%\Internet\FortesACInstalador.exe"
RENAME "%ProntoDir%\Internet\FortesACInstalador_signed.exe" "FortesACInstalador.exe"
pause

Title Copiando ...
ECHO Copiando Instalador %VersaoPAE% para Homologacao
IF NOT EXIST %HomologacaoDir% MKDIR %HomologacaoDir%
pause
copy %ProntoDir%\Internet\FortesACInstalador.exe %HomologacaoDir%

ECHO Copiando Instalador %VersaoPAE% para Portal
IF not exist %PortalDir% mkdir %PortalDir% 
copy %ProntoDir%\Internet\FortesACInstalador.exe %PortalDir%
pause









REM set DeployNuvemDir=..\Deploy\Nuvem
REM setx PastaProntoPAE_Aux %PastaProntoPAE%
REM set ProntoTempDir=P:\PRONTO\%PastaProntoPAE%(Atualizando)
REM set HomologacaoNuvemDir=O:\PRONTO\%PastaProntoPAE%\Homologacao\Nuvem
REM set DocumentosDir=O:\PRONTO\%PastaProntoPAE%\Documentos
REM set AgenteDir=P:\Pronto\ACPessoalAgenteESocial
REM set TotemDir=P:\Pronto\TotemXE
REM
REM Title Criando Binarios e Backups dos Bancos
REM ECHO Criando Binarios e Backups dos Bancos
REM want AssertFirebirdVersion AssertMSSQLVersion
REM if errorlevel 1 goto exit
REM 
REM Title ImportFortesLib
REM want ImportFortesLib
REM 
REM Title Assinar_AgenteESocial
REM want Assinar_AgenteESocial
REM 
REM Title Rodando makei em %AgenteDir%
REM ECHO Rodando makei
REM P:
REM cd %AgenteDir%
REM call makei.bat
REM 
REM Title Copiando FortesACAgenteInstalador.exe
REM ECHO Copiando FortesACAgenteInstalador.exe para %ProntoDir%\Atualizador\
REM P:
REM copy %AgenteDir%\FortesACAgenteInstalador.exe %ProntoDir%\Atualizador\
REM 
REM ECHO Copiando FortesACAgenteInstalador.exe para %ProntoDir%\CD\Programas
REM copy %AgenteDir%\FortesACAgenteInstalador.exe %ProntoDir%\CD\Programas
REM 
REM @echo 0ff
REM Title Copiando FortesTotemSetup.exe
REM ECHO Copiando FortesTotemSetup.exe para %ProntoDir%\Atualizador\
REM P:
REM copy %TotemDir%\FortesTotemSetup.exe %ProntoDir%\Atualizador\
REM 
REM ECHO Copiando FortesTotemSetup.exe para %ProntoDir%\CD\Programas\
REM copy %TotemDir%\FortesTotemSetup.exe %ProntoDir%\CD\Programas\
REM 
REM Title Assinando BkpGDB, Preview e Remprots
REM ECHO Assinando BkpGDB, Preview e Remprots
REM P:
REM cd %ProntoDir%\Internet
REM CALL Assina_BkpGDB_Preview_Remprots_AC.bat
REM if errorlevel 1 goto exit


REM Title Renomeando para %PastaProntoPAE%(Atualizando)
REM ECHO Renomeando para %PastaProntoPAE%(Atualizando)
REM ren %ProntoDir% %PastaProntoPAE%(Atualizando)
REM if not exist %ProntoTempDir% goto SemProntoTemp
REM pause

REM if not exist %DeployDir%\Atualiza.exe goto NaoGerouAlgo
REM if not exist %DeployDir%\ACNovo.bak goto NaoGerouAlgo
REM if not exist %DeployDir%\ACNovo.fbk goto NaoGerouAlgo
REM if not exist %DeployDir%\ACPessoalService.exe goto NaoGerouAlgo
REM if not exist %DeployNuvemDir%\AC.exe goto NaoGerouAlgo
REM if not exist %DeployNuvemDir%\ACPessoalServiceCL.exe goto NaoGerouAlgo
REM cls
REM Title Copiando ...
REM ECHO Copiando Instala.exe para %ProntoTempDir%\CD\
REM copy %DeployDir%\Instala.exe %ProntoTempDir%\CD\
REM pause
REM 
REM ECHO Copiando Atualiza.exe para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\Atualiza.exe %ProntoTempDir%\Atualizador\
REM 
REM ECHO Copiando AtualizaCMD.exe para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\AtualizaCMD.exe %ProntoTempDir%\Atualizador\
REM 
REM ECHO Copiando Update.id para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\Update.id %ProntoTempDir%\Atualizador\
REM pause
REM 
REM ECHO Copiando InstalaTerminal.exe para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\InstalaTerminal.exe %ProntoTempDir%\Atualizador\
REM 
REM ECHO Copiando InstalaTerminal.exe para %ProntoTempDir%\CD\Programas\
REM copy %DeployDir%\InstalaTerminal.exe %ProntoTempDir%\CD\Programas\
REM 
REM ECHO Copiando LEG.DAT para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\LEG.DAT %ProntoTempDir%\Atualizador\
REM pause
REM 
REM ECHO Copiando AC.exe para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\AC.exe %ProntoTempDir%\Atualizador\
REM 
REM ECHO Copiando AC.exe para %ProntoTempDir%\CD\Programas\
REM copy %DeployDir%\AC.exe %ProntoTempDir%\CD\Programas\
REM 
REM ECHO Copiando AC.exe para %ProntoTempDir%\WebServicePessoal\Internet\
REM copy %DeployDir%\ACPessoalService.exe %ProntoTempDir%\WebServicePessoal\Internet\
REM pause
REM 
REM ECHO Copiando AC.exe Nuvem
REM copy %DeployNuvemDir%\AC.exe %ProntoTempDir%\Nuvem
REM copy %DeployNuvemDir%\ACPessoalServiceCL.exe %ProntoTempDir%\Nuvem
REM 
REM ECHO Copiando Instala.exe Nuvem
REM copy %DeployNuvemDir%\Instala.exe %ProntoTempDir%\Nuvem
REM 
REM ECHO Copiando Atualiza.exe Nuvem
REM copy %DeployNuvemDir%\Atualiza.exe %ProntoTempDir%\Nuvem
REM 
REM ECHO Copiando AtualizaCMD.exe Nuvem
REM copy %DeployNuvemDir%\AtualizaCMD.exe %ProntoTempDir%\Nuvem
REM 
REM ECHO Copiando AC.ver para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\AC.ver %ProntoTempDir%\Atualizador\
REM 
REM ECHO Copiando AC.ver para %ProntoTempDir%\CD\Help\
REM copy %DeployDir%\AC.ver %ProntoTempDir%\CD\Help\
REM pause
REM 
REM ECHO Copiando Arquivo CSV Exemplo Contabil para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\Leiaute_CSV_Contabil_Exemplo.csv %ProntoTempDir%\Atualizador\
REM 
REM ECHO Copiando Arquivo CSV Exemplo Contabil para %ProntoTempDir%\CD\Help\
REM copy %DeployDir%\Leiaute_CSV_Contabil_Exemplo.csv %ProntoTempDir%\CD\Help\
REM pause
REM 
REM ECHO Copiando AC.fbk e AC.bak para %ProntoTempDir%\CD\Dados\
REM copy %DeployDir%\ACNovo.fbk %ProntoTempDir%\CD\Dados\AC.fbk
REM copy %DeployDir%\ACNovo.bak %ProntoTempDir%\CD\Dados\AC.bak
REM pause
REM 
REM ECHO Copiando .SQLs para %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\Update.sql %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\UpdateMSSQL.sql %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\Update.dat %ProntoTempDir%\Atualizador\
REM copy %DeployDir%\UpdateMSSQL.dat %ProntoTempDir%\Atualizador\
REM pause
REM 
REM
REM wget 10.1.2.185:50016/v1/signapp/fortes --post-file="%ProntoTempDir%\Internet\FortesACAtualizador.exe" -O "%ProntoTempDir%\Internet\FortesACAtualizador_signed.exe"
REM IF EXIST "%ProntoTempDir%\Internet\FortesACAtualizador_signed.exe" DEL "%ProntoTempDir%\Internet\FortesACAtualizador.exe"
REM RENAME "%ProntoTempDir%\Internet\FortesACAtualizador_signed.exe" "FortesACAtualizador.exe"
REM 
REM ECHO Assinando Instalador %filever%
REM @ECHO OFF
REM C:
REM cd \Projetos\AC\Fontes\Testes
REM ren %ProntoTempDir% %VersaoPAE%
REM pause
REM 
REM ECHO Copiando Documentos
REM copy %ProntoDir%\CD\Help\AC.ver %DocumentosDir%
REM 
REM copy "%ProntoDir%\CD\Help\*.pdf" %DocumentosDir%
REM 
REM FOR /F "tokens=1-3" %%i IN ('c:\Ferramentas\sigcheck.exe "%ProntoDir%\CD\Programas\AC.exe"') DO ( IF "%%i %%j"=="File version:" SET filever=%%k ) 
REM pause
REM set filever=%filever: =%
REM 
REM copy %ProntoDir%\Internet\FortesACAtualizador.exe "%HomologacaoDir%\FortesACAtualizador_%filever%.exe"

REM IF not exist %HomologacaoNuvemDir% mkdir %HomologacaoNuvemDir%
REM ECHO Copiando Arquivos de Nuvem %filever% para %HomologacaoNuvemDir%
REM copy "%ProntoDir%\Nuvem\AC.exe" "%HomologacaoNuvemDir%\AC_%filever%.exe"
REM copy "%ProntoDir%\Nuvem\ACPessoalServiceCL.exe" "%HomologacaoNuvemDir%\ACPessoalServiceCL_%filever%.exe"
REM copy "%ProntoDir%\WebServicePessoal\Internet\ACPessoalService.exe" "%HomologacaoDir%\ACPessoalService_%filever%.exe"
REM pause
REM 
REM IF not exist O:\PRONTO\AC\Portal\%filever%\Nuvem mkdir O:\PRONTO\AC\Portal\%filever%\Nuvem

REM copy P:\Pronto\AC\Internet\FortesACAtualizador.exe O:\PRONTO\AC\Portal\%filever%
REM
REM ECHO Gerar Instalador e Atualizador do Nuvem
REM call P:\Pronto\AC\Internet\GerarInstaladorAtualizadorNuvem.bat
REM 
REM ECHO Assinando Instalador e Atualizador Nuvem %filever%
REM 
REM wget 10.1.2.185:50016/v1/signapp/fortes --post-file="%ProntoTempDir%\Nuvem\FortesACInstaladorNuvem.exe" -O "%ProntoTempDir%\Nuvem\FortesACInstaladorNuvem_signed.exe"
REM IF EXIST "%ProntoTempDir%\Nuvem\FortesACInstaladorNuvem_signed.exe" DEL "%ProntoTempDir%\Nuvem\FortesACInstaladorNuvem.exe"
REM RENAME "%ProntoTempDir%\Nuvem\FortesACInstaladorNuvem_signed.exe" "FortesACInstaladorNuvem.exe"
REM 
REM wget 10.1.2.185:50016/v1/signapp/fortes --post-file="%ProntoTempDir%\Nuvem\FortesACAtualizadorNuvem.exe" -O "%ProntoTempDir%\Nuvem\FortesACAtualizadorNuvem_signed.exe"
REM IF EXIST "%ProntoTempDir%\Nuvem\FortesACAtualizadorNuvem_signed.exe" DEL "%ProntoTempDir%\Nuvem\FortesACAtualizadorNuvem.exe"
REM RENAME "%ProntoTempDir%\Nuvem\FortesACAtualizadorNuvem_signed.exe" "FortesACAtualizadorNuvem.exe"
REM 
REM ECHO Assinando Instalador e Atualizador Nuvem %filever%
REM 
REM ECHO Copiando Arquivos de nuvem %filever% para Portal\Nuvem
REM copy "%ProntoDir%\Nuvem\AC.exe" O:\PRONTO\AC\Portal\%filever%\Nuvem
REM copy "%ProntoDir%\Nuvem\ACPessoalServiceCL.exe" O:\PRONTO\AC\Portal\%filever%\Nuvem
REM copy "%ProntoDir%\Nuvem\AtualizaCMD.exe" O:\PRONTO\AC\Portal\%filever%\Nuvem
REM copy "%ProntoDir%\Nuvem\Atualiza.exe" O:\PRONTO\AC\Portal\%filever%\Nuvem
REM copy "%ProntoDir%\Nuvem\Instala.exe" O:\PRONTO\AC\Portal\%filever%\Nuvem
REM copy "%ProntoDir%\Nuvem\FortesACAtualizadorNuvem.exe" O:\PRONTO\AC\Portal\%filever%\Nuvem
REM copy "%ProntoDir%\Nuvem\FortesACInstaladorNuvem.exe" O:\PRONTO\AC\Portal\%filever%\Nuvem
REM copy "%ProntoDir%\WebServicePessoal\Internet\ACPessoalService.exe" "PortalDir\ACPessoalService.exe"
ECHO.
ECHO Foi, mas eh bom verificar se nao aconteceu erros acima.
goto exit

:SemPronto
ECHO Diretorio %ProntoDir% nao encontrado
goto exit
:NaoGerouAlgo
ECHO Não foi possível gerar algum arquivo necessario para versao
goto exit
:exit
pause
