@echo off

REM # ����o�ӽsĶ�{�����e�z�������w�˦njava #
REM �]�w��
set l1jtwpath=%cd%
set buiderpath=%l1jtwpath%\tool\l1jtw_quick_build
set logpath=%l1jtwpath%\log\CompilerLog.txt


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
REM set ANT_BATCH_PAUSE=on
echo.
echo. ��*********��********************************��
echo. ��         �x�����L1j-TW �� Server�������
echo. ��*********��********************************��
echo. ��  �� �|  �x %l1jtwpath%
echo. ��*********��********************************��
echo. ��  �� ��  �x����� �\  ��  ��  �� �������
echo. ��*********�q********************************��
echo. ��  build  �x �sĶ l1jserver.jar (�w�]�Ҧ�)  ��
echo. ��  start  �x �Ұ� l1jserver.jar             ��
echo. ��  config �x �]�w ���A���ﶵ    (�ϧΤ���)  ��
echo. ��  clear  �x ��s ���b���e��                ��
echo. ��  quit   �x ���} ���t��                  ��
echo. ��*********��********************************��
echo.
echo. �п�J�y���O�z

:askfirst
set promptfirst=x
set /p promptfirst=">> "
if /i %promptfirst%==build goto build
if /i %promptfirst%==start goto start
if /i %promptfirst%==config goto config
if /i %promptfirst%==clear goto clear
if /i %promptfirst%==quit goto end
goto askfirst

REM ##############################################
REM �sĶ
:build
call %buiderpath%\Compiler.bat
goto main

REM ##############################################
REM �B�� l1jserver.jar
:start
call %l1jtwpath%\ServerStart.bat
goto main

REM ##############################################
REM �]�w ���A���ﶵ
:config
call %l1jtwpath%\ServerConfig.bat
goto main

REM ##############################################
REM �M���e��
:clear
cls
goto main

REM ##########################################
REM �����{��
:end
cls