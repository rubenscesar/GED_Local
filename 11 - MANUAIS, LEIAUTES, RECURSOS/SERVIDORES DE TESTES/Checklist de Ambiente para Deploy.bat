@echo off & mode 140,83 & color 0a
Title Checklist de pre-requisitos para configuracao de um ambiente em condicoes ideais para Deploy

REM Não corrija, apenas verifique
REM 
REM 
REM Feito-  Primeiro verifica se está trabalhando com Delphi 7 ou Delphi XE6
REM Feito-  Se as unidades estão mapeadas
REM         Se as pastas/variáveis estão acessíveis (mas não utilize variáveis ou tenta descobrir um meio de importar essas informações do arquivo de deploy)
REM             o caminho "copy o:\pronto\RemProt\Linux\*.* ..\CD\Linux\ /y" que está no arquivo "P:\PRONTO\ACXE6(Atualizando)\Internet\AtualizaRemProt.bat" que é chamado pelo "makea-makei.bat" não existe mais
REM         Compara (KDiff) os arquivos que são utilizados para Deploy com umas cópias guardadas a fim de identificar possíveis alterações
REM         Se permite renomear as pastas na rede
REM         Se está rodando tudo o que é necessário do ImportFortesLib
REM         Se nas pastas da rede estão apenas os arquivos corretos/esperados e não possue nenhum outro que possa impedir o Deploy.
REM             Ex.: Se já existe na pasta P:\PRONTO\ACXE6(Atualizando)\Nuvem algum arquivo com o nome "FortesACInstaladorNuvem.exe", pois em determindado momento do Deploy
REM             um arquivo será renomeado para este nome e se houver um arquivo igual dará erro de duplicidade encerrando o processo de Deploy
REM         Se nas pastas locais estão todos arquivos esperados e nas versões corretas. Ex.: want
REM         Se a assinatura wget está funcionando
REM         Gerar arquivo de log de tudo com partes analíticas e sintéticas para facilitar
REM         Checar a versão do exe e destacar essa informação neste bat
REM         
REM         
REM         Realizar em determinado ponto do Deploy
REM         Se o arquivo os arquivos não estão corrompidos. Ex.: arquivo com tamanho 0
REM         
REM         
REM         Realizar no final do Deploy
REM         Se todos os arquivos estão nas pastas
REM         Se o arquivo os arquivos não estão corrompidos. Ex.: arquivo com tamanho 0

cls
echo Checklist de pre-requisitos para configuracao de um ambiente em condicoes ideais para Deploy
echo.
echo Digite [1] se deseja analisar o ambiente para Deploy com Delphi 7
echo Digite [2] se deseja analisar o ambiente para Deploy com Delphi XE6
echo ou
echo [9] para Sair
SET /p Utilizar_Delphi7_ou_XE6=Digite o numero correspondente a sua opcao: 
if "%Utilizar_Delphi7_ou_XE6%"=="1" goto D7_AMBIENTE_INICIAL
if "%Utilizar_Delphi7_ou_XE6%"=="2" goto XE6_AMBIENTE_INICIAL
if "%Utilizar_Delphi7_ou_XE6%"=="9" goto SAIR

:D7_AMBIENTE_INICIAL
cls
echo Ambiente para Deploy com Delphi 7
echo Checa alguns arquivos que são utilizados para Deploy a fim de identificar possíveis alterações
timeout -t 3
goto SAIR

:D7_CHECKPOINT_1
:D7_AMBIENTE_FINAL

:XE6_AMBIENTE_INICIAL
@echo off
color 0c
cls
echo Ambiente para Deploy com Delphi XE6
pause
setx PastaProntoPAE PAE\2023.1
pause
echo.
call "D:\6_PROJETOS\ged_local\11 - MANUAIS, LEIAUTES, RECURSOS\SERVIDORES DE TESTES\D7XE6_CHECKPOINT_1.bat"
color 0a
echo.

echo Checa a existencia de alguns arquivos essenciais para Deploy
echo Compara alguns arquivos essenciais para Deploy a fim de identificar possiveis alteracoes
echo C:\Projetos\AC\Fontes\Testes\Deploy_XE6.bat
echo C:\Ferramentas\want.exe
echo C:\Projetos\AC\Fontes\Testes\want_XE.xml
echo P:\Pronto\ACPessoalAgenteESocial\FortesACAgenteInstalador.exe
echo P:\Pronto\TotemXE\FortesTotemSetup.exe
echo P:\PRONTO\ACXE6\Internet\makea-makei.bat
echo C:\Ferramentas\MadExcept\madExceptPatch.exe
echo O:\PRONTO\ELETRON\Ferramentas\DANFE.dll
echo o:\pronto\RemProt\Windows\remprotd.exe
echo o:\pronto\RemProt\Linux\*.*
echo P:\Pronto\Jarvis\JarvisAgentSetup.exe
echo.
echo.
timeout -t 10
goto SAIR

:XE6_CHECKPOINT_1
:XE6_AMBIENTE_FINAL

:SAIR
@echo off & mode 100,40 & color 70
Title Encerrando ...
cls
echo.
echo Encerrando ...
echo.
timeout -t 3
exit