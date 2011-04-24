@echo off

REM # ����o�ӽsĶ�{�����e�z�������w�˦njava #
REM �]�w��
set l1jtwpath=%cd%
set antpath="%l1jtwpath%\tool\l1jtw_quick_build\apache-ant-1.8.2\bin\ant"

REM �򥻤��
echo.
echo. �i�Ũ��j
echo.      ���u��ȱ��˵����R�yDOS Command Line�z���ާ@�A
echo.  �H�μ��R�ϥΡy���O���z�@���}�o�u�㪺�ϥΪ̡C
echo.      �p�G�z�w�g���D�Ϊ��ϧΤƾ�X�}�o���ҡA���{��
echo.  �i��@�L�ΪZ���a�C

:main
REM ##############################################
REM �D���
set ANT_BATCH_PAUSE=on
echo.
echo. ��*********��********************************��
echo. ��         �x�����L1j-TW �� Server�������
echo. ��*********��********************************��
echo. ��  �� �|  �x %l1jtwpath%
echo. ��*********��********************************��
echo. ��  �� ��  �x����� �\  ��  ��  �� �������
echo. ��*********�q********************************��
echo. ��  build  �x �sĶ l1jserver.jar (�w�]�Ҧ�)  ��
echo. ��  print  �x ��� �̫�@�����sĶ����        ��
echo. ��  open   �x �}�� �ϥΥ~���{�Ƕ}�Ҭ���      ��
echo. ��  start  �x �Ұ� l1jserver.jar             ��
echo. ��  clear  �x ��s ���b���e��                ��
echo. ��  quit   �x ���} �ֳt�sĶ�t��              ��
echo. ��*********��********************************��
echo.
echo. �п�J�y���O�z

:askfirst
set promptfirst=x
set /p promptfirst=">> "
if /i %promptfirst%==build goto build
if /i %promptfirst%==print goto print
if /i %promptfirst%==open goto open
if /i %promptfirst%==start goto start
if /i %promptfirst%==clear goto clear
if /i %promptfirst%==quit goto end
goto askfirst

REM ##############################################
REM �sĶ
:build
%antpath% > %l1jtwpath%\log\CompilerLog.txt

REM ##############################################
REM ��¦L�X �sĶ�ɲ���Log
:print
more %l1jtwpath%\log\CompilerLog.txt
pause
goto main

REM ##############################################
REM �ϥΥ~���{�Ƕ}�� �sĶ�ɲ���Log
:open
%l1jtwpath%\log\CompilerLog.txt
goto main

REM ##############################################
REM �B�� l1jserver.jar
:start
title L1J-TW Server Console
cls
REM �򥻦��A���w�]�Ѽ�
java -Djava.util.logging.manager=net.l1j.L1LogManager -Xmx1024m -Xincgc -cp ./lib/*;l1jserver.jar net.l1j.server.GameServer
goto end

REM ##############################################
REM �M���e��
:clear
cls
goto main

REM ##########################################
REM �����{��
:end
cls