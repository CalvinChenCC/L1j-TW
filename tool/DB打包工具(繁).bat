@echo off & color 02
goto options0
:options0
set options=0
cls
echo ��------------------------------------------------��
echo �� DB���]�u�� - ��� ����/���� ���� �ץX��@�ɮ�. ��
echo ��------------------------------------------------��
echo �n1. �������]�� "L1jDB�W����].sql"
echo �n2. �̺������O�s�@�X L1jDB*.sql
echo �n3. �w��i��t��t�j�s�@�X "L1jDB��t��t�].sql"
echo �n4. �w��i�y���ץ��j�s�@�X "L1jDB�y���ץ��].sql"
echo �n5. �w��i��Ʒs�W�j�s�@�X "L1jDB��������].sql"
echo �n6. �w��i���~�ץ��j�s�@�X "L1jDB�x�W�ץ��].sql"
echo �n7. ���}.
echo.
set /p Options="Actions is :"
goto wherego

# �������]�b�@�_
:options1
copy  ..\db\MyISAM\*.sql + ..\db\Insert\*.sql + ..\db\Fix\*.sql + ..\db\Update\*.sql L1jDB�W���㥴�].sql
goto options0

# ���O���]
:options2
copy ..\db\MyISAM\*.sql L1jDB��t��t�].sql
copy ..\db\Update\*.sql L1jDB�y���ץ��].sql
copy ..\db\Insert\*.sql L1jDB���������.sql
copy ..\db\Fix\*.sql L1jDB�x�W�ϭץ�.sql
goto options0

# ���]��l��
:options3
copy ..\db\MyISAM\*.sql L1jDB��t��t�].sql
goto options0

# ���]�y�����D
:options4
copy ..\db\Update\*.sql L1jDB�y���ץ��].sql
goto options0

# ���]�s�W
:options5
copy ..\db\Insert\*.sql L1jDB���������.sql
goto options0

# ���]�ץ�
:options6
copy ..\db\Fix\*.sql L1jDB�x�W�ϭץ�.sql
goto options0

:wherego
if %options% == 0 goto options0
if %options% == 1 goto options1
if %options% == 2 goto options2
if %options% == 3 goto options3
if %options% == 4 goto options4
if %options% == 5 goto options5
if %options% == 6 goto options6
if %options% == 7 goto exit
goto options0

:exit
echo.
pause