@echo off
title L1J-TW Server Console
REM -------------------------------------
REM �򥻦��A���w�]�Ѽ�
java -Djava.util.logging.manager=net.l1j.L1LogManager -Xmx1024m -Xincgc -cp lib\*;l1jserver.jar net.l1j.Server
REM
REM �ڻ��|����n���Ѽ�
REM java -Djava.util.logging.manager=net.l1j.L1LogManager -Xmx512m -Xss1024K -XX:+UseConcMarkSweepGC -cp lib\*;l1jserver.jar net.l1j.Server
REM
REM �p�G�A�O�j�x�����A���M�\�h���O����A�i�H���դU�C�d�� (jdk\jre\bin�ؿ��U�i���client�Pserver�ؿ�,�ݱNserver�ƻs��jre��bin�ؿ��U��i����)
REM java -Djava.util.logging.manager=net.l1j.L1LogManager -server -Xmx1536m -Xms1024m -Xmn512m -XX:PermSize=256m -XX:SurvivorRatio=8 -Xnoclassgc -XX:+AggressiveOpts -cp lib\*;l1jserver.jar net.l1j.Server
REM -------------------------------------
pause
