@echo off & color 02
goto options0
:options0
set options=0
cls
echo ��--------------------------------------------------��
echo ��  DB���]�u�� - �ھ� ����/�y�t �ץX��������@�ɮ�  ��
echo ��--------------------------------------------------��
echo.
echo �n1. �s�@�i�骩/�x���j "l1jdb_*.sql"
echo �n2. �s�@�i�骩�j�y�t  "l1jdb_jp.sql"
echo �n3. �s�@�i�x���j�y�t  "l1jdb_tw.sql"
echo �n4. ���}
echo.
set /p Options="�п�ܰʧ@ :"
goto wherego

# �������]
:options1
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
copy ..\db\MyISAM_TW\*.sql l1jdb_tw.sql
goto options0

# ���]�骩
:options2
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
goto options0

# ���]�x��
:options3
copy ..\db\MyISAM_TW\*.sql l1jdb_tw.sql
goto options0

:wherego
if %options% == 0 goto options0
if %options% == 1 goto options1
if %options% == 2 goto options2
if %options% == 3 goto options3
if %options% == 7 goto exit
goto options0

:exit
echo.
pause