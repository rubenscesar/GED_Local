@echo off & mode 145,50 & color 0F
chcp 65001 >"%temp%"\null
set database="%cd%\AC.fdb"
set username=sysdba
set password=masterkey
set config="%temp%"\config.sql
set output1="%cd%\ConsultaPAR_Abrasf.txt"
if exist %output1% (del %output1%)

Title Consulta Participantes no Banco
echo.
echo Consulta de Participantes por CNPJ/CPF e UF após importação Abrasf
echo ██████████████████████████████████████████████████████████████████
echo.
echo Inicialmente, o banco de dados a ser consultado está localizado na pasta padrão:
echo » %database%
echo.
echo No entanto, caso o banco de dados esteja em um diretório diferente, por favor, indique o caminho completo:
set /p database=» 

cls
echo.
echo Consulta de Participantes por CNPJ/CPF e UF após importação Abrasf
echo ██████████████████████████████████████████████████████████████████
echo.
echo I M P O R T A N T E
echo Todas as informações a seguir devem ter sido obtidas do arquivo padrão Abrasf da Nota Fiscal de Serviço Eletrônica (NFS-e).
echo.
echo Forneça as informações referentes aos "Detalhes das Transações" para que seja possível consultar a Nota Fiscal de Serviço Eletrônica (NFS-e):
set /p Empresa=• Forneça o código da Empresa: 
set Empresa=%Empresa:~0,4%
set /p Estabelecimento=• Forneça o código do Estabelecimento: 
set Estabelecimento=%Estabelecimento:~0,4%
choice /c ES /n /m "• Indique a operação da nota usando [E] para Entrada ou [S] para Saída: "
if %errorlevel% == 1 set Operacao=E
if %errorlevel% == 2 set Operacao=S
set /p Nota=• Forneça o número da nota: 
set Nota=%Nota:~0,15%
echo.
echo Forneça as informações referentes os "Participantes" da Nota Fiscal de Serviço Eletrônica (NFS-e):
set /p CNPJCPF=• Forneça o número de CNPJ ou CPF do participante apenas com os dígitos numéricos, sem qualquer formatação como pontos ou traços: 
set CNPJCPF=%CNPJCPF:~0,14%
set /p UF=• Informe a Unidade Federativa (UF) do participante ou digite '?' para consultar o participante filtrando apenas pelo CNPJ: 
cls

if %Operacao%==^S (goto DSS)
if %Operacao%==^E (goto ESI)

:DSS
echo ╔════════════════╗ >> %output1%
echo ║ NFS-e DE SAÍDA ║ >> %output1%
echo ╚════════════════╝ >> %output1%
echo. > %config%
echo SELECT                                                                                                                                                                    >> %CONFIG%
echo     D.EMP_CODIGO DSS_EMP_CODIGO,                                                                                                                                          >> %CONFIG%
echo     D.EST_CODIGO,                                                                                                                                                         >> %CONFIG%
echo     D.NRINICIAL,                                                                                                                                                          >> %CONFIG%
echo     D.PAR_CODIGO                                                                                                                                                          >> %CONFIG%
echo FROM                                                                                                                                                                      >> %CONFIG%
echo     DSS D                                                                                                                                                                 >> %CONFIG%
echo WHERE                                                                                                                                                                     >> %CONFIG%
echo     D.EMP_CODIGO = LPAD('%Empresa%', 4, '0')                                                                                                                              >> %CONFIG%
echo     AND D.EST_CODIGO = LPAD('%Estabelecimento%', 4, '0')                                                                                                                  >> %CONFIG%
echo     AND D.NRINICIAL = LPAD('%Nota%', 15, '0')                                                                                                                             >> %CONFIG%
echo     AND EXISTS (                                                                                                                                                          >> %CONFIG%
echo                 SELECT 1                                                                                                                                                  >> %CONFIG%
echo                 FROM DSS                                                                                                                                                  >> %CONFIG%
echo                 WHERE D.EMP_CODIGO = LPAD('%Empresa%', 4, '0')                                                                                                            >> %CONFIG%
echo                   AND D.EST_CODIGO = LPAD('%Estabelecimento%', 4, '0')                                                                                                    >> %CONFIG%
echo                   AND D.NRINICIAL = LPAD('%Nota%', 15, '0')                                                                                                               >> %CONFIG%
echo                 HAVING COUNT(*) ^> 0                                                                                                                                      >> %CONFIG%
echo                )                                                                                                                                                          >> %CONFIG%
echo     ORDER BY                                                                                                                                                              >> %CONFIG%
echo         D.SEQ;                                                                                                                                                            >> %CONFIG%
echo OUTPUT %output1% FORMAT CSV DELIMITED BY ';';                                                                                                                             >> %CONFIG%
call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output1%

echo ╔═══════════════════════╗ >> %output1%
echo ║ PARTICIPANTE DA NFS-e ║ >> %output1%
echo ╚═══════════════════════╝ >> %output1%
echo. > %config%
echo     SELECT P.CODIGO PAR_CODIGO,                                                                                                                                           >> %CONFIG%
echo            P.CNPJCPF,                                                                                                                                                     >> %CONFIG%
echo            P.UFD_SIGLA,                                                                                                                                                   >> %CONFIG%
echo            P.MUN_CODIGO,                                                                                                                                                  >> %CONFIG%
echo            P.NOME,                                                                                                                                                        >> %CONFIG%
echo            P.ENLOGRADOURO,                                                                                                                                                >> %CONFIG%
echo            P.ENDNUMERO,                                                                                                                                                   >> %CONFIG%
echo            P.ENDCOMPLEMENTO,                                                                                                                                              >> %CONFIG%
echo            P.BAIRRO,                                                                                                                                                      >> %CONFIG%
echo            P.CEP,                                                                                                                                                         >> %CONFIG%
echo            P.DDD,                                                                                                                                                         >> %CONFIG%
echo            P.FONE,                                                                                                                                                        >> %CONFIG%
echo            P.EMAIL,                                                                                                                                                       >> %CONFIG%
echo            P.PAI_CODIGO,                                                                                                                                                  >> %CONFIG%
echo            P.IM,                                                                                                                                                          >> %CONFIG%
echo            P.IE,                                                                                                                                                          >> %CONFIG%
echo            P.EXTERIOR                                                                                                                                                     >> %CONFIG%
echo       FROM PAR P                                                                                                                                                          >> %CONFIG%
echo INNER JOIN DSS D                                                                                                                                                          >> %CONFIG%
echo         ON P.CODIGO = D.PAR_CODIGO                                                                                                                                        >> %CONFIG%
echo      WHERE D.NRINICIAL = LPAD('%Nota%', 15, '0');                                                                                                                         >> %CONFIG%
echo OUTPUT %output1% FORMAT CSV DELIMITED BY ';';                                                                                                                             >> %CONFIG%
call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output1%
goto Conclusao                                                                                                                                                                 >> %CONFIG%

:ESI
echo ╔══════════════════╗ >> %output1%
echo ║ NFS-e DE ENTRADA ║ >> %output1%
echo ╚══════════════════╝ >> %output1%
echo. > %config%
echo SELECT                                                                                                                                                                    >> %CONFIG%
echo     E.EMP_CODIGO ESI_EMP_CODIGO,                                                                                                                                          >> %CONFIG%
echo     E.EST_CODIGO,                                                                                                                                                         >> %CONFIG%
echo     E.NUMERO,                                                                                                                                                             >> %CONFIG%
echo     E.PAR_CODIGO                                                                                                                                                          >> %CONFIG%
echo FROM                                                                                                                                                                      >> %CONFIG%
echo     ESI E                                                                                                                                                                 >> %CONFIG%
echo WHERE                                                                                                                                                                     >> %CONFIG%
echo     E.EMP_CODIGO = LPAD('%Empresa%', 4, '0')                                                                                                                              >> %CONFIG%
echo     AND E.EST_CODIGO = LPAD('%Estabelecimento%', 4, '0')                                                                                                                  >> %CONFIG%
echo     AND E.NUMERO = LPAD('%Nota%', 15, '0')                                                                                                                                >> %CONFIG%
echo     AND EXISTS (                                                                                                                                                          >> %CONFIG%
echo                 SELECT 1                                                                                                                                                  >> %CONFIG%
echo                 FROM ESI                                                                                                                                                  >> %CONFIG%
echo                 WHERE E.EMP_CODIGO = LPAD('%Empresa%', 4, '0')                                                                                                            >> %CONFIG%
echo                   AND E.EST_CODIGO = LPAD('%Estabelecimento%', 4, '0')                                                                                                    >> %CONFIG%
echo                   AND E.NUMERO = LPAD('%Nota%', 15, '0')                                                                                                                  >> %CONFIG%
echo                 HAVING COUNT(*) ^> 0                                                                                                                                      >> %CONFIG%
echo                )                                                                                                                                                          >> %CONFIG%
echo     ORDER BY                                                                                                                                                              >> %CONFIG%
echo         E.SEQ;                                                                                                                                                            >> %CONFIG%
echo OUTPUT %output1% FORMAT CSV DELIMITED BY ';';                                                                                                                             >> %CONFIG%
call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output1%

echo ╔═══════════════════════╗ >> %output1%
echo ║ PARTICIPANTE DA NFS-e ║ >> %output1%
echo ╚═══════════════════════╝ >> %output1%
echo. > %config%
echo     SELECT P.CODIGO PAR_CODIGO,                                                                                                                                           >> %CONFIG%
echo            P.CNPJCPF,                                                                                                                                                     >> %CONFIG%
echo            P.UFD_SIGLA,                                                                                                                                                   >> %CONFIG%
echo            P.MUN_CODIGO,                                                                                                                                                  >> %CONFIG%
echo            P.NOME,                                                                                                                                                        >> %CONFIG%
echo            P.ENLOGRADOURO,                                                                                                                                                >> %CONFIG%
echo            P.ENDNUMERO,                                                                                                                                                   >> %CONFIG%
echo            P.ENDCOMPLEMENTO,                                                                                                                                              >> %CONFIG%
echo            P.BAIRRO,                                                                                                                                                      >> %CONFIG%
echo            P.CEP,                                                                                                                                                         >> %CONFIG%
echo            P.DDD,                                                                                                                                                         >> %CONFIG%
echo            P.FONE,                                                                                                                                                        >> %CONFIG%
echo            P.EMAIL,                                                                                                                                                       >> %CONFIG%
echo            P.PAI_CODIGO,                                                                                                                                                  >> %CONFIG%
echo            P.IM,                                                                                                                                                          >> %CONFIG%
echo            P.IE,                                                                                                                                                          >> %CONFIG%
echo            P.EXTERIOR                                                                                                                                                     >> %CONFIG%
echo       FROM PAR P                                                                                                                                                          >> %CONFIG%
echo INNER JOIN ESI E                                                                                                                                                          >> %CONFIG%
echo         ON P.CODIGO = E.PAR_CODIGO                                                                                                                                        >> %CONFIG%
echo      WHERE E.NUMERO = LPAD('%Nota%', 15, '0');                                                                                                                            >> %CONFIG%
echo OUTPUT %output1% FORMAT CSV DELIMITED BY ';';                                                                                                                             >> %CONFIG%
call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output1%
goto Conclusao                                                                                                                                                                 >> %CONFIG%

:Conclusao
echo. > %config%
echo. >> %output1%
echo ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████ >> %output1%
echo OBS.: O CNPJ e a UF utilizados para a consulta serão os que foram fornecidos, não os que foram obtidos na consulta da NFS-e >> %output1%
echo ╔═════════════════════════════════════╗ >> %output1%
echo ║ PARTICIPANTES COM O MESMO CNPJ E UF ║ >> %output1%
echo ╚═════════════════════════════════════╝ >> %output1%

echo SELECT                                                                                                                                                                    >> %CONFIG%
echo     P.CODIGO PAR_CODIGO,                                                                                                                                                  >> %CONFIG%
echo     P.CNPJCPF,                                                                                                                                                            >> %CONFIG%
echo     P.UFD_SIGLA,                                                                                                                                                          >> %CONFIG%
echo     P.MUN_CODIGO,                                                                                                                                                         >> %CONFIG%
echo     P.NOME,                                                                                                                                                               >> %CONFIG%
echo     P.ENLOGRADOURO,                                                                                                                                                       >> %CONFIG%
echo     P.ENDNUMERO,                                                                                                                                                          >> %CONFIG%
echo     P.ENDCOMPLEMENTO,                                                                                                                                                     >> %CONFIG%
echo     P.BAIRRO,                                                                                                                                                             >> %CONFIG%
echo     P.CEP,                                                                                                                                                                >> %CONFIG%
echo     P.DDD,                                                                                                                                                                >> %CONFIG%
echo     P.FONE,                                                                                                                                                               >> %CONFIG%
echo     P.EMAIL,                                                                                                                                                              >> %CONFIG%
echo     P.PAI_CODIGO,                                                                                                                                                         >> %CONFIG%
echo     P.IM,                                                                                                                                                                 >> %CONFIG%
echo     P.IE,                                                                                                                                                                 >> %CONFIG%
echo     P.EXTERIOR                                                                                                                                                            >> %CONFIG%
echo FROM                                                                                                                                                                      >> %CONFIG%
echo     PAR P                                                                                                                                                                 >> %CONFIG%
echo WHERE                                                                                                                                                                     >> %CONFIG%
echo     P.CNPJCPF = '%CNPJCPF%'                                                                                                                                               >> %CONFIG%
if %UF%==^? (
             echo     AND EXISTS (                                                                                                                                             >> %CONFIG%
             echo                 SELECT 1                                                                                                                                     >> %CONFIG%
             echo                 FROM PAR                                                                                                                                     >> %CONFIG%
             echo                 WHERE P.CNPJCPF = '%CNPJCPF%'                                                                                                                >> %CONFIG%
            )
if not %UF%==^? (
                 set UF=%UF:~0,2%
                 echo     AND P.UFD_SIGLA = UPPER('%UF%'^)                                                                                                                     >> %CONFIG%
                 echo     AND EXISTS (                                                                                                                                         >> %CONFIG%
                 echo                 SELECT 1                                                                                                                                 >> %CONFIG%
                 echo                 FROM PAR                                                                                                                                 >> %CONFIG%
                 echo                 WHERE P.CNPJCPF = '%CNPJCPF%'                                                                                                            >> %CONFIG%
                 echo                     AND P.UFD_SIGLA = UPPER('%UF%'^)                                                                                                     >> %CONFIG%
                )
echo                 HAVING COUNT(*) ^> 0                                                                                                                                      >> %CONFIG%
echo                )                                                                                                                                                          >> %CONFIG%
echo     ORDER BY                                                                                                                                                              >> %CONFIG%
echo         P.CODIGO;                                                                                                                                                         >> %CONFIG%


echo OUTPUT %output1% FORMAT CSV DELIMITED BY ';';                                                                                                                          >> %CONFIG%
call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output1%

call %output1%
::del %config%
del "%temp%"\null
echo.
echo C O N C L U Í D O
goto exit

:exit
timeout -t 2