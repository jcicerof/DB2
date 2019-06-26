//SDB8JJCL  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010000
//*-------------------------------------------------------------------  00020000
//* CRIA MEMBROS CONTENDO O LOAD DE TABLESPACES                         00030000
//* PROCESSO DE COPIA PARA O ISERIES                                    00040000
//*                                                                     00050000
//* AUTOR: JOSE CICERO                                                  00060000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00070000
//* DATA:  NOV/06                                                       00080000
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00110000
//         SET  REXXLIB=DB2P.ISERIES.REXX                               00120000
//*-------------------------------------------------------------------  00130000
//*    GERA COMANDOS DE COPY DB                                         00140000
//*-------------------------------------------------------------------  00150000
//SELECT   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00160000
//SYSTSPRT DD  SYSOUT=*                                                 00170000
//SYSTSIN  DD  *                                                        00180000
 DSN SYSTEM(DB2P)                                                       00190000
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB61) PARMS('SQL') -                   00200000
      LIB('DB2.DSN610.RUNLIB.LOAD')                                     00210000
//SYSPRINT DD SYSOUT=*                                                  00220000
//SYSUDUMP DD SYSOUT=*                                                  00230000
//SYSPUNCH DD DUMMY                                                     00240000
//SYSREC00 DD DSN=&&COPY,                                               00250000
//         UNIT=SYSDA,SPACE=(TRK,(100,100),RLSE),                       00260000
//         DISP=(,PASS,DELETE)                                          00270000
//SYSIN    DD *                                                         00280000
SELECT CHAR(                                                            00290004
       'CHECK DATA TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||      00300004
       ' SCOPE ALL AUXERROR REPORT', 80), NAME                          00310004
  FROM SYSIBM.SYSTABLESPACE                                             00320004
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00330004
   AND SUBSTR(DBNAME, 1, 2) NOT IN ('SU', 'SY', 'ZZ')                   00340004
   AND SUBSTR(NAME, 1, 2) NOT IN ('SU', 'SY', 'ZZ')                     00350004
UNION ALL                                                               00360004
SELECT CHAR(                                                            00370004
       'CHECK DATA TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||      00380004
       ' SCOPE ALL AUXERROR REPORT', 80), NAME                          00390004
  FROM SYSIBM.SYSTABLESPACE                                             00400004
 WHERE NAME IN ('SU000T', 'SU001T', 'SU006T', 'SU008T')                 00410004
   AND DBNAME <> 'AISERIES'                                             00420004
;                                                                       00430004
//*-------------------------------------------------------------------  00440000
//*                                                                     00450000
//*-------------------------------------------------------------------  00460000
//GENJCL   EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXCHKDTA'               00470002
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00480000
//SYSPRINT DD   SYSOUT=*                                                00490000
//SYSTSPRT DD   SYSOUT=*                                                00500000
//SYSTSIN  DD   DUMMY                                                   00510000
//INFILE   DD   DSN=&&COPY,DISP=OLD                                     00520000
