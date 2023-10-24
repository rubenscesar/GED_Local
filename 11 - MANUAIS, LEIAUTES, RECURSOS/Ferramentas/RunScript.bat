@echo off
chcp 1252 >"%temp%"\null
set Caminho=%cd%

if exist "%Caminho%\AC.fdb" (set DB="%Caminho%\AC.fdb")
if not exist "%Caminho%\AC.fdb" (set /p DB=INFORME O CAMINHO DO BANCO DE DADOS COM aspas "": 
                                 echo.
                                 echo.)
echo CAMINHO DO BANCO: %DB%
echo.
if exist "%Caminho%\BKP_AntesDeRodarRunScript.fdb" del "%Caminho%\BKP_AntesDeRodarRunScript.fdb"
copy %DB% "%Caminho%\BKP_AntesDeRodarRunScript.fdb" >"%temp%"\null
if exist "%Caminho%\Update.sql" (echo CAMINHO DO SCRIPT: "%Caminho%\Update.sql")
if not exist "%Caminho%\Update.sql" (echo CAMINHO DO SCRIPT: "C:\Projetos\AC\Fontes\Atualizador\Update.sql")
echo.
if exist "%Caminho%\Update.sql" (call "c:\Ferramentas\RunScript\RunScript.exe" %DB% "%Caminho%\Update.sql" SYSDBA masterkey)
if not exist "%Caminho%\Update.sql" (call "c:\Ferramentas\RunScript\RunScript.exe" %DB% "C:\Projetos\AC\Fontes\Atualizador\Update.sql" SYSDBA masterkey)