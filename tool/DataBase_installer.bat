@echo off
title L1JTW ²����Ʈw�פJ�u��

REM --------------------------------------------------------------------------------------------
REM �г]�w�H�U����Ʈw�]�w��,�èϥΥ��]�u��N��Ʈw���楴�]����.
REM --------------------------------------------------------------------------------------------
REM user=��Ʈw�b�� pass=��Ʈw�K�X db=��Ʈw�W�� host=��Ʈwip(�Y�ϥΥ����h�L���ܧ�)
set user=root
set pass=root
set db=l1jdb
set host=localhost
REM --------------------------------------------------------------------------------------------



REM --------------------------------------------------------------------------------------------
:installer
echo.
echo                       ** L1JTW - ��Ʈw�פJ�u�� **
echo.
echo.
echo.
echo �п�ܱz�n�ϥΪ��\��(�ϥΤ��e�Х��s��o���ɮרó]�w�n�������]�w��!).
echo.
echo �\��:
echo		�إ�L1JTW��Ʈw (m)	-   �Ы�m
echo		�פJL1JTW��Ʈw (f)	-   �Ы�f
echo		�פJ�ۭq��Ʈw (c)	-   �Ы�c
echo		���} (q)		-   �Ы�q
echo.
set installtype=x
set /p installtype=
if /i %installtype%==m goto make
if /i %installtype%==f goto full
if /i %installtype%==c goto custom
if /i %installtype%==q goto credits
goto installer
REM --------------------------------------------------------------------------------------------



REM --------------------------------------------------------------------------------------------
:make
cls
echo.
echo �إ�L1JTW��Ʈw(�Ĥ@���פJ�e�ϥ�) !
echo CLEANING                                                         �i�椤...
mysqladmin create -h %host% -u %user% --password=%pass% %db%
echo ��Ʈw�פJ���� !

goto installer
REM --------------------------------------------------------------------------------------------
:full
cls
echo.
echo �פJL1JTW��Ʈw(�Y���P�W�¸�Ʈw�N�|�Q�R��) !
echo CLEANING                                                         �i�椤...
mysql -h %host% -u %user% --password=%pass% -D %db% < l1jdb_tw.sql
echo ��Ʈw�פJ���� !

goto installer
REM --------------------------------------------------------------------------------------------


REM --------------------------------------------------------------------------------------------
:custom
cls
echo.
echo �פJL1JTW�ۭq��Ʈw(�Y���P�W�¸�Ʈw�N�|�Q�R��) !
echo CLEANING                                                         �i�椤...
mysql -h %host% -u %user% --password=%pass% -D %db% < l1jdb_tw_custom.sql
echo �ۭq��Ʈw�פJ���� !

goto installer
REM --------------------------------------------------------------------------------------------



REM --------------------------------------------------------------------------------------------
:credits
echo.
echo.
echo.
echo L1JTW�Q�װ�: http://max-matrix.no-ip.com/l1jtw_bbs/
echo.
echo.
echo L1JTW �s�g
echo ���v�S���w���H�N�ϥ�.
echo.
pause
REM --------------------------------------------------------------------------------------------