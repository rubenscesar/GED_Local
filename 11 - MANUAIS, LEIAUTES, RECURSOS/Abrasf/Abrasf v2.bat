@echo off
chcp 65001 >"%temp%"\null
echo.
SET /P CaminhoOrigem= Informe o caminho completo do arquivo de origem, incluindo o nome do arquivo entre aspas, para as saídas » 
echo.
SET /P CaminhoDestino= Informe o caminho completo de destino, excluindo as aspas » 
echo.
SET /P MunUF= Informe o nome do Municipio e UF no formato "Municipio (UF)", excluindo as aspas » 
echo.
SET /P CaminhoOrigemEntrada= Informe o caminho completo da origem, incluindo o nome do arquivo entre aspas, para as entradas » 
echo.
echo.
@echo on
echo SAIDAS
copy %CaminhoOrigem% "%CaminhoDestino%\01 Abrasf %MunUF% Saida Cancelado.xml
copy %CaminhoOrigem% "%CaminhoDestino%\02 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCPF UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\03 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\04 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif.xml
copy %CaminhoOrigem% "%CaminhoDestino%\05 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidTomador.xml
copy %CaminhoOrigem% "%CaminhoDestino%\06 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidPrestador.xml
copy %CaminhoOrigem% "%CaminhoDestino%\07 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidPrestacaoDeServ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\08 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed LocIncidOrgaoGerador.xml
copy %CaminhoOrigem% "%CaminhoDestino%\09 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigSemAtivnoArquivo.xml
copy %CaminhoOrigem% "%CaminhoDestino%\10 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigSemServnoArquivo.xml
copy %CaminhoOrigem% "%CaminhoDestino%\11 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigSemAtivServnoArquivo.xml
copy %CaminhoOrigem% "%CaminhoDestino%\12 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigServnoXmlnaoencontradonoBanco.xml
copy %CaminhoOrigem% "%CaminhoDestino%\13 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed ConfigTomadorEmBranco.xml
copy %CaminhoOrigem% "%CaminhoDestino%\14 a 15 Abrasf %MunUF% - Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed VariasNotas.xml
copy %CaminhoOrigem% "%CaminhoDestino%\16 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed VariosItens.xml
copy %CaminhoOrigem% "%CaminhoDestino%\17 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\18 Abrasf %MunUF% Saida HEMNormal TAGSN TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\19 Abrasf %MunUF% Saida HEMNormal TAGSN TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\20 Abrasf %MunUF% Saida HEMSN TAGNormal TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\21 Abrasf %MunUF% Saida HEMSN TAGNormal TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\22 Abrasf %MunUF% Saida HEMSN TAGSN TRIBNormal ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\23 Abrasf %MunUF% Saida HEMSN TAGSN TRIBSN ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\24 Abrasf %MunUF% Saida HEMSN TAGSN TRIBNaoIncidencia ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\25 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNaoIncidencia ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\26 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBIsento ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\27 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBImune ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\28 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBEstimativa ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\29 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBExigSuspDecisaoJudicial ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\30 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBExigSuspProcedimentoAdministrativo ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\31 Abrasf %MunUF% Saida HEMNormal TAGNormal TRIBNaoExistente ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\32 Abrasf %MunUF% Saida HEMSN TAGSN TRIBIsento ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\33 Abrasf %MunUF% Saida HEMSN TAGSN TRIBImune ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\34 Abrasf %MunUF% Saida HEMSN TAGSN TRIBEstimativa ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\35 Abrasf %MunUF% Saida HEMSN TAGSN TRIBExigSuspDecisaoJudicial ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\36 Abrasf %MunUF% Saida HEMSN TAGSN TRIBExigSuspProcedimentoAdministrativo ParCNPJ UFsDif RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\37 Abrasf %MunUF% Saida HEMSN TAGSN TRIBNaoExistente ParCNPJ UFsDif RetDescDedRed.xml
echo ENTRADAS
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\41 Abrasf %MunUF% Entrada HEMNormal TAGNormal TribNormal ParCNPJ UFsDif RetDescDedRed VariosItens.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\42 Abrasf %MunUF% Entrada HEMNormal TAGNormal TribNormal ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\43 Abrasf %MunUF% Entrada HEMNormal TAGNormal TRIBNaoIncidencia ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\44 Abrasf %MunUF% Entrada HEMNormal TAGNormal TRIBSN ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\45 Abrasf %MunUF% Entrada HEMSN TAGSN TRIBSN ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\46 Abrasf %MunUF% Entrada HEMSN TAGSN TRIBNaoIncidencia ParCNPJ.xml
@echo off
pause