@echo off

REM # ����o�ӽsĶ�{�����e�z�������w�˦njava #
REM # �аO�o���]�w�n�U������ӱz�ҩ�m�ɮת����| #
REM # ���|���Фŧt������ #

set antpath="E:\test\l1j-tw\l1jtw_quick_build\apache-ant-1.8.0\bin"
set l1jtwpath="E:\test\l1j-tw"

REM #############################

set ANT_BATCH_PAUSE=on

echo. .:: L1jtw �ֳt�sĶ ::.
echo.     ******************
echo.
echo.
echo. �аO�o��o���ɮ׫��k���s��,
echo. �ó]�w�n�z���ɮ׸��|
echo. �d��:
echo.
echo. set l1jtwpath="D:\�z��m\l1jtwsvn�����|\"
echo.
echo. �M��z�~��sĶ�z�����A��...
echo.
echo.
echo �z�i�H��ܥ\��:
echo * build = compile L1jtw Server
echo * clean = clean L1jtw Server
echo * quit   = exit the program
echo.

:askfirst
set promptfirst=x
set /p promptfirst=Please make a Choice: 
if /i %promptfirst%==build goto build
if /i %promptfirst%==clean goto cls
if /i %promptfirst%==quit goto end
goto askfirst

:build
cd %l1jtwpath%
%antpath%/ant
pause

:cls
cd %l1jtwpath%
%antpath%/ant clean
pause

:end