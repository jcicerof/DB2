//SDB8STST  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010015
//*-------------------------------------------------------------------  00020000
//* CRIA MEMBROS CONTENDO A STOP/START DE TABLESPACES                   00030001
//* PROCESSO DE COPIA PARA O ISERIES                                    00040001
//*                                                                     00050000
//* AUTOR: JOSE CICERO                                                  00060000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00070000
//* DATA:  JUN/06                                                       00080000
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00110004
//         SET  REXXLIB=DB2P.ISERIES.REXX                               00120000
//*-------------------------------------------------------------------  00130004
//*    GERA COMANDOS DE STOP DB                                         00140013
//*-------------------------------------------------------------------  00150004
//DSNSTOP  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00160004
//SYSTSPRT DD  SYSOUT=*                                                 00170004
//SYSTSIN  DD  *                                                        00180004
 DSN SYSTEM(DB2P)                                                       00190004
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB61) PARMS('SQL') -                   00200004
      LIB('DB2.DSN610.RUNLIB.LOAD')                                     00210004
//SYSPRINT DD SYSOUT=*                                                  00220004
//SYSUDUMP DD SYSOUT=*                                                  00230004
//SYSPUNCH DD DUMMY                                                     00240004
//SYSREC00 DD DSN=&&STOP,                                               00250006
//         UNIT=SYSDA,SPACE=(TRK,(100,100),RLSE),                       00260004
//         DISP=(,PASS,DELETE)                                          00270006
//SYSIN    DD *                                                         00280004
SELECT CHAR('DSN SYSTEM(DB2P)', 80), TSNAME, 1                          00290004
  FROM SYSIBM.SYSTABLES                                                 00300004
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00310012
UNION ALL                                                               00320004
SELECT CHAR(                                                            00330004
       '-STOP DB('||STRIP(DBNAME)||')    SPACE('||SUBSTR(TSNAME, 1, 5)||00340004
       '*)', 80), TSNAME, 2                                             00350005
  FROM SYSIBM.SYSTABLES                                                 00360004
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00370012
UNION ALL                                                               00380012
SELECT CHAR(                                                            00390004
       '-STOP DB(AISERIES) SPACE('||SUBSTR(TSNAME, 1, 5)||              00400004
       '*)', 80), TSNAME, 3                                             00410005
  FROM SYSIBM.SYSTABLES                                                 00420004
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00430012
UNION ALL                                                               00440004
SELECT CHAR('END', 80), TSNAME, 4                                       00450004
  FROM SYSIBM.SYSTABLES                                                 00460004
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00470012
ORDER BY 2, 3                                                           00480004
;                                                                       00490004
//*-------------------------------------------------------------------  00500004
//*                                                                     00510004
//*-------------------------------------------------------------------  00520004
//STOP     EXEC PGM=IKJEFT1A,DYNAMNBR=200                               00530003
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00540000
//SYSPRINT DD   SYSOUT=*                                                00550000
//SYSTSPRT DD   SYSOUT=*                                                00560000
//SYSTSIN  DD   *                                                       00570000
%RXSTST STOP                                                            00580002
//INFILE   DD   DSN=&&STOP,DISP=OLD                                     00590009
//*-------------------------------------------------------------------  00600006
//*    GERA COMANDOS DE START DB                                        00610013
//*-------------------------------------------------------------------  00620006
//DSNSTART EXEC PGM=IKJEFT01,DYNAMNBR=20                                00630006
//SYSTSPRT DD  SYSOUT=*                                                 00640006
//SYSTSIN  DD  *                                                        00650006
 DSN SYSTEM(DB2P)                                                       00660006
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB61) PARMS('SQL') -                   00670006
      LIB('DB2.DSN610.RUNLIB.LOAD')                                     00680006
//SYSPRINT DD SYSOUT=*                                                  00690006
//SYSUDUMP DD SYSOUT=*                                                  00700006
//SYSPUNCH DD DUMMY                                                     00710006
//SYSREC00 DD DSN=&&START,                                              00720006
//         UNIT=SYSDA,SPACE=(TRK,(100,100),RLSE),                       00730006
//         DISP=(,PASS,DELETE)                                          00740006
//SYSIN    DD *                                                         00750006
SELECT CHAR('DSN SYSTEM(DB2P)', 80), TSNAME, 1                          00760006
  FROM SYSIBM.SYSTABLES                                                 00770006
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00780012
UNION ALL                                                               00790006
SELECT CHAR(                                                            00800006
       '-START DB('||STRIP(DBNAME)||') SPACE('||SUBSTR(TSNAME, 1, 5)||  00810006
       '*) ACCESS(RW)', 80), TSNAME, 2                                  00820006
  FROM SYSIBM.SYSTABLES                                                 00830006
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00840012
UNION ALL                                                               00850012
SELECT CHAR(                                                            00860006
       '-START DB(AISERIES) SPACE('||SUBSTR(TSNAME, 1, 5)||             00870006
       '*) ACCESS(RW)', 80), TSNAME, 3                                  00880006
  FROM SYSIBM.SYSTABLES                                                 00890006
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00900012
UNION ALL                                                               00910006
SELECT CHAR('END', 80), TSNAME, 4                                       00920006
  FROM SYSIBM.SYSTABLES                                                 00930006
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00940012
ORDER BY 2, 3                                                           00950006
;                                                                       00960006
//*-------------------------------------------------------------------  00970004
//*                                                                     00980002
//*-------------------------------------------------------------------  00990004
//START    EXEC PGM=IKJEFT1A,DYNAMNBR=200                               01000003
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   01010002
//SYSPRINT DD   SYSOUT=*                                                01020002
//SYSTSPRT DD   SYSOUT=*                                                01030002
//SYSTSIN  DD   *                                                       01040002
%RXSTST START                                                           01050002
//INFILE   DD   DSN=&&START,DISP=OLD                                    01060009
/*EOF                                                                   01070000
//* INFILE   DD DSN=USERID.MY.INPUT,DISP=SHR                            01080000
//* OUTFILE  DD SYSOUT=*                                                01090000
PROFILE PREFIX(USERID) /* PLEASE USE THIS,*/                            01100000
                       /* SPECIFYING YOUR USERID*/                      01110000
%MYREXX                                                                 01120000
