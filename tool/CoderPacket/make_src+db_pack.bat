@echo off & color 02
cls
@set Var=%DATE%
@set Selected=2
@set Disk=F
goto Lang

################
#   �y�t���
################
:Lang
@set Language=en
set /p Language="Choose Systems Language (en/cn/tw) ? "
goto %Language%


################
#  �D�t�ο��
################
:Start
echo.
set /p Var="%Language_Line11%"
echo.
set /p Disk="%Language_Line12%"
echo.
echo %Language_choose1%
echo %Language_choose2%
echo %Language_choose9%
echo.
set /p Selected="%Language_Action%"
goto Select%Selected%


################
#   �y���Ҳ�
################
:tw
set Language_Line11= �����s�� ? 
set Language_Line12= �����Y�n��7z �Ҧw�˪��ڥؿ� (C or D or E ...)
set Language_choose1= �n1. ����]       [L1J-TW_ver.XXX_FP.7z]
set Language_choose2= �n2. Src+DB�зǥ] [L1J-TW_ver.XXX_NP.7z]
set Language_choose9= �n9. ���}
set Language_Action=��ܡG
goto Start

:cn
set Language_Line11= �����C�A ? 
set Language_Line12= �щ͊D���^7z �Ҧw�E���ڥ؉� (C or D or E ...)
set Language_choose1= �n1. ����]       [L1J-TW_ver.XXX_FP.7z]
set Language_choose2= �n2. ���]       [L1J-TW_ver.XXX_NP.7z]
set Language_choose9= �n9. �Å{
set Language_Action=�u��G
goto Start

:en
set Language_Line11= Version is ? 
set Language_Line12= Which Disk did 7z install for (C or D or E ...)
set Language_choose1= �n1. FullPack     [L1J-TW_ver.XXX_FP.7z]
set Language_choose2= �n2. normalPack   [L1J-TW_ver.XXX_NP.7z]
set Language_choose9= �n9. Exit
set Language_Action=Actions�G
goto Start

:Select1
@%Disk%:\"Program Files"\7-Zip\7z.exe a -tzip ..\..\..\L1J-TW_ver.%Var%_FP.7z ..\..\* -r -x@Fullpack\Exclusion.lst -mx=9
goto exit

:Select2
@%Disk%:\"Program Files"\7-Zip\7z.exe a -tzip ..\..\..\L1J-TW_ver.%Var%_NP.7z -r @normalpack\Pack.lst -x@normalpack\Exclusion.lst -mx=9
goto exit

:exit
cls
exit
