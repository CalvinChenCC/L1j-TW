@echo off & color 02
goto Lang

################
#   �y�t���
################
:Lang
set Language=en
set /p Language="Choose Systems Language (en/cn/tw)? "
goto %Language%


################
#  �D�t�ο��
################
:Start
set Selected=9
cls
echo ��--%Language_title1%--��
echo ��  %Language_title2%  ��
echo ��--%Language_title3%--��
echo.
echo %Language_choose1%
echo %Language_choose2%
echo %Language_choose3%
echo %Language_choose4%
echo.
set /p Selected="%Language_Action%"
echo Select%Selected%
goto Select%Selected%


################
#   �y���Ҳ�
################
:tw
set Language_title1=----------------------------------------------
set Language_title2=DB���]�u�� - �ھ� ����/�y�t �ץX��������@�ɮ�
set Language_title3=----------------------------------------------
set Language_choose1= �n1. �s�@(�骩)�y�t      [l1jdb_jp.sql]
set Language_choose2= �n2. �s�@(�x��)�y�t      [l1jdb_tw.sql + l1jdb_tw_custom.sql]
set Language_choose3= �n3. �s�@(�骩/�x��)�y�t [l1jdb_jp.sql + l1jdb_tw.sql]
set Language_choose4= �n9. ���}
set Language_Action=��ܡG
goto Start 

:cn
set Language_title1=-------------------------------------------
set Language_title2=DB���]�u��- ���u����/�N�t���X���ݪ��ˤ@���
set Language_title3=-------------------------------------------
set Language_choose1= �n1. ��@(�骩)�N�t[l1jdb_jp.sql]
set Language_choose2= �n2. ��@(�x��)�N�t[l1jdb_tw.sql + l1jdb_tw_custom.sql]
set Language_choose3= �n3. ��@(�骩/�x��)�N�t[l1jdb_jp.sql + l1jdb_tw.sql]
set Language_choose4= �n9. �Å{
set Language_Action=�u��G
goto Start

:en
set Language_title1=-------------------------------
set Language_title2=Output In One File System Of DB
set Language_title3=-------------------------------
set Language_choose1= �n1. MyISAM Files         [l1jdb_jp.sql]
set Language_choose2= �n2. InnoDB_TW Files      [l1jdb_tw.sql + l1jdb_tw_custom.sql]
set Language_choose3= �n3. All In Default Files [l1jdb_jp.sql + l1jdb_tw.sql]
set Language_choose4= �n9. Exit
set Language_Action=Actions�G
goto Start


################
#   ���]�Ҳ�
################
#	���]�骩
:Select1
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
goto Start

#	���]�x��
:Select2
copy ..\db\InnoDB_TW\*.sql l1jdb_tw.sql
copy ..\db\InnoDB_TW\Custom\*.sql l1jdb_tw_custom.sql
goto Start

#	�������]
:Select3
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
copy ..\db\InnoDB_TW\*.sql l1jdb_tw.sql
goto Start

#	���}
:Select9
exit