@echo off & color 02
goto options0
:options0
set options=0
cls
echo ###################################
echo # Output In One File System Of DB #
echo ###################################
echo Options	1. All In One File
echo	2. All In Default Files
echo	3. MyISAM Files Only
echo	4. Update Files Only
echo	5. Insert Files Only
echo	6. Fix Files Only
echo	7. Out System
echo.
set /p Options="Actions is :"
goto wherego

# �������]�b�@�_
:options1
copy /B ..\db\MyISAM\*.sql + ..\db\Insert\*.sql + ..\db\Fix\*.sql + ..\db\Update\*.sql All_In_One_L1jDB.sql
goto options0

# ���O���]
:options2
copy /B ..\db\MyISAM\*.sql Only_From_JP_L1jDB.sql
copy /B ..\db\Update\*.sql Language_Update_L1jDB.sql
copy /B ..\db\Insert\*.sql Insert_L1jDB.sql
copy /B ..\db\Fix\*.sql Fix_L1jDB.sql
goto options0

# ���]��l��
:options3
copy /B ..\db\MyISAM\*.sql Only_From_JP_L1jDB.sql
goto options0

# ���]�y�����D
:options4
copy /B ..\db\Update\*.sql Language_Update_L1jDB.sql
goto options0

# ���]�s�W
:options5
copy /B ..\db\Insert\*.sql Insert_L1jDB.sql
goto options0

# ���]�ץ�
:options6
copy /B ..\db\Fix\*.sql Fix_L1jDB.sql
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