cd\
@echo off
Title DELETA FIREBIRD
cls
color 0a
cd C:\Program Files\Firebird\Firebird_2_1
unins000.exe
cd c:\Fortes\firebird\firebird_2_5
unins000.exe
sc stop "FirebirdServerFortes_FB2_5"
sc stop "FirebirdGuardianFortes_FB2_5"
sc stop "FirebirdGuardianDefaultInstance"
sc stop "FirebirdServerDefaultInstance"
sc delete "FirebirdServerFortes_FB2_5"
sc delete "FirebirdGuardianFortes_FB2_5"
sc delete "FirebirdGuardianDefaultInstance"
sc delete "FirebirdServerDefaultInstance"
rem call services.msc
rem cd C:\Program Files\Firebird
rem if exist "C:\Program Files\Firebird" del /s /q C:\Program Files\Firebird\*.*
rem if exist "C:\Program Files\Firebird" rd /s /q "C:\Program Files\Firebird"
cd\
rem if exist C:\Fortes\Firebird del /s /q C:\Fortes\Firebird\*.*
rem if exist C:\Fortes\Firebird rd /s /q C:\Fortes\Firebird
timeout -t 3