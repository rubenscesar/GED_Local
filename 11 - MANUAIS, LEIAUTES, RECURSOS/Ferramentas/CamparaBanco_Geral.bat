@echo off
setlocal
chcp 65001 >"%temp%"\null

Title Comparador de Lançamentos Fiscais em Bancos de Dados Firebird
echo.
echo Ferramenta para comparação de dados de notas fiscais em bancos de dados Firebird
echo ████████████████████████████████████████████████████████████████████████████████
echo.

set username=sysdba
set password=masterkey
set /p DB_Controle=Informe o banco de dados de controle: 
set output1="%temp%"\DB_Controle.CSV
set config="%temp%"\config.sql
copy %DB_Controle% %temp%\DB_Controle.fdb
::call c:\Ferramentas\CompareFileHashes.bat %DB_Controle% %temp%\DB_Controle.fdb
set database=%temp%\DB_Controle.fdb

if exist %output1% (del %output1%)
(
    ::comando para configurar o formato de exportação como CSV:
	echo output %output1% format csv delimiter ';';
	
	::comando para selecionar os dados da tabela desejada:
	echo SELECT EMP_CODIGO CPE_EMP_CODIGO, SEQ, EST_CODIGO, DATA, CHAVEELET, ECF_SEQ, NUMERO, VALORTOTAL, PAR_CODIGO, VRDESCONTOITEM, VROUTRASDESPITEM, VRSUBSTITUICAOITEM, VRRATEIOACRESC,
	echo        VALORLIQUIDO, VRTROCO, SITUACAO, INFADFISCO, OBS, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4,
	echo        GRUPO, GRPVRUTILCONTAB, IFC_SEQ, FDF_SEQ, FATURA, CCO_CODIGO, TOTALSERVISS, ISSRETIDO, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, TFRETFONTEINSS,
	echo        INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE
	echo FROM CPE
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DATA, NUMERO, SEQ;
	
	echo SELECT EMP_CODIGO CFI_EMP_CODIGO, CPE_SEQ, SEQ, VALOR, UFD_SIGLA, CFO_CODIGO, ICMSBASECALC, ALIQUOTA, ICMSDEB, ISENTAS, OUTRAS, CSTA, CSTB, CSOSNA, CSOSNB, SUBSTICMS, SUBSTCOFINS,
	echo        SUBSTPIS, COFINSMONO, PISMONO
	echo FROM CFI
    echo ORDER BY EMP_CODIGO, CPE_SEQ, SEQ;

	echo SELECT EMP_CODIGO FPC_EMP_CODIGO, SEQ, CPE_SEQ, FORMAPGTO, VRPGTO, BANDEIRA, PAR_CODIGO, CODAUTORIZACAO
	echo FROM FPC
    echo ORDER BY EMP_CODIGO, CPE_SEQ, SEQ;

	echo SELECT EMP_CODIGO PCE_EMP_CODIGO, CPE_SEQ, SEQ, QDECOMERCIAL, UNDCOMERCIAL, CFO_CODIGO, PRO_CODIGO, VRUNITARIO, VRBRUTO, VRDESCONTO, VROUTRASDESPESAS, VRRATEIOACRESC, VRLIQUIDO,
	echo        CSOSNA, CSOSNB, CSTA, CSTB, ICMSTRIBUTACAO, ICMSALIQ, ICMSBASECALC, VLRICMS, CSTCOFINS, TFBASECALCCOFINS, TIPOCALCULOCOFINS, ALIQUOTACOFINSPERC, ALIQUOTACOFINSEMREAIS,
	echo        VALORCOFINS, NAR_SEQCOFINS, NAR_SEQPIS, CSTPIS, TFBASECALCPIS, TIPOCALCULOPIS, ALIQUOTAPISPERC, ALIQUOTAPISEMREAIS, VALORPIS, CCO_CODIGO, EXCLUSAOBCPISCOFINS,
	echo        DECRETO2068699AM, CAF_SEQ, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS
	echo FROM PCE
    echo ORDER BY EMP_CODIGO, CPE_SEQ, SEQ;
	
	echo SELECT EMP_CODIGO CEE_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULARIO, DTEMISSAO, CANCELADO, DTENTRADASAIDA, DTDOC, PAR_CODIGO,
	echo        ANOMES, DTVENCIMENTO, NRCLIENTE, CLASSE, INSCRICAO, CONSUMOFAT, CODTARIFA, VRCONSUMO, TXILUMPUB, OUTRASDESPESAS, ABATDEDUCOES, VRTOTAL, CFO_CODIGO, ICMSBASECALC, ICMSALIQ,
	echo        ICMSVR, ICMSISENTAS, ICMSOUTRAS, CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4,
	echo        TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, IFC_SEQ, TFCREDCOFINSPIS, CSTB, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, TIPOLIGACAO,
	echo        GRUPOTENSAO, OBS, CDF_CODIGO, CSTCOFINSPIS, CSOSNB, ESPECIE, FATURA, FDF_SEQ, PENDENTE, CHV_DOCE, FIN_DOCE, CHV_DOCE_REF, FCPBASECALC, FCPALIQUOTA, FCPVALOR,
	echo        FCPBASECALCSUBS, FCPALIQUOTASUBS, FCPVALORSUBS, CAF_SEQ, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS
	echo FROM CEE
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DTDOC, ESPECIE, CANCELADO, SERIE, SUBSERIE, NUMERO;
	
    echo SELECT EMP_CODIGO NFM_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, ESPECIE, DOCPROPRIO, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULINICIAL, FORMULFINAL, DTEMISSAO, CANCELADO,
	echo        DTENTRADASAIDA, DTDOC, PAR_CODIGO, GNREVINCULADA, GNREICMS, GNREANOMES, GNRECONVENIO, GNREDTVENC, GNREDTRECOLHIM, GNREBANCO, GNREAGENCIA, GNREAGENCIADV, GNREAUTENTIC,
	echo        TOTALPRODUTOS, TOTALFRETE, TOTALSEGURO, TOTALOUTRASDESP, TOTALICMSIMPORT, TOTALICMSIMPDIF, TOTALIPIVR, TOTALSUBSTRET, TOTALSERVISS, TOTALDESCGLOBAL, TOTALVR, QTDITENSPROD,
	echo        ARECSUBST, ARECANTEC, ARECDIFALIQ, SUBSTVRCONTABIL, SUBSTBASECALC, ANTECVRCONTABIL, ISSRETIDO, DTRETENCAO, DTENTRADAESTADO, FRETEPORCONTA, FATURA, EEC_NUMERO, NUMEROCF,
	echo        CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS,
	echo        TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, NOTACOMP, NUMEROPAG, DATAPAG, TIPOPAG, SDE_CODIGO, NFVENDAFORAESTAB, ALIQSUBST, TFCREDCOFINSPIS, CHAVEELET,
	echo        TFRETFONTEINSS, PENDENTE, OBS, STATUSENVIO, RETORNOENVIO, MOTIVOCANC, PROTOCOLONFE, AMBIENTEDIGITACAO, NOP_CODIGO, CDF_CODIGO, CDFCOMPLEMENTO, HORA_ENTRADASAIDA,
	echo        UFD_SIGLA_EMBARQ, LOCALEMBARQ, FDF_SEQ, PISCOFINSALIQUOTAESPECIFICA, REFNFE, INFADFISCO, SPDDATAENVIO, SPDICODIGO, SPDMSG, DTCONTINGENCIA, HORACONTINGENCIA, OPERACAOCONSUMIDORFINAL,
	echo        PRESENCACOMPRADOR, NOTADIGITADAPELOCONTRIBUINTE, NOTADECLARADAAM, IFC_SEQ_NOTASDEC_AM, TOTALICMSDESONERACAO, INDOBRACONSTRUCAOCIVIL, CNO, DTESCRITURACAO, TOTALFCP,
	echo        EHNFESAIDATERCEIROS, TOTALICMSMONORET, DECRETO353952023CE
	echo FROM NFM
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DTDOC, ESPECIE, CANCELADO, SERIE, SUBSERIE, NUMERO;

    echo SELECT EMP_CODIGO INM_EMP_CODIGO, NFM_SEQ, SEQ, UFD_SIGLA, CFO_CODIGO, VALOR, ICMSBASECALC, ICMSALIQ, ICMSDEBCRED, ICMSISENTAS, ICMSOUTRAS, IPIBASECALC, IPIDEBCRED, IPIISENTAS,
	echo        IPIOUTRAS, PERCREDUC, SUBSTICMS, SUBSTIPI, SUBSTCOFINS, SUBSTPIS, PERCICMSSUBST, CALCFECOPDEC29560, CSOSNA, CSOSNB, CSTIPI, CSTA, CSTB, COFINSMONO, PISMONO, FCPBASECALC,
	echo        FCPALIQUOTA, FCPVALOR, FCPBASECALCSUBS, FCPALIQUOTASUBS, FCPVALORSUBS, ALIQ_ICMS_DIFERIMENTO
    echo FROM INM
    echo ORDER BY EMP_CODIGO, NFM_SEQ, SEQ;

    echo SELECT EMP_CODIGO ITM_EMP_CODIGO, PNM_NFM_SEQ, PNM_SEQ, SEQ, NUMLOTE, QTDITENSLOTE, DTFABRICACAO, DTVALIDADE, INDICADORBCMEDICAMENTO, VLMAXIMOTABELADO
    echo FROM ITM
    echo ORDER BY EMP_CODIGO, PNM_NFM_SEQ, PNM_SEQ, SEQ, NUMLOTE;

    echo SELECT EMP_CODIGO PNM_EMP_CODIGO, NFM_SEQ, SEQ, PRO_CODIGO, CFO_CODIGO, CSTA, CSTB, UNIDMEDIDA, QUANTIDADE, VRTOTAL, IPIVR, ICMSTRIBUTACAO, ICMSBASECALC, ICMSALIQ, ICMSSUBSTBC,
	echo        ICMSSUBSTVR, ARECOLHER, SUBSTTIPO, SUBSTCUSTOAQ, SUBSTAGREG, SUBSTBASECALC, SUBSTALIQ, SUBSTCREDORIG, SUBSTJAREC, ANTECCUSTOAQ, ANTECAGREG, ANTECALIQ, ANTECCREDORIG, ANTECJAREC,
	echo        DIFALIQBASECALC, DIFALIQALIQORIG, DIFALIQALIQINT, IPITRIBUTACAO, IPIBASECALC, IPIALIQ, IPIDEBCRED, CCO_CODIGO, PERCREDANTEC, CSTIPI, CSTCOFINS, CSTPIS, TFBASECALCCOFINS,
	echo        TFBASECALCPIS, PERCICMSSUBST, CALCFECOPDECPNM, RESSARCIMENTO, VRDESCONTO, VRBRUTO, VRFRETE, VRSEGURO, CSOSNA, CSOSNB, NAR_SEQCOFINS, NAR_SEQPIS, PRODEPEINDESP, PRODEPECODAPUR,
	echo        VRUNITARIO, TIPOCALCULOCOFINS, ALIQUOTACOFINSPERC, ALIQUOTACOFINSEMREAIS, VALORCOFINS, TIPOCALCULOPIS, ALIQUOTAPISPERC, ALIQUOTAPISEMREAIS, VALORPIS, CAF_SEQ, PEDIDOCOMPRA,
	echo        ITEMPEDIDOCOMPRA, BASECALCIMPOSTO, DESPADUANEIRAS, VALORIMPOSTO, IMPOSTOIOF, VROUTRASDESPESAS, NAOCOMPOEVALORTOTAL, NATCREDESTORNOPIS, NATCREDESTORNOCOFINS, NATCONTESTORNOPIS,
	echo        NATCONTESTORNOCOFINS, FCI, INDPETROLEO, PERCIPIDEVOLVIDO, MOTIVODEVOLUCAO, RECOPI, INDESPINCENTIVOPRODEP, VRICMSDESONERACAO, MOTIVODESONERACAO, DIFALBCICMS, DIFALALIQFECOP,
	echo        DIFALALIQORIGEM, DIFALALIQDESTINO, DIFALICMSDIFERALIQ, DIFALUFORIGEM, DIFALUFDESTINO, DIFALICMSPARTILHAORIGEM, DIFALICMSPARTILHADESTINO, DIFALICMSORIGEM, DIFALICMSDESTINO,
	echo        DIFALICMSFECOP, EXCLUSAOBCPISCOFINS, DIFALIQALIQEXT, FCPBASECALC, FCPALIQUOTA, FCPVALOR, FCPBASECALCSUBS, FCPALIQUOTASUBS, FCPVALORSUBS, RSTESPECIE, RSTDTDOCUMENTO, RSTNUMERO,
	echo        RSTSERIE, RSTCHAVEELET, RSTPAR_CODIGO, RSTCODIGOITEM, RSTQUANTIDADE, RSTVRUNITARIO, RSTVRBCICMSST, RSTVRUNITBCICMSREMETENTE, RSTALIQICMSREMETENTE, RSTVRUNITBCICMSRETENCAO,
	echo        RSTVRUNITCREDICMS, RSTALIQICMSST, RSTVRUNITBCICMSSTRESS, RSTCODRETENCAOICMSST, RSTCODMOTIVORESS, RSTCHAVEELETEMITSUBST, RSTPAR_CODRETENCAOICMSST, RSTNUMERORETENCAOICMSST,
	echo        RSTRETENCAOICMSSTSERIE, RSTRETOICMSSTCODITEM, RSTCODDOCARRECADACAO, RSTNUMERODOCARRECADACAO, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS,
	echo        ALIQ_ICMS_DIFERIMENTO, VALORSUBSTITUTOICMS, DECRETO463032018PE, DECRETO2068699AM, ICMSBCMONO, ICMSALIQMONO, ICMSMONO, ICMSBCMONORET, ICMSALIQMONORET, ICMSMONORET, ICMSBCMONODIF,
	echo        ICMSALIQMONODIF, ICMSALIQDIFMONODIF, ICMSMONODIF, ICMSBCMONORETANT, ICMSALIQMONORETANT, ICMSMONORETANT
    echo FROM PNM
    echo ORDER BY EMP_CODIGO, PNM_EMP_CODIGO, NFM_SEQ, SEQ;

	echo SELECT EMP_CODIGO TSN_EMP_CODIGO, NFM_SEQ, SEQ, SUBTOTAL, ISSTRIBUTACAO, CONSTRUCAOCIVIL, EST_CODIGO, ALIQUOTA, SERVICOS, MUN_UFD_SIGLA, MUN_CODIGO, NATUREZASERV, ATV_CODIGO,
	echo        GIS_CODIGO, SIO_CODIGO, SVS_CODIGO, CODOBRACONSTRCIVIL, PERCENTUALREDUCAO, CBL_CODIGO
	echo FROM TSN
	echo ORDER BY EMP_CODIGO, EST_CODIGO, NFM_SEQ, SEQ, SERVICOS, ISSTRIBUTACAO;
	
	echo SELECT EMP_CODIGO SVN_EMP_CODIGO, NFM_SEQ, SEQ, SVS_CODIGO, VALOR, ISSBASECALC, ISSALIQ, ISSIMPOSTO, CSTCOFINS, CSTPIS, TFBASECALCCOFINS, TFBASECALCPIS, CSTPISCOFINS,
	echo        TFBASECREDCOFINSPIS, ISSTRIBUTACAO, NAR_SEQCOFINS, NAR_SEQPIS, PERCENTUALREDUCAO, CCO_CODIGO, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO,
	echo        TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS,
	echo        VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, ATV_CODIGO, EST_CODIGO, EXCLUSAOBCPISCOFINS, TFRECTRIBCOFINSITEM, TFRECTRIBPISITEM
	echo FROM SVN
	echo ORDER BY EMP_CODIGO, EST_CODIGO, NFM_SEQ, SEQ, SVS_CODIGO, ISSTRIBUTACAO;

    echo SELECT EMP_CODIGO DSS_EMP_CODIGO, EST_CODIGO, DTEMISSAO, ESPECIE, FORMCONT, NRINICIAL, NRFINAL, CANCELADO, VRTOTAL, PAR_CODIGO, ISSRETIDO, TFRECTRIBCOFINS, TFRECTRIBPIS,
    echo        TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ,
	echo        TFRETFONTEINSS, GRUPO, GRPVRUTILCONTAB, AMI_SEQ, TFRETFONTEIRRF, SDE_CODIGO, FATURA, SERIE, CHAVEELET, DTPRESTACAO, FDF_SEQ, PAGADORSUS,
	echo        VRDEDUCOES, VRDESCONTO, VRBRUTO, CCO_CODIGO, INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE, OUTRASRETENCOES
	echo FROM DSS
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DTEMISSAO, ESPECIE, CANCELADO, NRINICIAL;

    echo SELECT EMP_CODIGO ITS_EMP_CODIGO, DSS_SEQ, SUBTOTAL, EST_CODIGO, ISSTRIBUTACAO, SERVICOS, ALIQUOTA, MUN_UFD_SIGLA, MUN_CODIGO, NATUREZASERV, ATV_CODIGO, SVS_CODIGO,
	echo        CSTCOFINS, CSTPIS, TFBASECALCCOFINS, TFBASECALCPIS, CODOBRACONSTRCIVIL, NAR_SEQCOFINS, NAR_SEQPIS, VRDEDUCOES, VRDESCONTO, VRBRUTO, PERCENTUALREDUCAO, CCO_CODIGO,
	echo        TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20,
	echo        TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, EXCLUSAOBCPISCOFINS, TFRECTRIBCOFINSITEM,
	echo        TFRECTRIBPISITEM
    echo FROM ITS
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DSS_SEQ, SEQ;

    echo SELECT EMP_CODIGO ESI_EMP_CODIGO, SEQ, EST_CODIGO, PAR_CODIGO, DTEMISSAO, NF, ESPECIE, FORMCONT, NUMERO, VRTOTAL, DTRETENCAO, GRUPO, GRPVRUTILCONTAB, IFC_SEQ,
	echo        TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRRF, TFRETFONTEINSS, SDE_CODIGO, FATURA, SERIE, CHAVEELET, TFCREDCOFINSPIS, VRDEDUCOES,
	echo        VRDESCONTO, VRBRUTO, FDF_SEQ, CCO_CODIGO, INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE, OUTRASRETENCOES, DTPRESTACAO
    echo FROM ESI
    echo ORDER BY EMP_CODIGO, EST_CODIGO, SEQ;

    echo SELECT EMP_CODIGO IES_EMP_CODIGO, ESI_SEQ, SEQ, SUBTOTAL, CONSTRUCAOCIVIL, TRIBUTACAO, SERVICOS, ALIQUOTA, GIS_CODIGO, SIO_CODIGO, SVS_CODIGO, CSTPISCOFINS, TFBASECALCPISCOFINS, NATBCCRED, CODOBRACONSTRCIVIL, CNAE, VRDEDUCOES, VRDESCONTO, VRBRUTO, CCO_CODIGO, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, EXCLUSAOBCPISCOFINS, TFRECTRIBCOFINSITEM, TFRECTRIBPISITEM, CBL_CODIGO
    echo FROM IES
    echo ORDER BY EMP_CODIGO, ESI_SEQ, SEQ;

    echo SELECT EMP_CODIGO CTC_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, ESPECIE, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULARIO, DTEMISSAO, CANCELADO, DTENTRADAPREST, DTDOC, FRETE, PAR_CODIGO_REMPREST, PAR_CODIGO_DEST, CFO_CODIGO, VRTOTAL, ICMSBASECALC, ICMSALIQ, ICMSVR, ICMSISENTAS, ICMSOUTRAS, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, MUN_UFD_SIGLA_ENT, MUN_CODIGO_ENT, DISTANCIA, QTDMERCADORIA, UNIDMEDIDA, FRETECALCULADO, VEICULOPLACA, UFD_SIGLA_VEICULO, RESUMOMOVDIARIO, RMD_SEQ, CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, IFC_SEQ, DIFERALIQUOTA, BASECALCDIFALIQ, ALIQORIGEM, ALIQINTERNA, FATURA, TFCREDCOFINSPIS, CSTB, CHAVEELET, CDF_CODIGO, CSTPIS, CSTCOFINS, CREDCSTPISCOFINS, INDNATFRT, NATBCCRED, NAR_SEQCOFINS, NAR_SEQPIS, PAR_CODIGO_CONSIG, PAR_CODIGO_REDESP, FRETEOPERACAOREDESP, FDF_SEQ, SPDDATAENVIO, SPDICODIGO, SPDMSG, ICP_CODIGO, CSOSNB, DIFAL, DIFALBCICMS, DIFALALIQFECOP, DIFALALIQORIGEM, DIFALALIQDESTINO, DIFALICMSDIFERALIQ, DIFALUFORIGEM, DIFALUFDESTINO, DIFALICMSPARTILHAORIGEM, DIFALICMSPARTILHADESTINO, DIFALICMSORIGEM, DIFALICMSDESTINO, DIFALICMSFECOP, DIFALIQALIQEXT, SUBSTTIPO, SUBSTCUSTOAQ, SUBSTAGREG, SUBSTBASECALC, SUBSTALIQ, SUBSTCREDORIG, SUBSTJAREC, CAF_SEQ, TFRETFONTEINSS, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, INDOBRACONSTRUCAOCIVIL, CNO, CLASSIFICACAOMAOOBRA, PENDENTE, SUBSTICMS, EXCLUSAOBCPISCOFINS, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS, ANTECCUSTOAQ, ANTECAGREG, ANTECALIQ, ANTECCREDORIG, PERCREDANTEC, ANTECJAREC, NATCONTESTORNOPISCOFINS, DOCPROPRIO, TIPOCTE
    echo FROM CTC
    echo ORDER BY EMP_CODIGO, EST_CODIGO, SEQ;

    echo SELECT EMP_CODIGO NCT_EMP_CODIGO, CTC_SEQ, SEQ, ESPECIE, SERIE, SUBSERIE, NUMERO, DTEMISSAO, VRTOTAL, CHAVEELET
    echo FROM NCT
    echo ORDER BY EMP_CODIGO, CTC_SEQ, SEQ;

    echo SELECT EMP_CODIGO NTC_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULARIO, DTEMISSAO, CANCELADO, DTENTRADASAIDA, DTDOC, PAR_CODIGO, CFO_CODIGO, VRTOTAL, ICMSBASECALC, ICMSALIQ, ICMSVR, ICMSISENTAS, ICMSOUTRAS, QTDITENS, CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, IFC_SEQ, TFCREDCOFINSPIS, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, TFRETFONTEINSS, TIPOFRETE, VEICULOPLACA, PLACAUFD_SIGLA, MUN_UFD_SIGLA_DES, MUN_CODIGO_DES, CDF_CODIGO, INDNATFRT, FATURA, FDF_SEQ, CSTB, CSOSNB, ESPECIE, CHAVEELET, INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE, SUBSTICMS
	echo FROM NTC
    echo ORDER BY EMP_CODIGO, EST_CODIGO, SEQ;

    echo SELECT EMP_CODIGO SNT_EMP_CODIGO, NTC_SEQ, SEQ, SIC_CODIGO, QUANTIDADE, VRTOTAL, CSTB, ICMSTRIBUT, ICMSBASECALC, CCO_CODIGO, CSTCOFINS, TFBASECALCCOFINS, CSTPIS, TFBASECALCPIS, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, MUN_UFD_SIGLA_DES, MUN_CODIGO_DES, CSTPISCOFINS, TFBASECALCPISCOFINS, NATBCCRED, NAR_SEQCOFINS, NAR_SEQPIS, CSOSNB, CAF_SEQ, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, EXCLUSAOBCPISCOFINS, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS
    echo FROM SNT
    echo ORDER BY EMP_CODIGO, NTC_SEQ, SEQ;

    echo SELECT EMP_CODIGO SIC_EMP_CODIGO, CODIGO, DESCRICAO, CODANATEL, ICP_CODIGO, APURACAOPISCOFINS, PERCENTUALCSL, PERCENTUALIRPJ, CODRECEITACOFINS, CODRECEITAPIS, CODRECEITACSL, CODRECEITAIRPJ, CODRECEITACSRF, ALIQICMSINTERNA, CLASSIFICACAOMAOOBRA, CPRB, CCO_CODIGO, SERVCONVICMS11503, CODRECEITACOSIRF
    echo FROM SIC
    echo ORDER BY EMP_CODIGO, CODIGO;

    echo SELECT CODIGO PAR_CODIGO, NOME, UFD_SIGLA, CNPJCPF, IE, IM, INFISSDIGITAL, FORNPRODPRIM, SOCIEDSIMPLES, ENDLOGRADTIPO, ENLOGRADOURO, ENDNUMERO, ENDCOMPLEMENTO, BAIRROTIPO,
	echo        BAIRRO, CEP, MUN_CODIGO, DDD, FONE, SUFRAMA, CFO_CODIGOENTULTUTIL, CFO_CODIGOSAIULTUTIL, ULTICMSALIQENTUTIL, ULTICMSALIQSAIUTIL, SUBSTITUTOISS, ULTCONSTRUCAOCIVIL,
	echo        ORGAOPUBLICO, INDUSTRIA, OPTSIMPLESNAC, PASSAPORTE, PAI_CODIGO, EXTERIOR, ADM_CARTAOCREDITO, EMAIL, HOSPITALEAFINS, INDICADORIE, CNAE21_CODIGO, CPRB, PRODUTORRURAL,
	echo        INDICATIVODAAQUISICAO
    echo FROM PAR
    echo ORDER BY UFD_SIGLA, CNPJCPF, IE, IM;

	echo SELECT EMP_CODIGO IFC_EMP_CODIGO, ORIGEM, COMENTARIO, ARQUIVO, EXCLUIDO, DTINICIAL, DTFINAL, CONTEXTO, PISCOFINSALIQUOTAESPECIFICA, NOTASFISCAISDECLARADASAM, VERSAOARQUIVO,
	echo        PENDENTECANCELAMENTO, PENDENTEIMPORTACAO
	echo FROM IFC
	echo ORDER BY EMP_CODIGO, ORIGEM, ARQUIVO, VERSAOARQUIVO, DTINICIAL;
) > %config%

call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output1%

::
:: SEGUNDO ARQUIVO
::

set /p DB_Homologacao=Informe o banco de dados de homologacao: 
set output2=%temp%\DB_Homologacao.CSV
copy %DB_Homologacao% %temp%\DB_Homologacao.fdb
::call c:\Ferramentas\CompareFileHashes.bat %DB_Homologacao% %temp%\DB_Homologacao.fdb
set database=%temp%\DB_Homologacao.fdb

if exist %output2% (del %output2%)
(
    ::comando para configurar o formato de exportação como CSV:
	echo output %output2% format csv delimiter ';';
	
	::comando para selecionar os dados da tabela desejada:
	echo SELECT EMP_CODIGO CPE_EMP_CODIGO, SEQ, EST_CODIGO, DATA, CHAVEELET, ECF_SEQ, NUMERO, VALORTOTAL, PAR_CODIGO, VRDESCONTOITEM, VROUTRASDESPITEM, VRSUBSTITUICAOITEM, VRRATEIOACRESC,
	echo        VALORLIQUIDO, VRTROCO, SITUACAO, INFADFISCO, OBS, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4,
	echo        GRUPO, GRPVRUTILCONTAB, IFC_SEQ, FDF_SEQ, FATURA, CCO_CODIGO, TOTALSERVISS, ISSRETIDO, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, TFRETFONTEINSS,
	echo        INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE
	echo FROM CPE
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DATA, NUMERO, SEQ;
	
	echo SELECT EMP_CODIGO CFI_EMP_CODIGO, CPE_SEQ, SEQ, VALOR, UFD_SIGLA, CFO_CODIGO, ICMSBASECALC, ALIQUOTA, ICMSDEB, ISENTAS, OUTRAS, CSTA, CSTB, CSOSNA, CSOSNB, SUBSTICMS, SUBSTCOFINS,
	echo        SUBSTPIS, COFINSMONO, PISMONO
	echo FROM CFI
    echo ORDER BY EMP_CODIGO, CPE_SEQ, SEQ;

	echo SELECT EMP_CODIGO FPC_EMP_CODIGO, SEQ, CPE_SEQ, FORMAPGTO, VRPGTO, BANDEIRA, PAR_CODIGO, CODAUTORIZACAO
	echo FROM FPC
    echo ORDER BY EMP_CODIGO, CPE_SEQ, SEQ;

	echo SELECT EMP_CODIGO PCE_EMP_CODIGO, CPE_SEQ, SEQ, QDECOMERCIAL, UNDCOMERCIAL, CFO_CODIGO, PRO_CODIGO, VRUNITARIO, VRBRUTO, VRDESCONTO, VROUTRASDESPESAS, VRRATEIOACRESC, VRLIQUIDO,
	echo        CSOSNA, CSOSNB, CSTA, CSTB, ICMSTRIBUTACAO, ICMSALIQ, ICMSBASECALC, VLRICMS, CSTCOFINS, TFBASECALCCOFINS, TIPOCALCULOCOFINS, ALIQUOTACOFINSPERC, ALIQUOTACOFINSEMREAIS,
	echo        VALORCOFINS, NAR_SEQCOFINS, NAR_SEQPIS, CSTPIS, TFBASECALCPIS, TIPOCALCULOPIS, ALIQUOTAPISPERC, ALIQUOTAPISEMREAIS, VALORPIS, CCO_CODIGO, EXCLUSAOBCPISCOFINS,
	echo        DECRETO2068699AM, CAF_SEQ, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS
	echo FROM PCE
    echo ORDER BY EMP_CODIGO, CPE_SEQ, SEQ;
	
	echo SELECT EMP_CODIGO CEE_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULARIO, DTEMISSAO, CANCELADO, DTENTRADASAIDA, DTDOC, PAR_CODIGO,
	echo        ANOMES, DTVENCIMENTO, NRCLIENTE, CLASSE, INSCRICAO, CONSUMOFAT, CODTARIFA, VRCONSUMO, TXILUMPUB, OUTRASDESPESAS, ABATDEDUCOES, VRTOTAL, CFO_CODIGO, ICMSBASECALC, ICMSALIQ,
	echo        ICMSVR, ICMSISENTAS, ICMSOUTRAS, CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4,
	echo        TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, IFC_SEQ, TFCREDCOFINSPIS, CSTB, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, TIPOLIGACAO,
	echo        GRUPOTENSAO, OBS, CDF_CODIGO, CSTCOFINSPIS, CSOSNB, ESPECIE, FATURA, FDF_SEQ, PENDENTE, CHV_DOCE, FIN_DOCE, CHV_DOCE_REF, FCPBASECALC, FCPALIQUOTA, FCPVALOR,
	echo        FCPBASECALCSUBS, FCPALIQUOTASUBS, FCPVALORSUBS, CAF_SEQ, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS
	echo FROM CEE
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DTDOC, ESPECIE, CANCELADO, SERIE, SUBSERIE, NUMERO;
	
    echo SELECT EMP_CODIGO NFM_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, ESPECIE, DOCPROPRIO, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULINICIAL, FORMULFINAL, DTEMISSAO, CANCELADO,
	echo        DTENTRADASAIDA, DTDOC, PAR_CODIGO, GNREVINCULADA, GNREICMS, GNREANOMES, GNRECONVENIO, GNREDTVENC, GNREDTRECOLHIM, GNREBANCO, GNREAGENCIA, GNREAGENCIADV, GNREAUTENTIC,
	echo        TOTALPRODUTOS, TOTALFRETE, TOTALSEGURO, TOTALOUTRASDESP, TOTALICMSIMPORT, TOTALICMSIMPDIF, TOTALIPIVR, TOTALSUBSTRET, TOTALSERVISS, TOTALDESCGLOBAL, TOTALVR, QTDITENSPROD,
	echo        ARECSUBST, ARECANTEC, ARECDIFALIQ, SUBSTVRCONTABIL, SUBSTBASECALC, ANTECVRCONTABIL, ISSRETIDO, DTRETENCAO, DTENTRADAESTADO, FRETEPORCONTA, FATURA, EEC_NUMERO, NUMEROCF,
	echo        CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS,
	echo        TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, NOTACOMP, NUMEROPAG, DATAPAG, TIPOPAG, SDE_CODIGO, NFVENDAFORAESTAB, ALIQSUBST, TFCREDCOFINSPIS, CHAVEELET,
	echo        TFRETFONTEINSS, PENDENTE, OBS, STATUSENVIO, RETORNOENVIO, MOTIVOCANC, PROTOCOLONFE, AMBIENTEDIGITACAO, NOP_CODIGO, CDF_CODIGO, CDFCOMPLEMENTO, HORA_ENTRADASAIDA,
	echo        UFD_SIGLA_EMBARQ, LOCALEMBARQ, FDF_SEQ, PISCOFINSALIQUOTAESPECIFICA, REFNFE, INFADFISCO, SPDDATAENVIO, SPDICODIGO, SPDMSG, DTCONTINGENCIA, HORACONTINGENCIA, OPERACAOCONSUMIDORFINAL,
	echo        PRESENCACOMPRADOR, NOTADIGITADAPELOCONTRIBUINTE, NOTADECLARADAAM, IFC_SEQ_NOTASDEC_AM, TOTALICMSDESONERACAO, INDOBRACONSTRUCAOCIVIL, CNO, DTESCRITURACAO, TOTALFCP,
	echo        EHNFESAIDATERCEIROS, TOTALICMSMONORET, DECRETO353952023CE
	echo FROM NFM
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DTDOC, ESPECIE, CANCELADO, SERIE, SUBSERIE, NUMERO;

    echo SELECT EMP_CODIGO INM_EMP_CODIGO, NFM_SEQ, SEQ, UFD_SIGLA, CFO_CODIGO, VALOR, ICMSBASECALC, ICMSALIQ, ICMSDEBCRED, ICMSISENTAS, ICMSOUTRAS, IPIBASECALC, IPIDEBCRED, IPIISENTAS,
	echo        IPIOUTRAS, PERCREDUC, SUBSTICMS, SUBSTIPI, SUBSTCOFINS, SUBSTPIS, PERCICMSSUBST, CALCFECOPDEC29560, CSOSNA, CSOSNB, CSTIPI, CSTA, CSTB, COFINSMONO, PISMONO, FCPBASECALC,
	echo        FCPALIQUOTA, FCPVALOR, FCPBASECALCSUBS, FCPALIQUOTASUBS, FCPVALORSUBS, ALIQ_ICMS_DIFERIMENTO
    echo FROM INM
    echo ORDER BY EMP_CODIGO, NFM_SEQ, SEQ;

    echo SELECT EMP_CODIGO ITM_EMP_CODIGO, PNM_NFM_SEQ, PNM_SEQ, SEQ, NUMLOTE, QTDITENSLOTE, DTFABRICACAO, DTVALIDADE, INDICADORBCMEDICAMENTO, VLMAXIMOTABELADO
    echo FROM ITM
    echo ORDER BY EMP_CODIGO, PNM_NFM_SEQ, PNM_SEQ, SEQ, NUMLOTE;

    echo SELECT EMP_CODIGO PNM_EMP_CODIGO, NFM_SEQ, SEQ, PRO_CODIGO, CFO_CODIGO, CSTA, CSTB, UNIDMEDIDA, QUANTIDADE, VRTOTAL, IPIVR, ICMSTRIBUTACAO, ICMSBASECALC, ICMSALIQ, ICMSSUBSTBC,
	echo        ICMSSUBSTVR, ARECOLHER, SUBSTTIPO, SUBSTCUSTOAQ, SUBSTAGREG, SUBSTBASECALC, SUBSTALIQ, SUBSTCREDORIG, SUBSTJAREC, ANTECCUSTOAQ, ANTECAGREG, ANTECALIQ, ANTECCREDORIG, ANTECJAREC,
	echo        DIFALIQBASECALC, DIFALIQALIQORIG, DIFALIQALIQINT, IPITRIBUTACAO, IPIBASECALC, IPIALIQ, IPIDEBCRED, CCO_CODIGO, PERCREDANTEC, CSTIPI, CSTCOFINS, CSTPIS, TFBASECALCCOFINS,
	echo        TFBASECALCPIS, PERCICMSSUBST, CALCFECOPDECPNM, RESSARCIMENTO, VRDESCONTO, VRBRUTO, VRFRETE, VRSEGURO, CSOSNA, CSOSNB, NAR_SEQCOFINS, NAR_SEQPIS, PRODEPEINDESP, PRODEPECODAPUR,
	echo        VRUNITARIO, TIPOCALCULOCOFINS, ALIQUOTACOFINSPERC, ALIQUOTACOFINSEMREAIS, VALORCOFINS, TIPOCALCULOPIS, ALIQUOTAPISPERC, ALIQUOTAPISEMREAIS, VALORPIS, CAF_SEQ, PEDIDOCOMPRA,
	echo        ITEMPEDIDOCOMPRA, BASECALCIMPOSTO, DESPADUANEIRAS, VALORIMPOSTO, IMPOSTOIOF, VROUTRASDESPESAS, NAOCOMPOEVALORTOTAL, NATCREDESTORNOPIS, NATCREDESTORNOCOFINS, NATCONTESTORNOPIS,
	echo        NATCONTESTORNOCOFINS, FCI, INDPETROLEO, PERCIPIDEVOLVIDO, MOTIVODEVOLUCAO, RECOPI, INDESPINCENTIVOPRODEP, VRICMSDESONERACAO, MOTIVODESONERACAO, DIFALBCICMS, DIFALALIQFECOP,
	echo        DIFALALIQORIGEM, DIFALALIQDESTINO, DIFALICMSDIFERALIQ, DIFALUFORIGEM, DIFALUFDESTINO, DIFALICMSPARTILHAORIGEM, DIFALICMSPARTILHADESTINO, DIFALICMSORIGEM, DIFALICMSDESTINO,
	echo        DIFALICMSFECOP, EXCLUSAOBCPISCOFINS, DIFALIQALIQEXT, FCPBASECALC, FCPALIQUOTA, FCPVALOR, FCPBASECALCSUBS, FCPALIQUOTASUBS, FCPVALORSUBS, RSTESPECIE, RSTDTDOCUMENTO, RSTNUMERO,
	echo        RSTSERIE, RSTCHAVEELET, RSTPAR_CODIGO, RSTCODIGOITEM, RSTQUANTIDADE, RSTVRUNITARIO, RSTVRBCICMSST, RSTVRUNITBCICMSREMETENTE, RSTALIQICMSREMETENTE, RSTVRUNITBCICMSRETENCAO,
	echo        RSTVRUNITCREDICMS, RSTALIQICMSST, RSTVRUNITBCICMSSTRESS, RSTCODRETENCAOICMSST, RSTCODMOTIVORESS, RSTCHAVEELETEMITSUBST, RSTPAR_CODRETENCAOICMSST, RSTNUMERORETENCAOICMSST,
	echo        RSTRETENCAOICMSSTSERIE, RSTRETOICMSSTCODITEM, RSTCODDOCARRECADACAO, RSTNUMERODOCARRECADACAO, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS,
	echo        ALIQ_ICMS_DIFERIMENTO, VALORSUBSTITUTOICMS, DECRETO463032018PE, DECRETO2068699AM, ICMSBCMONO, ICMSALIQMONO, ICMSMONO, ICMSBCMONORET, ICMSALIQMONORET, ICMSMONORET, ICMSBCMONODIF,
	echo        ICMSALIQMONODIF, ICMSALIQDIFMONODIF, ICMSMONODIF, ICMSBCMONORETANT, ICMSALIQMONORETANT, ICMSMONORETANT
    echo FROM PNM
    echo ORDER BY EMP_CODIGO, PNM_EMP_CODIGO, NFM_SEQ, SEQ;

	echo SELECT EMP_CODIGO TSN_EMP_CODIGO, NFM_SEQ, SEQ, SUBTOTAL, ISSTRIBUTACAO, CONSTRUCAOCIVIL, EST_CODIGO, ALIQUOTA, SERVICOS, MUN_UFD_SIGLA, MUN_CODIGO, NATUREZASERV, ATV_CODIGO,
	echo        GIS_CODIGO, SIO_CODIGO, SVS_CODIGO, CODOBRACONSTRCIVIL, PERCENTUALREDUCAO, CBL_CODIGO
	echo FROM TSN
	echo ORDER BY EMP_CODIGO, EST_CODIGO, NFM_SEQ, SEQ, SERVICOS, ISSTRIBUTACAO;
	
	echo SELECT EMP_CODIGO SVN_EMP_CODIGO, NFM_SEQ, SEQ, SVS_CODIGO, VALOR, ISSBASECALC, ISSALIQ, ISSIMPOSTO, CSTCOFINS, CSTPIS, TFBASECALCCOFINS, TFBASECALCPIS, CSTPISCOFINS,
	echo        TFBASECREDCOFINSPIS, ISSTRIBUTACAO, NAR_SEQCOFINS, NAR_SEQPIS, PERCENTUALREDUCAO, CCO_CODIGO, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO,
	echo        TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS,
	echo        VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, ATV_CODIGO, EST_CODIGO, EXCLUSAOBCPISCOFINS, TFRECTRIBCOFINSITEM, TFRECTRIBPISITEM
	echo FROM SVN
	echo ORDER BY EMP_CODIGO, EST_CODIGO, NFM_SEQ, SEQ, SVS_CODIGO, ISSTRIBUTACAO;

    echo SELECT EMP_CODIGO DSS_EMP_CODIGO, EST_CODIGO, DTEMISSAO, ESPECIE, FORMCONT, NRINICIAL, NRFINAL, CANCELADO, VRTOTAL, PAR_CODIGO, ISSRETIDO, TFRECTRIBCOFINS, TFRECTRIBPIS,
    echo        TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ,
	echo        TFRETFONTEINSS, GRUPO, GRPVRUTILCONTAB, AMI_SEQ, TFRETFONTEIRRF, SDE_CODIGO, FATURA, SERIE, CHAVEELET, DTPRESTACAO, FDF_SEQ, PAGADORSUS,
	echo        VRDEDUCOES, VRDESCONTO, VRBRUTO, CCO_CODIGO, INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE, OUTRASRETENCOES
	echo FROM DSS
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DTEMISSAO, ESPECIE, CANCELADO, NRINICIAL;

    echo SELECT EMP_CODIGO ITS_EMP_CODIGO, DSS_SEQ, SUBTOTAL, EST_CODIGO, ISSTRIBUTACAO, SERVICOS, ALIQUOTA, MUN_UFD_SIGLA, MUN_CODIGO, NATUREZASERV, ATV_CODIGO, SVS_CODIGO,
	echo        CSTCOFINS, CSTPIS, TFBASECALCCOFINS, TFBASECALCPIS, CODOBRACONSTRCIVIL, NAR_SEQCOFINS, NAR_SEQPIS, VRDEDUCOES, VRDESCONTO, VRBRUTO, PERCENTUALREDUCAO, CCO_CODIGO,
	echo        TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20,
	echo        TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, EXCLUSAOBCPISCOFINS, TFRECTRIBCOFINSITEM,
	echo        TFRECTRIBPISITEM
    echo FROM ITS
    echo ORDER BY EMP_CODIGO, EST_CODIGO, DSS_SEQ, SEQ;

    echo SELECT EMP_CODIGO ESI_EMP_CODIGO, SEQ, EST_CODIGO, PAR_CODIGO, DTEMISSAO, NF, ESPECIE, FORMCONT, NUMERO, VRTOTAL, DTRETENCAO, GRUPO, GRPVRUTILCONTAB, IFC_SEQ,
	echo        TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRRF, TFRETFONTEINSS, SDE_CODIGO, FATURA, SERIE, CHAVEELET, TFCREDCOFINSPIS, VRDEDUCOES,
	echo        VRDESCONTO, VRBRUTO, FDF_SEQ, CCO_CODIGO, INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE, OUTRASRETENCOES, DTPRESTACAO
    echo FROM ESI
    echo ORDER BY EMP_CODIGO, EST_CODIGO, SEQ;

    echo SELECT EMP_CODIGO IES_EMP_CODIGO, ESI_SEQ, SEQ, SUBTOTAL, CONSTRUCAOCIVIL, TRIBUTACAO, SERVICOS, ALIQUOTA, GIS_CODIGO, SIO_CODIGO, SVS_CODIGO, CSTPISCOFINS, TFBASECALCPISCOFINS, NATBCCRED, CODOBRACONSTRCIVIL, CNAE, VRDEDUCOES, VRDESCONTO, VRBRUTO, CCO_CODIGO, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, EXCLUSAOBCPISCOFINS, TFRECTRIBCOFINSITEM, TFRECTRIBPISITEM, CBL_CODIGO
    echo FROM IES
    echo ORDER BY EMP_CODIGO, ESI_SEQ, SEQ;

    echo SELECT EMP_CODIGO CTC_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, ESPECIE, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULARIO, DTEMISSAO, CANCELADO, DTENTRADAPREST, DTDOC, FRETE, PAR_CODIGO_REMPREST, PAR_CODIGO_DEST, CFO_CODIGO, VRTOTAL, ICMSBASECALC, ICMSALIQ, ICMSVR, ICMSISENTAS, ICMSOUTRAS, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, MUN_UFD_SIGLA_ENT, MUN_CODIGO_ENT, DISTANCIA, QTDMERCADORIA, UNIDMEDIDA, FRETECALCULADO, VEICULOPLACA, UFD_SIGLA_VEICULO, RESUMOMOVDIARIO, RMD_SEQ, CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, IFC_SEQ, DIFERALIQUOTA, BASECALCDIFALIQ, ALIQORIGEM, ALIQINTERNA, FATURA, TFCREDCOFINSPIS, CSTB, CHAVEELET, CDF_CODIGO, CSTPIS, CSTCOFINS, CREDCSTPISCOFINS, INDNATFRT, NATBCCRED, NAR_SEQCOFINS, NAR_SEQPIS, PAR_CODIGO_CONSIG, PAR_CODIGO_REDESP, FRETEOPERACAOREDESP, FDF_SEQ, SPDDATAENVIO, SPDICODIGO, SPDMSG, ICP_CODIGO, CSOSNB, DIFAL, DIFALBCICMS, DIFALALIQFECOP, DIFALALIQORIGEM, DIFALALIQDESTINO, DIFALICMSDIFERALIQ, DIFALUFORIGEM, DIFALUFDESTINO, DIFALICMSPARTILHAORIGEM, DIFALICMSPARTILHADESTINO, DIFALICMSORIGEM, DIFALICMSDESTINO, DIFALICMSFECOP, DIFALIQALIQEXT, SUBSTTIPO, SUBSTCUSTOAQ, SUBSTAGREG, SUBSTBASECALC, SUBSTALIQ, SUBSTCREDORIG, SUBSTJAREC, CAF_SEQ, TFRETFONTEINSS, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, INDOBRACONSTRUCAOCIVIL, CNO, CLASSIFICACAOMAOOBRA, PENDENTE, SUBSTICMS, EXCLUSAOBCPISCOFINS, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS, ANTECCUSTOAQ, ANTECAGREG, ANTECALIQ, ANTECCREDORIG, PERCREDANTEC, ANTECJAREC, NATCONTESTORNOPISCOFINS, DOCPROPRIO, TIPOCTE
    echo FROM CTC
    echo ORDER BY EMP_CODIGO, EST_CODIGO, SEQ;

    echo SELECT EMP_CODIGO NCT_EMP_CODIGO, CTC_SEQ, SEQ, ESPECIE, SERIE, SUBSERIE, NUMERO, DTEMISSAO, VRTOTAL, CHAVEELET
    echo FROM NCT
    echo ORDER BY EMP_CODIGO, CTC_SEQ, SEQ;

    echo SELECT EMP_CODIGO NTC_EMP_CODIGO, SEQ, EST_CODIGO, OPERACAO, DAI_AID_SEQ, DAI_SEQ, SERIE, SUBSERIE, NUMERO, FORMULARIO, DTEMISSAO, CANCELADO, DTENTRADASAIDA, DTDOC, PAR_CODIGO, CFO_CODIGO, VRTOTAL, ICMSBASECALC, ICMSALIQ, ICMSVR, ICMSISENTAS, ICMSOUTRAS, QTDITENS, CCO_CODIGO, TFRECTRIBCOFINS, TFRECTRIBPIS, TFRECTRIBCSL1, TFRECTRIBCSL2, TFRECTRIBIRPJ1, TFRECTRIBIRPJ2, TFRECTRIBIRPJ3, TFRECTRIBIRPJ4, TFRETFONTECOFINS, TFRETFONTEPIS, TFRETFONTECSL, TFRETFONTEIRPJ, GRUPO, GRPVRUTILCONTAB, IFC_SEQ, TFCREDCOFINSPIS, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, TFRETFONTEINSS, TIPOFRETE, VEICULOPLACA, PLACAUFD_SIGLA, MUN_UFD_SIGLA_DES, MUN_CODIGO_DES, CDF_CODIGO, INDNATFRT, FATURA, FDF_SEQ, CSTB, CSOSNB, ESPECIE, CHAVEELET, INDOBRACONSTRUCAOCIVIL, CNO, PENDENTE, SUBSTICMS
	echo FROM NTC
    echo ORDER BY EMP_CODIGO, EST_CODIGO, SEQ;

    echo SELECT EMP_CODIGO SNT_EMP_CODIGO, NTC_SEQ, SEQ, SIC_CODIGO, QUANTIDADE, VRTOTAL, CSTB, ICMSTRIBUT, ICMSBASECALC, CCO_CODIGO, CSTCOFINS, TFBASECALCCOFINS, CSTPIS, TFBASECALCPIS, MUN_UFD_SIGLA_COL, MUN_CODIGO_COL, MUN_UFD_SIGLA_DES, MUN_CODIGO_DES, CSTPISCOFINS, TFBASECALCPISCOFINS, NATBCCRED, NAR_SEQCOFINS, NAR_SEQPIS, CSOSNB, CAF_SEQ, TFBCRETFONTEINSS, ALIQINSS, VRRETFONTEINSS, VRRETSUBCONTRATACAO, TFBCRETFONTEINSSSERV15, ALIQINSS15, VRSERVICO15, TFBCRETFONTEINSSSERV20, ALIQINSS20, VRSERVICO20, TFBCRETFONTEINSSSERV25, ALIQINSS25, VRSERVICO25, VRADICIONALINSS, VRNAORETPROCESSOPRINCIPAL, VRNAORETPROCESSOADICIONAL, EXCLUSAOBCPISCOFINS, AJUSTEICMSBASECALC, AJUSTEICMSALIQ, AJUSTEICMSVALOR, AJUSTEICMSOUTROS
    echo FROM SNT
    echo ORDER BY EMP_CODIGO, NTC_SEQ, SEQ;

    echo SELECT EMP_CODIGO SIC_EMP_CODIGO, CODIGO, DESCRICAO, CODANATEL, ICP_CODIGO, APURACAOPISCOFINS, PERCENTUALCSL, PERCENTUALIRPJ, CODRECEITACOFINS, CODRECEITAPIS, CODRECEITACSL, CODRECEITAIRPJ, CODRECEITACSRF, ALIQICMSINTERNA, CLASSIFICACAOMAOOBRA, CPRB, CCO_CODIGO, SERVCONVICMS11503, CODRECEITACOSIRF
    echo FROM SIC
    echo ORDER BY EMP_CODIGO, CODIGO;

    echo SELECT CODIGO PAR_CODIGO, NOME, UFD_SIGLA, CNPJCPF, IE, IM, INFISSDIGITAL, FORNPRODPRIM, SOCIEDSIMPLES, ENDLOGRADTIPO, ENLOGRADOURO, ENDNUMERO, ENDCOMPLEMENTO, BAIRROTIPO,
	echo        BAIRRO, CEP, MUN_CODIGO, DDD, FONE, SUFRAMA, CFO_CODIGOENTULTUTIL, CFO_CODIGOSAIULTUTIL, ULTICMSALIQENTUTIL, ULTICMSALIQSAIUTIL, SUBSTITUTOISS, ULTCONSTRUCAOCIVIL,
	echo        ORGAOPUBLICO, INDUSTRIA, OPTSIMPLESNAC, PASSAPORTE, PAI_CODIGO, EXTERIOR, ADM_CARTAOCREDITO, EMAIL, HOSPITALEAFINS, INDICADORIE, CNAE21_CODIGO, CPRB, PRODUTORRURAL,
	echo        INDICATIVODAAQUISICAO
    echo FROM PAR
    echo ORDER BY UFD_SIGLA, CNPJCPF, IE, IM;

	echo SELECT EMP_CODIGO IFC_EMP_CODIGO, ORIGEM, COMENTARIO, ARQUIVO, EXCLUIDO, DTINICIAL, DTFINAL, CONTEXTO, PISCOFINSALIQUOTAESPECIFICA, NOTASFISCAISDECLARADASAM, VERSAOARQUIVO,
	echo        PENDENTECANCELAMENTO, PENDENTEIMPORTACAO
	echo FROM IFC
	echo ORDER BY EMP_CODIGO, ORIGEM, ARQUIVO, VERSAOARQUIVO, DTINICIAL;
) > %config%

call "C:\Program Files\Firebird\Firebird_2_5\bin\isql" -user %username% -password %password% %database% -i %config% -o %output2%
del %config%
del "%temp%"\null
kdiff3 %output1% %output2%