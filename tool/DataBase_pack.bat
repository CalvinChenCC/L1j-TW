@echo off & color 02
REM --------------------------------------------------------------------------------------------
REM 請設定以下的定值,讓打包完成.
REM --------------------------------------------------------------------------------------------
REM Language=tw：選擇對應語系en/cn/tw 
REM --------------------------------------------------------------------------------------------
set Language=tw
goto Base

Rem --------------------------------------------------------------------------------------------
Rem -   基本執行
Rem --------------------------------------------------------------------------------------------
:Base
goto %Language%
REM --------------------------------------------------------------------------------------------



REM --------------------------------------------------------------------------------------------
REM -   主系統選單
REM --------------------------------------------------------------------------------------------
:Start
set Selected=9
cls
echo ★--%Language_title1%--★
echo ★  %Language_title2%  ★
echo ★--%Language_title3%--★
echo.
echo %Language_choose1%
echo %Language_choose2%
echo %Language_choose3%
echo %Language_choose4%
echo.
set /p Selected="%Language_Action%"
echo Select%Selected%
goto Select%Selected%
REM --------------------------------------------------------------------------------------------



REM --------------------------------------------------------------------------------------------
REM -   語言模組
REM --------------------------------------------------------------------------------------------
:tw
set Language_title1=----------------------------------------------
set Language_title2=DB打包工具 - 根據 全部/語系 匯出種類的單一檔案
set Language_title3=----------------------------------------------
set Language_choose1= 》1. 製作(日版)語系      [l1jdb_jp.sql]
set Language_choose2= 》2. 製作(台版)語系      [l1jdb_tw.sql + l1jdb_tw_custom.sql]
set Language_choose3= 》3. 製作(日版/台版)語系 [l1jdb_jp.sql + l1jdb_tw.sql]
set Language_choose4= 》9. 離開
set Language_Action=選擇：
goto Start 

:cn
set Language_title1=-------------------------------------------
set Language_title2=DB打包工具- 根据全部/�N系�馴X种�搌��豸@�蒡�
set Language_title3=-------------------------------------------
set Language_choose1= 》1. 制作(日版)�N系[l1jdb_jp.sql]
set Language_choose2= 》2. 制作(台版)�N系[l1jdb_tw.sql + l1jdb_tw_custom.sql]
set Language_choose3= 》3. 制作(日版/台版)�N系[l1jdb_jp.sql + l1jdb_tw.sql]
set Language_choose4= 》9. 离�{
set Language_Action=�u�寣G
goto Start

:en
set Language_title1=-------------------------------
set Language_title2=Output In One File System Of DB
set Language_title3=-------------------------------
set Language_choose1= 》1. MyISAM Files         [l1jdb_jp.sql]
set Language_choose2= 》2. InnoDB_TW Files      [l1jdb_tw.sql + l1jdb_tw_custom.sql]
set Language_choose3= 》3. All In Default Files [l1jdb_jp.sql + l1jdb_tw.sql]
set Language_choose4= 》9. Exit
set Language_Action=Actions：
goto Start
REM --------------------------------------------------------------------------------------------



REM --------------------------------------------------------------------------------------------
REM -   動作定義
REM --------------------------------------------------------------------------------------------
REM -   打包日版
:Select1
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
goto Start

REM -   打包台版
:Select2
copy ..\db\InnoDB_TW\*.sql l1jdb_tw.sql
copy ..\db\InnoDB_TW\Custom\*.sql l1jdb_tw_custom.sql
goto Start

REM -   分類打包
:Select3
copy ..\db\MyISAM\*.sql l1jdb_jp.sql
copy ..\db\InnoDB_TW\*.sql l1jdb_tw.sql
goto Start

REM -   離開
:Select9
exit