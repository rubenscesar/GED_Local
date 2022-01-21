<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1635854327342" ID="ID_1315169560" MODIFIED="1635854485633" TEXT="Deploy">
<node CREATED="1635854491304" ID="ID_1460926743" MODIFIED="1635854502098" POSITION="right" TEXT="Vers&#xe3;o Ordin&#xe1;ria / Extraordin&#xe1;ria">
<node CREATED="1635854522190" FOLDED="true" ID="ID_259822606" MODIFIED="1635854695066" TEXT="Delphi 7">
<node CREATED="1635854549062" ID="ID_1951281751" MODIFIED="1635854692370" TEXT="Empacotar nova Build">
<node CREATED="1635854572510" ID="ID_469496553" MODIFIED="1635854573658" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity"/>
<node CREATED="1635854592197" ID="ID_1662139705" MODIFIED="1635854593435" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity"/>
</node>
<node CREATED="1635854562269" ID="ID_727088708" MODIFIED="1635854692978" TEXT="Reempacotar a Build">
<node CREATED="1635854572510" ID="ID_486751487" MODIFIED="1635854573658" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity"/>
<node CREATED="1635854592197" ID="ID_1433810829" MODIFIED="1635854593435" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity"/>
</node>
</node>
<node CREATED="1635854510694" ID="ID_392486657" MODIFIED="1635854513138" TEXT="Delphi Xe6">
<node CREATED="1635854549062" ID="ID_1885705983" MODIFIED="1635854550962" TEXT="Empacotar nova Build">
<node CREATED="1635854572510" ID="ID_1660729305" MODIFIED="1635854788654" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-6a80b649-7fff-9187-870c-ea5f1041b4be" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">Mapa das etapas que comp&#245;em o processo de empacotamento da vers&#227;o automatizada</font></b>
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1635854877685" ID="ID_1697047077" MODIFIED="1635855180192" TEXT="Step 1: Fechar">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-92784258-7fff-683e-e21d-7c087ca7e08a" style="font-weight: normal"><font color="#000000" face="Arial">Encerra todas as aplica&#231;&#245;es que ainda est&#227;o abertas e prepara para iniciar o deploy</font></b>
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1635855089959" ID="ID_1667847710" MODIFIED="1635855198113" TEXT="Chamada">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-930de422-7fff-af12-a81b-955b47b7f637" style="font-weight: normal"><font color="#000000" face="Arial">C:\Utils\Fechar.bat 2&gt;NUL</font></b>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1635855103726" ID="ID_97391299" MODIFIED="1635855615523" TEXT="Fonte">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier New">@ECHO OFF </font>
    </p>
    <p>
      <font face="Courier New">taskkill.exe /f /im AC.exe </font>
    </p>
    <p>
      <font face="Courier New">taskkill.exe /f /im Ponto.exe </font>
    </p>
    <p>
      <font face="Courier New">taskkill.exe /f /im Patrio.exe </font>
    </p>
    <p>
      <font face="Courier New">taskkill.exe /f /im GR.exe </font>
    </p>
    <p>
      <font face="Courier New">taskkill.exe /f /im Discover.exe </font>
    </p>
    <p>
      <font face="Courier New">taskkill.exe /f /im TestComplete.exe </font>
    </p>
    <p>
      <font face="Courier New">taskkill.exe /f /im TestCompleteService5.exe </font>
    </p>
    <p>
      <font face="Courier New">ping.exe -n 5 10.1.254.254 &gt;null </font>
    </p>
    <p>
      <font face="Courier New">SET ERRORLEVEL=0 </font>
    </p>
    <p>
      <font face="Courier New">ECHO ON</font>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1635854885029" ID="ID_1102414382" MODIFIED="1635855021320" TEXT="Step 2: Mapear Unidades de Rede">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-fb064bb8-7fff-98ba-a577-728b947ba449" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">Mapeia as unidades de rede P e O</font></b>
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1635855089959" ID="ID_1667705631" MODIFIED="1635855636877" TEXT="Chamada">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-b5eec6a4-7fff-085f-c846-6a3640b0174a" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">C:\Utils\map.bat 2&gt;NULL</font></b>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1635855103726" ID="ID_183356628" MODIFIED="1635855693177" TEXT="Fonte">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier New">@echo off </font>
    </p>
    <p>
      <font face="Courier New">net use * /delete /y </font>
    </p>
    <p>
      <font face="Courier New">net use p:&#160;&#160;&#160;&#160;\\10.1.254.70\x\Programacao /USER:grupofortes\build superv </font>
    </p>
    <p>
      <font face="Courier New">net use o:&#160;&#160;&#160;&#160;\\10.1.254.1\public\outros /USER:grupofortes\build superv </font>
    </p>
    <p>
      <font face="Courier New">net use l:&#160;&#160;&#160;&#160;\\Fortescorp\f\lixo /USER:grupofortes\build superv </font>
    </p>
    <p>
      <font face="Courier New">pause</font>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1635854889590" ID="ID_1716650092" MODIFIED="1635856272840" TEXT="Step 3: Baixa a tag">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-c7481ec4-7fff-5b7b-6951-bac2f91ef4d4" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">Identifica qual o n&#250;mero da tag, baixa e converte o AC.ver de &quot;6.1&quot; para &quot;7.1&quot;</font></b>
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1635855089959" ID="ID_212101230" MODIFIED="1635855716056" TEXT="Chamada">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-ea3a661e-7fff-2f5f-69b1-522706854203" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">C:\Utils\Xe6DeployTag.bat 2&gt;NULL</font></b>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1635855103726" ID="ID_1529732878" MODIFIED="1635855762011" TEXT="Fonte">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier New">@echo on </font>
    </p>
    <p>
      <font face="Courier New">echo %Pegar numero da Tag% </font>
    </p>
    <p>
      <font face="Courier New">FOR /F &quot;tokens=1-3&quot; %%i IN ('c:\Ferramentas\sigcheck.exe &quot;P:\Pronto\AC\CD\Programas\AC.exe&quot;') DO ( IF &quot;%%i %%j&quot;==&quot;File version:&quot; SET filever=%%k ) </font>
    </p>
    <p>
      <font face="Courier New">set filever=%filever: =% </font>
    </p>
    <p>
      <font face="Courier New">set NomeTag=%filever:.=_% </font>
    </p>
    <p>
      <font face="Courier New">ECHO %NomeTag% </font>
    </p>
    <p>
      <font face="Courier New">ECHO Baixando Tag https://10.1.254.7/svn/ac/tags/%NomeTag% </font>
    </p>
    <p>
      <font face="Courier New">rmdir /Q /S &quot;c:\projetos\ac&quot; </font>
    </p>
    <p>
      <font face="Courier New">svn checkout https://10.1.254.7/svn/ac/tags/%NomeTag% c:\projetos\ac </font>
    </p>
    <p>
      <font face="Courier New">echo %Mudar AC.ver% </font>
    </p>
    <p>
      <font face="Courier New">cscript &quot;c:\Utils\replace.vbs&quot; &quot;c:\projetos\ac\fontes\ac.ver&quot; &quot;6.1&quot; &quot;7.1&quot; </font>
    </p>
    <p>
      <font face="Courier New">pause</font>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1635854895101" ID="ID_1233637538" MODIFIED="1635856487680" TEXT="Step 4: Copia o Conversor Detox">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-74cfa726-7fff-c162-2ba6-47f4469db7fc" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">Copia o conversor Detox mais recente do &quot;P&quot; para a pasta &quot;Ferramentas&quot; e &quot;Utils&quot;</font></b>
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1635855089959" ID="ID_690293141" MODIFIED="1635856337368" TEXT="Chamada">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-b94dc381-7fff-ab98-5259-c8f6cc9b6122" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">C:\Utils\CopiaDetox.bat 2&gt;NULL</font></b>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1635855103726" ID="ID_1988285348" MODIFIED="1635856368972" TEXT="Fonte">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Xcopy \\10.1.254.70\x\Programacao\Outros\Delphi\DeTox.exe C:\Ferramentas\ /y /d /v /r /k
    </p>
    <p>
      Xcopy \\10.1.254.70\x\Programacao\Outros\Delphi\DeTox.exe C:\Utils\ /y /d /v /r /k
    </p>
    <p>
      pause
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1635854901070" ID="ID_1347081010" MODIFIED="1635856748377" TEXT="Step 5: Roda o Conversor Detox">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-a835ec36-7fff-abdb-2bdc-a1d1449a1c3e" style="font-weight: normal"><font color="#000000" face="Arial">Cria a pasta &quot;..\Fontes_XE6&quot; e converte os arquivos da pasta &quot;..\Fontes&quot; para a pasta &quot;..\Fontes_XE6&quot;</font></b>
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1635855089959" ID="ID_1436412911" MODIFIED="1635856528728" TEXT="Chamada">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-3b895f36-7fff-a1fe-29a0-fd1e66bb9feb" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">C:\Utils\Detox.bat 2&gt;NULL</font></b>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1635855103726" ID="ID_560776335" MODIFIED="1635856557986" TEXT="Fonte">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier New">@echo off </font>
    </p>
    <p>
      <font face="Courier New">rd c:\projetos\ac\Fontes_XE6\ /s /q </font>
    </p>
    <p>
      <font face="Courier New">C:\Ferramentas\DeTox.exe -r c:\projetos\ac\Fontes\ c:\projetos\ac\Fontes_XE6\ </font>
    </p>
    <p>
      <font face="Courier New">copy c:\projetos\ac\Fontes\ACFCXE6.dpr c:\projetos\ac\Fontes_XE6 </font>
    </p>
    <p>
      <font face="Courier New">copy c:\projetos\ac\Fontes\TestesFuncionais\ACSuite\ACPessoal\Script\MV_Empregados_Vale_Transporte_Movimentar_Situacao.sd c:\projetos\ac\Fontes_XE6\TestesFuncionais\ACSuite\ACPessoal\Script\</font>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1635854904198" ID="ID_1443306151" MODIFIED="1635854983267" TEXT="Step 6: Cria arquivo RC">
<node CREATED="1635855089959" ID="ID_1137391225" MODIFIED="1635856930451" TEXT="Chamada">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b><font color="#000000" face="Arial">Entra na pasta:</font></b>
    </p>
    <p>
      <b charset="utf-8" id="docs-internal-guid-677e539e-7fff-f13f-74c8-9a68e1290dc0" style="font-weight: normal"><font color="#000000" face="Arial">c:\projetos\ac\Fontes_xe6\Testes</font></b>
    </p>
    <p>
      
    </p>
    <p>
      <b>e roda:</b>
    </p>
    <p>
      <b charset="utf-8" id="docs-internal-guid-8201b158-7fff-85e7-75b1-9a96db1700ee" style="font-weight: normal"><font color="#000000" face="Arial">want -buildfile want_XE.xml ControlVersion</font></b>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1635855103726" ID="ID_1070032593" MODIFIED="1635855131443" TEXT="Fonte"/>
</node>
<node CREATED="1635854908422" ID="ID_1759417920" MODIFIED="1635854989346" TEXT="Step 7: Empacotar Xe6">
<node CREATED="1635855089959" ID="ID_749501583" MODIFIED="1635856923269" TEXT="Chamada">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b><font color="#000000" face="Arial">Entra na pasta:</font></b>
    </p>
    <p>
      c:\projetos\ac\Fontes_xe6\Testes
    </p>
    <p>
      
    </p>
    <p>
      <b>e roda:</b>
    </p>
    <p>
      Deploy_XE6.bat 2&gt;NULL
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1635855103726" ID="ID_224246944" MODIFIED="1635857003843" TEXT="Fonte">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="Courier New">@ECHO OFF </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">set DeployDir=..\Deploy </font>
    </p>
    <p>
      <font face="Courier New">set DeployNuvemDir=..\Deploy\Nuvem </font>
    </p>
    <p>
      <font face="Courier New">set PastaPronto=ACXE6 </font>
    </p>
    <p>
      <font face="Courier New">set ProntoDir=P:\PRONTO\%PastaPronto% </font>
    </p>
    <p>
      <font face="Courier New">set ProntoTempDir=P:\PRONTO\%PastaPronto%(Atualizando) </font>
    </p>
    <p>
      <font face="Courier New">set HomologacaoDir=O:\PRONTO\%PastaPronto%\Homologacao </font>
    </p>
    <p>
      <font face="Courier New">set HomologacaoNuvemDir=O:\PRONTO\%PastaPronto%\Homologacao\Nuvem </font>
    </p>
    <p>
      <font face="Courier New">set DocumentosDir=O:\PRONTO\%PastaPronto%\Documentos </font>
    </p>
    <p>
      <font face="Courier New">set AgenteDir=P:\Pronto\ACPessoalAgenteESocial </font>
    </p>
    <p>
      <font face="Courier New">set TotemDir=P:\Pronto\TotemXE </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">if not exist %ProntoDir% goto SemPronto </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Criando Binarios e Backups dos Bancos </font>
    </p>
    <p>
      <font face="Courier New">C:\Ferramentas\want.exe -buildfile want_XE.xml AssertFirebirdVersion </font>
    </p>
    <p>
      <font face="Courier New">if errorlevel 1 goto exit </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">C:\Ferramentas\want.exe -buildfile want_XE.xml ImportFortesLib </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">C: </font>
    </p>
    <p>
      <font face="Courier New">C:\Ferramentas\want.exe -buildfile want_XE.xml Deploy </font>
    </p>
    <p>
      <font face="Courier New">if errorlevel 1 goto exit </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">if not exist %DeployDir% goto exit </font>
    </p>
    <p>
      <font face="Courier New">if not exist %ProntoDir% goto SemPronto </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ren %ProntoDir% %PastaPronto%(Atualizando) </font>
    </p>
    <p>
      <font face="Courier New">if not exist %ProntoTempDir% goto SemProntoTemp </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">if not exist %DeployDir%\Atualiza.exe goto NaoGerouAlgo </font>
    </p>
    <p>
      <font face="Courier New">if not exist %DeployDir%\AC.exe goto NaoGerouAlgo </font>
    </p>
    <p>
      <font face="Courier New">if not exist %DeployNuvemDir%\AC.exe goto NaoGerouAlgo </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando FortesACAgenteInstalador.exe </font>
    </p>
    <p>
      <font face="Courier New">copy %AgenteDir%\FortesACAgenteInstalador.exe %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %AgenteDir%\FortesACAgenteInstalador.exe %ProntoTempDir%\CD\Programas\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando FortesTotemSetup.exe </font>
    </p>
    <p>
      <font face="Courier New">copy %TotemDir%\FortesTotemSetup.exe %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %TotemDir%\FortesTotemSetup.exe %ProntoTempDir%\CD\Programas\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Instala.exe </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\Instala.exe %ProntoTempDir%\CD\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Atualiza.exe </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\Atualiza.exe %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\AtualizaCMD.exe %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\Update.id %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando InstalaTerminal.exe </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\InstalaTerminal.exe %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\InstalaTerminal.exe %ProntoTempDir%\CD\Programas\ </font>
    </p>
    <p>
      <font face="Courier New">ECHO Copiando LEG.DAT </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\LEG.DAT %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando AC.exe </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\AC.exe %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\AC.exe %ProntoTempDir%\CD\Programas\ </font>
    </p>
    <p>
      <font face="Courier New">copy P:\Pronto\AC\Atualizador\AC.exe %ProntoTempDir%\Atualizador\AC_D7.exe </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando AC.exe Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployNuvemDir%\AC.exe %ProntoTempDir%\Nuvem </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Instala.exe Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployNuvemDir%\InstalaXE6.exe %ProntoTempDir%\Nuvem\Instala.exe </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Atualiza.exe Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployNuvemDir%\AtualizaXE6.exe %ProntoTempDir%\Nuvem\Atualiza.exe </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando AtualizaCMD.exe Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployNuvemDir%\AtualizaCMD.exe %ProntoTempDir%\Nuvem </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando AC.ver </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\AC.ver %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Arquivo CSV Exemplo Contabil </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\Leiaute_CSV_Contabil_Exemplo.csv %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\Leiaute_CSV_Contabil_Exemplo.csv %ProntoTempDir%\CD\Help\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando AC.fbk e AC.bak </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\ACNovo.fbk %ProntoTempDir%\CD\Dados\AC.fbk </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando .SQLs </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\Update.sql %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\UpdateMSSQL.sql %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\Update.dat %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      <font face="Courier New">copy %DeployDir%\UpdateMSSQL.dat %ProntoTempDir%\Atualizador\ </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Rodando makea </font>
    </p>
    <p>
      <font face="Courier New">P: </font>
    </p>
    <p>
      <font face="Courier New">cd %ProntoTempDir%\Internet </font>
    </p>
    <p>
      <font face="Courier New">call makea.bat </font>
    </p>
    <p>
      <font face="Courier New">@ECHO OFF </font>
    </p>
    <p>
      <font face="Courier New">C: </font>
    </p>
    <p>
      <font face="Courier New">cd \Projetos\AC\Fontes_xe6\Testes </font>
    </p>
    <p>
      <font face="Courier New">ren %ProntoTempDir% %PastaPronto% </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">FOR /F &quot;tokens=1-3&quot; %%i IN ('c:\Ferramentas\sigcheck.exe &quot;%DeployNuvemDir%\AC.exe&quot;') DO ( IF &quot;%%i %%j&quot;==&quot;File version:&quot; SET filever=%%k ) </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">set filever=%filever: =% </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Instalador e Atualizador %filever% para Homologacao </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">IF not exist %HomologacaoDir% mkdir O:\PRONTO\ACXE6\Portal\%HomologacaoDir% </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">copy P:\Pronto\ACXE6\Internet\FortesACAtualizador.exe &quot;%HomologacaoDir%\FortesACAtualizadorXE6_%filever%.exe&quot; </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">IF not exist %HomologacaoNuvemDir% mkdir %HomologacaoNuvemDir% </font>
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Arquivos de Nuvem %filever% para %HomologacaoNuvemDir% </font>
    </p>
    <p>
      <font face="Courier New">copy &quot;%ProntoDir%\Nuvem\AC.exe&quot; &quot;%HomologacaoNuvemDir%\AC_%filever%.exe&quot; </font>
    </p>
    <p>
      <font face="Courier New">copy &quot;%ProntoDir%\Nuvem\ACPessoalServiceCL.exe&quot; &quot;%HomologacaoNuvemDir%\ACPessoalServiceCL_%filever%.exe&quot; </font>
    </p>
    <p>
      <font face="Courier New">copy &quot;%ProntoDir%\WebServicePessoal\Internet\ACPessoalService.exe&quot; &quot;%HomologacaoDir%\ACPessoalService_%filever%.exe&quot; </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Instalador e Atualizador %filever% para Portal </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">IF not exist O:\PRONTO\ACXE6\Portal\%filever% mkdir O:\PRONTO\ACXE6\Portal\%filever% </font>
    </p>
    <p>
      <font face="Courier New">IF not exist O:\PRONTO\ACXE6\Portal\%filever%\Nuvem mkdir O:\PRONTO\ACXE6\Portal\%filever%\Nuvem </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">copy P:\Pronto\ACXE6\Internet\FortesACAtualizador.exe O:\PRONTO\ACXE6\Portal\%filever% </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Copiando Arquivos de nuvem %filever% para Portal\Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy &quot;%ProntoDir%\Nuvem\AC.exe&quot; O:\PRONTO\ACXE6\Portal\%filever%\Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy &quot;%ProntoDir%\Nuvem\ACPessoalServiceCL.exe&quot; O:\PRONTO\ACXE6\Portal\%filever%\Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy &quot;%ProntoDir%\Nuvem\AtualizaCMD.exe&quot; O:\PRONTO\ACXE6\Portal\%filever%\Nuvem </font>
    </p>
    <p>
      <font face="Courier New">copy &quot;%ProntoDir%\WebServicePessoal\Internet\ACPessoalService.exe&quot; &quot;O:\PRONTO\ACXE6\Portal\%filever%\ACPessoalService.exe&quot; </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">ECHO Foi, mas eh bom verificar se nao aconteceu erros acima. </font>
    </p>
    <p>
      <font face="Courier New">goto exit </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="Courier New">:SemPronto </font>
    </p>
    <p>
      <font face="Courier New">ECHO Diretorio %ProntoDir% nao encontrado </font>
    </p>
    <p>
      <font face="Courier New">goto exit </font>
    </p>
    <p>
      <font face="Courier New">:SemProntoTemp </font>
    </p>
    <p>
      <font face="Courier New">ECHO N&#227;o foi poss&#237;vel renomear Diretorio %ProntoDir% para %ProntoTempDir% </font>
    </p>
    <p>
      <font face="Courier New">:NaoGerouAlgo </font>
    </p>
    <p>
      <font face="Courier New">ECHO N&#227;o foi poss&#237;vel gerar algum arquivo necessario para versao </font>
    </p>
    <p>
      <font face="Courier New">goto exit </font>
    </p>
    <p>
      <font face="Courier New">:exit </font>
    </p>
    <p>
      <font face="Courier New">pause</font>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node CREATED="1635854592197" ID="ID_9853520" MODIFIED="1635854814982" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b charset="utf-8" id="docs-internal-guid-04bc6a6b-7fff-739d-7888-351f452b104f" style="font-weight: normal"><font size="11pt" face="Arial" color="#000000">Tutorial das etapas a serem executadas no processo de empacotamento da vers&#227;o automatizada</font></b>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1635854562269" FOLDED="true" ID="ID_699873464" MODIFIED="1635855475594" TEXT="Reempacotar a Build">
<node CREATED="1635854572510" ID="ID_881417637" MODIFIED="1635854573658" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity"/>
<node CREATED="1635854592197" ID="ID_932297876" MODIFIED="1635854593435" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity"/>
</node>
</node>
</node>
<node CREATED="1635854536126" FOLDED="true" ID="ID_1802905067" MODIFIED="1635854697682" POSITION="right" TEXT="Vers&#xe3;o Simplificada">
<node CREATED="1635854522190" ID="ID_1216047809" MODIFIED="1635854527714" TEXT="Delphi 7">
<node CREATED="1635854549062" ID="ID_28685396" MODIFIED="1635854550962" TEXT="Empacotar nova Build">
<node CREATED="1635854572510" ID="ID_516534869" MODIFIED="1635854573658" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity"/>
<node CREATED="1635854592197" ID="ID_815722318" MODIFIED="1635854593435" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity"/>
</node>
<node CREATED="1635854562269" ID="ID_763460575" MODIFIED="1635854563562" TEXT="Reempacotar a Build">
<node CREATED="1635854572510" ID="ID_966338040" MODIFIED="1635854573658" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity"/>
<node CREATED="1635854592197" ID="ID_1728174050" MODIFIED="1635854593435" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity"/>
</node>
</node>
<node CREATED="1635854510694" ID="ID_741203021" MODIFIED="1635854513138" TEXT="Delphi Xe6">
<node CREATED="1635854549062" ID="ID_1164898741" MODIFIED="1635854550962" TEXT="Empacotar nova Build">
<node CREATED="1635854572510" ID="ID_1171298024" MODIFIED="1635854573658" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity"/>
<node CREATED="1635854592197" ID="ID_1834365027" MODIFIED="1635854593435" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity"/>
</node>
<node CREATED="1635854562269" ID="ID_1133062866" MODIFIED="1635854563562" TEXT="Reempacotar a Build">
<node CREATED="1635854572510" ID="ID_995338405" MODIFIED="1635854573658" TEXT="Vis&#xe3;o da Pipeline de Build no TeamCity"/>
<node CREATED="1635854592197" ID="ID_606528265" MODIFIED="1635854593435" TEXT="Execu&#xe7;&#xe3;o da Pipeline de Build no TeamCity"/>
</node>
</node>
</node>
</node>
</map>
