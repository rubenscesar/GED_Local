@echo off
cls
echo Checando Unidades Mapeadas
echo.

:Unidade1
Title Checando Unidade [ P: ]
if exist "P:" (echo Unidade [ P: ] Mapeada) else (goto RemapUnidade1)

:Unidade2
Title Checando Unidade [ O: ]
if exist "O:" (echo Unidade [ O: ] Mapeada) else (goto RemapUnidade2)
exit



:RemapUnidade1
Title Remapeando Unidade [ P: ]
net use /delete P:
cls
REM net use P: \\10.1.254.70\x\Programacao /USER:grupofortes\build superv
net use P: \\10.1.254.70\x\Programacao
if exist "P:" (goto Unidade2) else (net use /delete P:)

:RemapUnidade2
Title Remapeando Unidade [ O: ]
net use /delete O:
cls
REM net use O: \\10.1.254.101\Empresa\FortesTec /USER:grupofortes\build superv
net use O: \\10.1.254.101\Empresa\FortesTec
if exist "O:" (goto exit) else (net use /delete O:)