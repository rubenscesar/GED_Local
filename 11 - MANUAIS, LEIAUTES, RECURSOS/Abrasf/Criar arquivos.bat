@echo off & mode 170,20 & color 0a
rem @echo off & mode 100,9 & color 0a && setlocal enableextensions enabledelayedexpansion
echo.
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
echo +                                                                                                                                                                 +
echo + SAIDAS                                                                                                                                                          +
echo +                                                                                                                                                                 +
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
echo +
SET /P CaminhoOrigem=+ Informe o Caminho de Origem completo com nome do Arquivo (com ""): 
SET /P CaminhoDestino=+ Informe o Caminho de Destino(sem ""): 
SET /P MunUF=+ Informe o nome do Municipio e UF no formato "Municipio (UF)" (sem ""): 
echo +
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
cls
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
echo +                                                                                                                                                                 +
echo + ENTRADAS                                                                                                                                                        +
echo +                                                                                                                                                                 +
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
echo +
SET /P CaminhoOrigemEntrada=+ Informe o Caminho de Origem completo com nome do Arquivo (com ""): 
echo +
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
echo.
echo.
@echo on
copy %CaminhoOrigem% "%CaminhoDestino%\01 Abrasf Acu (RN) - Cancelado.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\02 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCPF Retencoes.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\03 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ Retencoes.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\04 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\05 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidTomador.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\06 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidPrestador.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\07 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidPrestacaoDeServico.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\08 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed UFsDif LocIncidOrgaoGerador.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\09 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TributacaoNaoIncidencia - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\10 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TributacaoIsento - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\11 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TributacaoImune - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\12 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\13 a 14 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ RetDescDedRed VariasNotas.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\15 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ Retencoes VariosItens.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\16 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoSemAtivnoArquivo.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\17 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoSemServnoArquivo.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\18 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoSemAtivServnoArquivo.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\19 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoServnoXmlnaoencontradonoBanco.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\20 Abrasf Acu (RN) - OperacaoSaida RegimeNormal TribNormal - ParCNPJ ConfiguracaoTomadorEmBranco.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\21 Abrasf Acu (RN) - OperacaoSaida RegimeSimplesNacional TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\22 Abrasf Acu (RN) - OperacaoSaida RegimeSimplesNacional TributacaoNaoIncidencia - ParCNPJ.xml"
copy %CaminhoOrigem% "%CaminhoDestino%\23 Abrasf Acu (RN) - OperacaoSaida RegimeSimplesNacional TribNormal - ParCNPJ.xml"

copy %CaminhoOrigemEntrada% "%CaminhoDestino%\24 Abrasf Acu (RN) - OperacaoEntrada RegimeNormal TribNormal - ParCNPJ Retencoes VariosItens.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\25 Abrasf Acu (RN) - OperacaoEntrada RegimeNormal TribNormal - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\26 Abrasf Acu (RN) - OperacaoEntrada RegimeNormal TributacaoNaoIncidencia - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\27 Abrasf Acu (RN) - OperacaoEntrada RegimeNormal TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\28 Abrasf Acu (RN) - OperacaoEntrada RegimeSimplesNacional TributacaoSimplesNacional - ParCNPJ.xml"
copy %CaminhoOrigemEntrada% "%CaminhoDestino%\29 Abrasf Acu (RN) - OperacaoEntrada RegimeSimplesNacional TributacaoNaoIncidencia - ParCNPJ.xml"
@echo off
pause