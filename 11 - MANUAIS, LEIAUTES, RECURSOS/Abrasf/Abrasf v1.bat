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
copy %CaminhoOrigem% "%CaminhoDestino%\01 Abrasf %MunUF% - Cancelado.xml
copy %CaminhoOrigem% "%CaminhoDestino%\02 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCPF Ret.xml
copy %CaminhoOrigem% "%CaminhoDestino%\03 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ Ret.xml
copy %CaminhoOrigem% "%CaminhoDestino%\04 Abrasf %MunUF% - Saida HEMNormal TagSN TribNormal ParCNPJ Ret.xml
copy %CaminhoOrigem% "%CaminhoDestino%\05 Abrasf %MunUF% - Saida HEMNormal TagN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\06 Abrasf %MunUF% - Saida HEMNormal TagSN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\07 Abrasf %MunUF% - Saida HEMSimpNac TagN TribNormal ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\08 Abrasf %MunUF% - Saida HEMSimpNac TagSN TribNormal ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\09 Abrasf %MunUF% - Saida HEMSimpNac TagN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\10 Abrasf %MunUF% - Saida HEMSimpNac TagSN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\11 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ UFsDif LocIncidTomador.xml
copy %CaminhoOrigem% "%CaminhoDestino%\12 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ UFsDif LocIncidPrestador.xml
copy %CaminhoOrigem% "%CaminhoDestino%\13 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ UFsDif LocIncidPrestacaoDeServico.xml
copy %CaminhoOrigem% "%CaminhoDestino%\14 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ UFsDif LocIncidOrgaoGerador.xml
copy %CaminhoOrigem% "%CaminhoDestino%\15 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ RetDescDedRed.xml
copy %CaminhoOrigem% "%CaminhoDestino%\16 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ RetDescDedRed VariosItens.xml
copy %CaminhoOrigem% "%CaminhoDestino%\17 a 18 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ VariasNotas.xml
copy %CaminhoOrigem% "%CaminhoDestino%\19 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ ConfigSemAtivnoArquivo.xml
copy %CaminhoOrigem% "%CaminhoDestino%\20 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ ConfigSemServnoArquivo.xml
copy %CaminhoOrigem% "%CaminhoDestino%\21 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ ConfigSemAtivServnoArquivo.xml
copy %CaminhoOrigem% "%CaminhoDestino%\22 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ ConfigServnoXmlnaoencontradonoBanco.xml
copy %CaminhoOrigem% "%CaminhoDestino%\23 Abrasf %MunUF% - Saida HEMNormal TagN TribNormal ParCNPJ ConfigTomadorEmBranco.xml
copy %CaminhoOrigem% "%CaminhoDestino%\24 Abrasf %MunUF% - Saida HEMNormal TagN TributacaoNaoIncidencia ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\25 Abrasf %MunUF% - Saida HEMNormal TagN TributacaoIsento ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\26 Abrasf %MunUF% - Saida HEMNormal TagN TributacaoImune ParCNPJ.xml
copy %CaminhoOrigem% "%CaminhoDestino%\27 Abrasf %MunUF% - Saida HEMSimpNac TagN TributacaoNaoIncidencia ParCNPJ.xml

copy %CaminhoOrigemEntrada% "%CaminhoDestino%\30 Abrasf %MunUF% - Entrada HEMNormal TagN TribNormal ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\31 Abrasf %MunUF% - Entrada HEMNormal TagSN TribNormal ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\32 Abrasf %MunUF% - Entrada HEMNormal TagN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\33 Abrasf %MunUF% - Entrada HEMNormal TagSN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\34 Abrasf %MunUF% - Entrada HEMSimpNac TagN TribNormal ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\35 Abrasf %MunUF% - Entrada HEMSimpNac TagSN TribNormal ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\36 Abrasf %MunUF% - Entrada HEMSimpNac TagN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\37 Abrasf %MunUF% - Entrada HEMSimpNac TagSN TributacaoSimpNac ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\38 Abrasf %MunUF% - Entrada HEMNormal TagN TribNormal ParCNPJ RetDescDedRed VariosItens.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\39 Abrasf %MunUF% - Entrada HEMNormal TagN TributacaoNaoIncidencia ParCNPJ.xml
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\40 Abrasf %MunUF% - Entrada HEMSimpNac TagN TributacaoNaoIncidencia ParCNPJ.xml
@echo off
pause