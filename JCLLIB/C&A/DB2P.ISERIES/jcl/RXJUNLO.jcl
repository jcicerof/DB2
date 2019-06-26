//SDBJUNLO  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010002
//*-------------------------------------------------------------------  00020000
//* CRIA MEMBROS CONTENDO A COPY DE TABLESPACES                         00030000
//* PROCESSO DE COPIA PARA O ISERIES                                    00040000
//*                                                                     00050000
//* AUTOR: JOSE CICERO                                                  00060000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00070000
//* DATA:  NOV/06                                                       00080001
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00110000
//         SET  REXXLIB=DB2P.ISERIES.REXX                               00120000
//*-------------------------------------------------------------------  00130000
//*    GERA COMANDOS DE COPY DB                                         00140000
//*-------------------------------------------------------------------  00150000
//SELECT   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00160000
//STEPLIB  DD   DSN=DB2.DSN610.SDSNEXIT,DISP=SHR                        00170001
//         DD   DSN=DB2.DSN610.SDSNLOAD,DISP=SHR                        00180001
//SYSTSPRT DD   SYSOUT=*                                                00190001
//SYSTSIN  DD   *                                                       00200001
 DSN SYSTEM(DB2P)                                                       00210000
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB61) PARMS('SQL') -                   00220000
      LIB('DB2.DSN610.RUNLIB.LOAD')                                     00230000
//SYSPRINT DD   SYSOUT=*                                                00240001
//SYSUDUMP DD   SYSOUT=*                                                00250001
//SYSPUNCH DD   DUMMY                                                   00260001
//SYSREC00 DD   DSN=&&UNLOAD,                                           00270002
//         UNIT=SYSDA,SPACE=(TRK,(100,100),RLSE),                       00280002
//         DISP=(,PASS,DELETE)                                          00290002
//*SYSREC00 DD SYSOUT=*                                                 00300002
//SYSIN    DD *                                                         00310000
SELECT                                                                  00320005
  CHAR('REORG TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME), 80),     00330005
       TSNAME, DBNAME, 1                                                00340005
  FROM SYSIBM.SYSTABLES                                                 00350005
 WHERE DBNAME = 'AISERIES'                                              00360005
   AND SUBSTR(TSNAME, 1, 2) NOT IN ('SY', 'ZZ', 'SU')                   00370005
UNION ALL                                                               00380005
SELECT                                                                  00390005
  CHAR(                                                                 00400005
  ' UNLOAD EXTERNAL FROM TABLE '||STRIP(CREATOR)||'.'||STRIP(NAME), 80),00410005
       TSNAME, DBNAME, 2                                                00420005
  FROM SYSIBM.SYSTABLES                                                 00430005
 WHERE DBNAME = 'AISERIES'                                              00440005
   AND SUBSTR(TSNAME, 1, 2) NOT IN ('SY', 'ZZ', 'SU')                   00450005
UNION ALL                                                               00460005
SELECT                                                                  00470005
  CHAR('REORG TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME), 80),     00480005
       TSNAME, DBNAME, 1                                                00490005
  FROM SYSIBM.SYSTABLES                                                 00500005
 WHERE DBNAME = 'AISERIES'                                              00510005
   AND TSNAME IN ('SU000T', 'SU001T', 'SU006T', 'SU008T')               00520005
UNION ALL                                                               00530005
SELECT                                                                  00540005
  CHAR(                                                                 00550005
  ' UNLOAD EXTERNAL FROM TABLE '||STRIP(CREATOR)||'.'||STRIP(NAME), 80),00560005
       TSNAME, DBNAME, 2                                                00570005
  FROM SYSIBM.SYSTABLES                                                 00580005
 WHERE DBNAME = 'AISERIES'                                              00590005
   AND TSNAME IN ('SU000T', 'SU001T', 'SU006T', 'SU008T')               00600005
ORDER BY 3, 2, 4                                                        00610005
;                                                                       00620005
//*-------------------------------------------------------------------  00630000
//*                                                                     00640000
//*-------------------------------------------------------------------  00650000
//UNLOAD   EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXUNLOAD UNLOAD'        00660001
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00670000
//SYSPRINT DD   SYSOUT=*                                                00680000
//SYSTSPRT DD   SYSOUT=*                                                00690000
//SYSTSIN  DD   DUMMY                                                   00700001
//INFILE   DD   DSN=&&UNLOAD,DISP=(OLD,DELETE,DELETE)                   00710006
