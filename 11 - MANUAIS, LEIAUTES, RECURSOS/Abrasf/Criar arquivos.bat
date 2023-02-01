@echo off & mode 170,25 & color F0
chcp 65001 >null
del null
rem @echo off & mode 100,9 & color 0a && setlocal enableextensions enabledelayedexpansion
echo.
echo                       ╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo                       ║ Este processo tem como objetivo criar todos os arquivos necessários para realizar os testes exploratórios de     ║
echo                       ║                importação Abrasf de entrada e saída desde o primeiro arquivo de cancelamento.                    ║
echo                       ║                                                                                                                  ║
echo                       ║ É importante destacar que os arquivos modelos solicitados não farão parte desta matriz, servindo apenas como     ║
echo                       ║     consulta. Algumas informações contidas nos arquivos serão alteradas automaticamente, mas outras não.         ║
echo                       ║                   Portanto, é recomendável que os arquivos sejam revisados após a criação.                       ║
echo                       ║                                                                                                                  ║
echo                       ║     É importante lembrar que antes de iniciar esse processo, os arquivos modelos devem ter sido testados         ║
echo                       ║ previamente. Dessa forma, você poderá garantir que os outros arquivos criados a partir destes modelos poderão    ║
echo                       ║                    ser importados com sucesso. Isso é crucial para o sucesso do processo.                        ║
echo                       ╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║ SAIDAS                                                                                                                                                          ║
echo ╠═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo ║
SET /P CaminhoOrigem= ║ Informe o Caminho de Origem completo com nome do Arquivo (com "") » 
SET /P CaminhoDestino= ║ Informe o Caminho de Destino(sem "") » 
SET /P MunUF= ║ Informe o nome do Municipio e UF no formato "Municipio (UF)" (sem "") » 
echo ║
echo ╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║ ENTRADAS                                                                                                                                                        ║
echo ╠═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo ║
SET /P CaminhoOrigemEntrada= ║ Informe o Caminho de Origem completo com nome do Arquivo (com "") » 
echo ║
echo ╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo.
@echo on
copy %CaminhoOrigem% "%CaminhoDestino%\01 Abrasf %MunUF% - Cancelado.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\02 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCPF Retencoes.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\03 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ Retencoes.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\04 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\05 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidTomador.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\06 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidPrestador.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\07 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidPrestacaoDeServico.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\08 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidOrgaoGerador.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\09 Abrasf %MunUF% - OperacaoSaida RegimeNormal TributacaoNaoIncidencia - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\10 Abrasf %MunUF% - OperacaoSaida RegimeNormal TributacaoIsento - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\11 Abrasf %MunUF% - OperacaoSaida RegimeNormal TributacaoImune - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\12 Abrasf %MunUF% - OperacaoSaida RegimeNormal TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\13 a 14 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed VariasNotas.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\15 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ Retencoes VariosItens.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\16 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoSemAtivnoArquivo.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\17 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoSemServnoArquivo.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\18 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoSemAtivServnoArquivo.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\19 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoServnoXmlnaoencontradonoBanco.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\20 Abrasf %MunUF% - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoTomadorEmBranco.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\21 Abrasf %MunUF% - OperacaoSaida RegimeSimplesNacional TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\22 Abrasf %MunUF% - OperacaoSaida RegimeSimplesNacional TributacaoNaoIncidencia - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\23 Abrasf %MunUF% - OperacaoSaida RegimeSimplesNacional TribNormal - ParCNPJ.xml"

copy %CaminhoOrigemEntrada% "%CaminhoDestino%\24 Abrasf %MunUF% - OperacaoEntrada RegimeNormal TribNormal - ParCNPJ Retencoes VariosItens.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\25 Abrasf %MunUF% - OperacaoEntrada RegimeNormal TribNormal - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\26 Abrasf %MunUF% - OperacaoEntrada RegimeNormal TributacaoNaoIncidencia - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\27 Abrasf %MunUF% - OperacaoEntrada RegimeNormal TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\28 Abrasf %MunUF% - OperacaoEntrada RegimeSimplesNacional TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\29 Abrasf %MunUF% - OperacaoEntrada RegimeSimplesNacional TributacaoNaoIncidencia - ParCNPJ.xml"
@echo off
pause