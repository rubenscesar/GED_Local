@echo off
chcp 65001 >"%temp%"\null

Title Comparador de Lançamentos Contábeis em Bancos de Dados Firebird
echo.
echo Ferramenta para comparação de dados de contabilizações em bancos de dados Firebird
echo ██████████████████████████████████████████████████████████████████████████████████
echo.

set username=sysdba
set password=masterkey
set /p DB_Controle=Informe o banco de dados de controle: 
set output1=%temp%\DB_Controle.CSV
set config="%temp%"\config.sql
copy %DB_Controle% %temp%\DB_Controle.fdb
set database=%temp%\DB_Controle.fdb

if exist %output1% (del %output1%)
(
    ::comando para configurar o formato de exportação como CSV:
	echo output %output1% format csv delimited ';';
) > %config%
set Tag_Output=1

:Config_Output
(	
	::comando para selecionar os dados da tabela desejada:
    echo SELECT EMP_CODIGO LCF_EMP_CODIGO, DTDOC, EST_CODIGO, OPERACAO, DATA, CON_CODIGOD, EST_CODIGOD, CRS_CODIGOD, CON_CODIGOC, EST_CODIGOC, CRS_CODIGOC, VALOR, FATURA, NUMERODOCUMENTO, IMOBILIARIAS, ORIGEM, EXPORTACAOAGRUPADA, TIPO_DOCD, CNPJCPFD, TIPO_DOCC, CNPJCPFC
	echo FROM LCF
    echo ORDER BY EMP_CODIGO, EST_CODIGO, OPERACAO, DATA, ORIGEM, NUMERODOCUMENTO;

    echo SELECT EMP_CODIGO LAN_EMP_CODIGO, DATA, LTE_CODIGO, ARQUIVO, VALOR, HIS_CODIGO, ICG_ID, TAG, ORIGEM, CLA_QUANT_D, CLA_SEQUENCIAL_D, CLA_QUANT_C, CLA_SEQUENCIAL_C, EPC_ID, EPC_EMP_CODIGO, FCE_EMP_CODIGO, DATAHORA, USU_CODIGO, DATAEXTEMPORANEO
	echo FROM LAN
    echo ORDER BY EMP_CODIGO, DATA;

    echo SELECT EMP_CODIGO CLA_EMP_CODIGO, LAN_DATA, MOVIMENTO, SEQUENCIAL, CON_CODIGO, EST_CODIGO, CRS_CODIGO, HIS_CODIGO, VALOR, COMPLEMENTO, CONCILIADO, CONCILIACAOBANCARIA, NUMERODOCUMENTO, TIPO_DOC, CNPJCPF
	echo FROM CLA
    echo ORDER BY EMP_CODIGO, EST_CODIGO, LAN_DATA;

    echo SELECT EMP_CODIGO CON_EMP_CODIGO, CODIGO, NOME, REDUZIDO, ANALITICA, PATRIMONIAL, RESUMIR, NATUREZA, EST_CODIGO, CRS_CODIGO, ENGLOBAFILHAS, LIVROCAIXA, CON_CODIGO_MAE, GRUPO, AJUSTELUCROREAL, NAL_CODIGO, CDALTERNAT, NMALTERNAT, PCR_CODIGO, DESATIVADA, DFC, EXPURGOFCONT, PCR2014_CODIGO, PCRPJLP_CODIGO, PCRFIN_CODIGO, PCRSEG_CODIGO, PCRIIG_CODIGO, PCRFII_CODIGO, PCRSII_CODIGO, PCREFPC_CODIGO, PCRPP_CODIGO, CODIGO_COSIF, PRAZO, NSB_CODIGO, CON_CODIGO_VINCULADA, PCRPJLPF_CODIGO, CPFCNPJBASE, PCRPP2_CODIGO, OUTRASSPED, TIPO_LANC, BAN_CODIGO, AGE_CODIGO, CONTACORRENTENUMERO
	echo FROM CON
    echo ORDER BY EMP_CODIGO, EST_CODIGO, CODIGO;

    echo SELECT EMP_CODIGO COC_EMP_CODIGO, OCO_CODIGO, MOVIMENTO, SEQUENCIAL, CON_CODIGO, EST_CODIGO, CRS_CODIGO, HIS_CODIGO, PERCENTUAL
	echo FROM COC
    echo ORDER BY EMP_CODIGO, EST_CODIGO, OCO_CODIGO;
) >> %config%
if %Tag_Output%==2 (goto isql_output2)

call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output1%

::
:: SEGUNDO ARQUIVO
::

set /p DB_Homologacao=Informe o banco de dados de homologacao: 
set output2=%temp%\DB_Homologacao.CSV
copy %DB_Homologacao% %temp%\DB_Homologacao.fdb
set database=%temp%\DB_Homologacao.fdb

if exist %output2% (del %output2%)
(
	echo output %output2% format csv delimited ';';
) > %config%
set Tag_Output=2
goto Config_Output

:isql_output2
call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output2%
del %config%
del "%temp%"\null
kdiff3 %output1% %output2%