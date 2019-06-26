//SDB8STUT  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010003
//*-------------------------------------------------------------------  00020000
//* CRIA MEMBROS CONTENDO START UT DE TABLESPACES                       00030001
//* PROCESSO DE COPIA PARA O ISERIES                                    00040000
//*                                                                     00050000
//* AUTOR: JOSE CICERO                                                  00060000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00070000
//* DATA:  JUN/06                                                       00080000
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00110000
//         SET  REXXLIB=DB2P.ISERIES.REXX                               00120000
//*-------------------------------------------------------------------  00130000
//*    GERA COMANDOS DE STOP DB                                         00140000
//*-------------------------------------------------------------------  00150000
//DSNSTOP  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00160000
//SYSTSPRT DD  SYSOUT=*                                                 00170000
//SYSTSIN  DD  *                                                        00180000
 DSN SYSTEM(DB2P)                                                       00190000
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB61) PARMS('SQL') -                   00200000
      LIB('DB2.DSN610.RUNLIB.LOAD')                                     00210000
//SYSPRINT DD SYSOUT=*                                                  00220000
//SYSUDUMP DD SYSOUT=*                                                  00230000
//SYSPUNCH DD DUMMY                                                     00240000
//SYSREC00 DD DSN=&&STOP,                                               00250000
//         UNIT=SYSDA,SPACE=(TRK,(100,100),RLSE),                       00260000
//         DISP=(,PASS,DELETE)                                          00270000
//SYSIN    DD *                                                         00280000
SELECT CHAR('DSN SYSTEM(DB2P)', 80), TSNAME, 1                          00290000
  FROM SYSIBM.SYSTABLES                                                 00300000
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00310000
UNION ALL                                                               00320000
SELECT CHAR(                                                            00330000
       '-STOP DB('||STRIP(DBNAME)||') SPACE('||SUBSTR(TSNAME, 1, 5)||   00340001
       '*)', 80), TSNAME, 2                                             00350000
  FROM SYSIBM.SYSTABLES                                                 00360000
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00370000
UNION ALL                                                               00380000
SELECT CHAR(                                                            00390001
       '-START DB('||STRIP(DBNAME)||') SPACE('||SUBSTR(TSNAME, 1, 5)||  00400001
       '*) ACC(UT)', 80), TSNAME, 3                                     00410001
  FROM SYSIBM.SYSTABLES                                                 00420000
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00430000
UNION ALL                                                               00440000
SELECT CHAR('END', 80), TSNAME, 4                                       00450000
  FROM SYSIBM.SYSTABLES                                                 00460000
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00470000
ORDER BY 2, 3                                                           00480000
;                                                                       00490000
//*-------------------------------------------------------------------  00500000
//*                                                                     00510000
//*-------------------------------------------------------------------  00520000
//STARTUT  EXEC PGM=IKJEFT1A,DYNAMNBR=200                               00530001
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00540000
//SYSPRINT DD   SYSOUT=*                                                00550000
//SYSTSPRT DD   SYSOUT=*                                                00560000
//SYSTSIN  DD   *                                                       00570000
%RXSTST STARTUT                                                         00580001
//INFILE   DD   DSN=&&STOP,DISP=OLD                                     00590000
