@echo off
title L1JTW ²�����]�u��
cls

REM --------------------------------------------------------------------------------------------
REM �г]�w�H�U����Ʈw�]�w��,�èϥΥ��]�u��N��Ʈw���楴�]����.
REM --------------------------------------------------------------------------------------------
REM Language=tw�G��ܹ����y�ten/cn/tw 
REM Selected=1:(�����]) 2:(�ȧt src & DB & tool & data)
REM 7zDir= 7z.exe ������|
REM --------------------------------------------------------------------------------------------
set Language=tw
set Selected=2
set Dir7z="E:\Program Files\7-Zip\7z.exe"
goto Base

Rem --------------------------------------------------------------------------------------------
Rem -   �򥻰���
Rem --------------------------------------------------------------------------------------------
:Base
copy .\workplace\xer.bat .\workplace\var.bat
..\subversion\svnversion.exe>>.\workplace\var.bat
call .\workplace\var.bat
del .\workplace\var.bat
cls

goto %Language%


Rem --------------------------------------------------------------------------------------------
Rem -  �D�t�ο��
Rem --------------------------------------------------------------------------------------------
:Start
echo %Language_Line11%
echo %Language_Line12%
echo.
echo %Language_choose1%
echo %Language_choose2%
echo %Language_choose9%
echo.
set /p Selected="%Language_Action%"
goto Select%Selected%


Rem --------------------------------------------------------------------------------------------
Rem -   �y���Ҳ�
Rem --------------------------------------------------------------------------------------------
:tw
set Language_Line11= �����s��: %Var%
set Language_Line12= �����Y�n��7z �ؿ�: %Dir7z%
set Language_choose1= �n1. ����]       [L1J-TW_ver.%Var%_FP.7z]
set Language_choose2= �n2. Src+DB�зǥ] [L1J-TW_ver.%Var%_NP.7z]
set Language_choose9= �n9. ���}
set Language_Action=��ܡG
goto Start

:cn
set Language_Line11= �����C�A: %Var%
set Language_Line12= �щ͊D���^7z �؉�: %Dir7z%
set Language_choose1= �n1. ����]       [L1J-TW_ver.%Var%_FP.7z]
set Language_choose2= �n2. ���]       [L1J-TW_ver.%Var%_NP.7z]
set Language_choose9= �n9. �Å{
set Language_Action=�u��G
goto Start

:en
set Language_Line11= Version is: %Var%
set Language_Line12= 7z install: %Dir7z%
set Language_choose1= �n1. FullPack     [L1J-TW_ver.%Var%_FP.7z]
set Language_choose2= �n2. normalPack   [L1J-TW_ver.%Var%_NP.7z]
set Language_choose9= �n9. Exit
set Language_Action=Actions�G
goto Start

Rem --------------------------------------------------------------------------------------------
REM -   �ʧ@�w�q
Rem --------------------------------------------------------------------------------------------
:Select1
title Building File about L1J-TW_ver.%Var%_FP.7z
@%Dir7z% a -tzip ..\..\..\L1J-TW_ver.%Var%_FP.7z ..\..\* -r -x@Fullpack\Exclusion.lst -mx=9
goto exit

:Select2
title Building File about  L1J-TW_ver.%Var%_NP.7z
@%Dir7z% a -tzip ..\..\..\L1J-TW_ver.%Var%_NP.7z -r @normalpack\Pack.lst -x@normalpack\Exclusion.lst -mx=9
goto exit

:Select9
cls
exit
