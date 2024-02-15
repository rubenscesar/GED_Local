@echo off
chcp 65001 >"%temp%"\null
echo.
echo Informe o caminho completo do arquivo de origem, incluindo o nome do arquivo entre aspas
echo.
echo Saidas
echo.
SET /P Cancelado= Nota Fiscal = Cancelada » 
SET /P PARPF= Nota Fiscal de Saida com Participante = Pessoa Fisica » 
SET /P PARPJHEMNormalTAGNormal= Nota Fiscal de Saida com Participante = Pessoa Juridica / HEM = Normal / Tag do Simples Nacional = Normal » 
SET /P PARPJHEMNormalTAGSN= Nota Fiscal de Saida com Participante = Pessoa Juridica / HEM = Normal / Tag do Simples Nacional = Simples Nacional » 
SET /P PARPJHEMSNTAGNormal= Nota Fiscal de Saida com Participante = Pessoa Juridica / HEM = Simples Nacional / Tag do Simples Nacional = Normal » 
SET /P PARPJHEMSNTAGSN= Nota Fiscal de Saida com Participante = Pessoa Juridica / HEM = Simples Nacional / Tag do Simples Nacional = Simples Nacional » 
echo.
echo Entradas
echo.
SET /P EntradaPARPJHEMNormalTAGNormal= Nota Fiscal de Entrada com Participante = Pessoa Juridica / HEM = Normal / Tag do Simples Nacional = Normal » 
SET /P EntradaPARPJHEMSNTAGSN= Nota Fiscal de Entrada com Participante = Pessoa Juridica / HEM = Simples Nacional / Tag do Simples Nacional = Simples Nacional » 
echo.
SET /P CaminhoDestino= Informe o caminho completo de destino, excluindo as aspas » 
echo.
SET /P MunUF= Informe o nome do Municipio e UF no formato "Municipio (UF)", excluindo as aspas » 
echo.
echo.
@echo on
echo SAIDAS
copy %Cancelado% "%CaminhoDestino%\01 Abrasf %MunUF% Saida Cancelado.xml
copy %Cancelado% "%CaminhoDestino%\02 Abrasf %MunUF% Saida SubstituidaComChavesIguais.xml
copy %Cancelado% "%CaminhoDestino%\03 Abrasf %MunUF% Saida SubstitutaComChavesIguais.xml
copy %Cancelado% "%CaminhoDestino%\04 Abrasf %MunUF% Saida SubstituidaSubstitutaComChavesIguais.xml
copy %Cancelado% "%CaminhoDestino%\05 Abrasf %MunUF% Saida SubstituidaSubstitutaComChavesDiferentes.xml
copy %Cancelado% "%CaminhoDestino%\06 Abrasf %MunUF% Saida SubstituidaSubstitutaSemChave.xml
copy %PARPF% "%CaminhoDestino%\07 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCPF UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\08 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\09 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\10 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidTomador.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\11 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidPrestador.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\12 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidPrestacaoDeServ.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\13 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidOrgaoGerador.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\14 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigSemAtivnoArquivo.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\15 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigSemServnoArquivo.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\16 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigSemAtivServnoArquivo.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\17 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigServnoXmlnaoencontradonoBanco.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\18 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigTomadorEmBranco.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\19 a 20 Abrasf %MunUF% - Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed VariasNotas.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\21 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed VariosItens.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\22 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGSN% "%CaminhoDestino%\23 Abrasf %MunUF% Saida HEMNormal TAGSN TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGSN% "%CaminhoDestino%\24 Abrasf %MunUF% Saida HEMNormal TAGSN TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGNormal% "%CaminhoDestino%\25 Abrasf %MunUF% Saida HEMSN TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGNormal% "%CaminhoDestino%\26 Abrasf %MunUF% Saida HEMSN TAGNormal TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\27 Abrasf %MunUF% Saida HEMSN TAGSN TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\28 Abrasf %MunUF% Saida HEMSN TAGSN TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\29 Abrasf %MunUF% Saida HEMSN TAGSN TRIBNaoIncidencia ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\30 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNaoIncidencia ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\31 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBIsento ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\32 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBImune ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\33 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBEstimativa ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\34 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBExigSuspDecisaoJudicial ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\35 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBExigSuspProcedimentoAdministrativo ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMNormalTAGNormal% "%CaminhoDestino%\36 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNaoExistente ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\37 Abrasf %MunUF% Saida HEMSN TAGSN TRIBIsento ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\38 Abrasf %MunUF% Saida HEMSN TAGSN TRIBImune ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\39 Abrasf %MunUF% Saida HEMSN TAGSN TRIBEstimativa ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\40 Abrasf %MunUF% Saida HEMSN TAGSN TRIBExigSuspDecisaoJudicial ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\41 Abrasf %MunUF% Saida HEMSN TAGSN TRIBExigSuspProcedimentoAdministrativo ParCNPJ UFsDif RetDescDedRed.xml
copy %PARPJHEMSNTAGSN% "%CaminhoDestino%\42 Abrasf %MunUF% Saida HEMSN TAGSN TRIBNaoExistente ParCNPJ UFsDif RetDescDedRed.xml
echo ENTRADAS
copy %EntradaPARPJHEMNormalTAGNormal% "%CaminhoDestino%\43 Abrasf %MunUF% Entrada HEMNormal TAGNormal TribNormal ParCNPJ UFsDif RetDescDedRed VariosItens.xml
copy %EntradaPARPJHEMNormalTAGNormal% "%CaminhoDestino%\44 Abrasf %MunUF% Entrada HEMNormal TAGNormal TribNormal ParCNPJ.xml
copy %EntradaPARPJHEMNormalTAGNormal% "%CaminhoDestino%\45 Abrasf %MunUF% Entrada HEMNormal TAGNormal TRIBNaoIncidencia ParCNPJ.xml
copy %EntradaPARPJHEMNormalTAGNormal% "%CaminhoDestino%\46 Abrasf %MunUF% Entrada HEMNormal TAGNormal TRIBSN ParCNPJ.xml
copy %EntradaPARPJHEMSNTAGSN% "%CaminhoDestino%\47 Abrasf %MunUF% Entrada HEMSN TAGSN TRIBSN ParCNPJ RetDescDedRed.xml
copy %EntradaPARPJHEMSNTAGSN% "%CaminhoDestino%\48 Abrasf %MunUF% Entrada HEMSN TAGSN TRIBSN ParCNPJ.xml
copy %EntradaPARPJHEMSNTAGSN% "%CaminhoDestino%\49 Abrasf %MunUF% Entrada HEMSN TAGSN TRIBNaoIncidencia ParCNPJ.xml
@echo off
pause