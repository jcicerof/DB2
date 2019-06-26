//SDB8JJCL  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010003
//*-------------------------------------------------------------------  00020000
//* CRIA MEMBROS CONTENDO A COPY DE TABLESPACES                         00030000
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
SELECT CHAR('//'||CHAR(STRIP(NAME), 9)||                                00290001
   'EXEC PROC=COPY,SS='||SUBSTR(STRIP(DBNAME), 1, 2)||                  00300001
   ',TS='||STRIP(NAME)||',DT=&DT', 80),                                 00310001
   SUBSTR(STRIP(DBNAME), 1, 2), NAME                                    00320001
  FROM SYSIBM.SYSTABLESPACE                                             00330001
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00340001
 ORDER BY 2, 3                                                          00350001
;                                                                       00360001
//*-------------------------------------------------------------------  00370000
//*                                                                     00380000
//*-------------------------------------------------------------------  00390000
//GENJCL   EXEC PGM=IKJEFT1A,DYNAMNBR=200                               00400001
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00410000
//SYSPRINT DD   SYSOUT=*                                                00420000
//SYSTSPRT DD   SYSOUT=*                                                00430000
//SYSTSIN  DD   *                                                       00440000
%RXJCL                                                                  00450001
//INFILE   DD   DSN=&&COPY,DISP=OLD                                     00460000
