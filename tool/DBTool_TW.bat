@echo off & color 02
goto options0
:options0
set options=0
cls
echo ��--------------------------------------------------��
echo ��  DB���]�u�� - �ھ� ����/�y�t �ץX��������@�ɮ�  ��
echo ��--------------------------------------------------��
echo.
echo �n1. �s�@(�骩)�y�t      [l1jdb_jp.sql]
echo �n2. �s�@(�x��)�y�t      [l1jdb_tw.sql + l1jdb_tw_custom.sql]
echo �n3. �s�@(�骩/�x��)�y�t [l1jdb_jp.sql + l1jdb_tw.sql]
echo �n4. ���}
echo.
set /p Options="�п�ܰʧ@: "
goto wherego

# ���]�骩
:options1
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
goto options0

# ���]�x��
:options2
copy ..\db\MyISAM_TW\*.sql l1jdb_tw.sql
copy ..\db\MyISAM_TW\Custom\*.sql l1jdb_tw_custom.sql
goto options0

# �������]
:options3
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
copy ..\db\MyISAM_TW\*.sql l1jdb_tw.sql
goto options0

:wherego
if %options% == 0 goto options0
if %options% == 1 goto options1
if %options% == 2 goto options2
if %options% == 3 goto options3
if %options% == 4 goto exit
goto options0

:exit
echo.
cls
