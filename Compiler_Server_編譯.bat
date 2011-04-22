@echo off

REM # ����o�ӽsĶ�{�����e�z�������w�˦njava #
REM # ���|���Фŧt������                     #

set l1jtwpath=%cd%
set antpath="%l1jtwpath%\tool\l1jtw_quick_build\apache-ant-1.8.2\bin"

REM ##########################################
set ANT_BATCH_PAUSE=on
echo.
echo.
echo.
echo.
echo.         ....:: L1jtw �ֳt�sĶ ::....   
echo. ��*********��*******************************��
echo. ��         �x       L1j-TW �� Server        ��
echo. ��*********�q*******************************��
echo. ��  �� �|  �x%l1jtwpath%
echo. ��*********��*******************************��
echo. ��  �� ��  �x         �\ ��  �� ��          ��
echo. ��*********�q*******************************��
echo. ��  build  �x  �sĶ�G l1jserver.jar         ��
echo. ��  start  �x  �ҰʡG l1jserver.jar         ��
echo. ��  quit   �x  ���}�G �ֳt�sĶ�t��          ��
echo. ��*********��*******************************��

:askfirst
set promptfirst=x
set /p promptfirst="�п�J���O�G"
if /i %promptfirst%==build goto build
if /i %promptfirst%==start goto start
if /i %promptfirst%==quit goto end
goto askfirst

REM ##########################################
:build
cd %l1jtwpath%
%antpath%/ant

REM ##########################################
:start
title L1J-TW Server Console
REM -------------------------------------
REM �򥻦��A���w�]�Ѽ�
java -Djava.util.logging.manager=net.l1j.L1LogManager -Xmx1024m -Xincgc -cp ./lib/*;l1jserver.jar net.l1j.server.GameServer
cls

REM ##########################################
:end