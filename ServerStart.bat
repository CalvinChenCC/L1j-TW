@echo off
title L1J-TW Server Console
REM -------------------------------------
REM �򥻦��A���w�]�Ѽ�
java -Xmx1024m -Xincgc -cp l1jserver.jar;lib\c3p0-0.9.1.2.jar;lib\log4j-1.2.15.jar;lib\mysql-connector-java-5.1.8-bin.jar;lib\javolution-5.3.1.jar l1j.server.Server
REM
REM �ڻ��|����n���Ѽ�
REM java -Xmx512m -Xss1024K -XX:+UseConcMarkSweepGC -cp l1jserver.jar;lib\c3p0-0.9.1.2.jar;lib\log4j-1.2.15.jar;lib\mysql-connector-java-5.1.8-bin.jar;lib\javolution-5.3.1.jar l1j.server.Server
REM
REM �p�G�A�O�j�x�����A���M�\�h���O����A�i�H���դU�C�d��
REM java -server -Xmx1536m -Xms1024m -Xmn512m -XX:PermSize=256m -XX:SurvivorRatio=8 -Xnoclassgc -XX:+AggressiveOpts -cp l1jserver.jar;lib\c3p0-0.9.1.2.jar;lib\log4j-1.2.15.jar;lib\mysql-connector-java-5.1.8-bin.jar;lib\javolution-5.3.1.jar l1j.server.Server
REM -------------------------------------
pause
