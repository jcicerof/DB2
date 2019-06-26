//SDB8JJCL  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010000
//*-------------------------------------------------------------------  00020000
//* CRIA OS JCL DE DSN1COPY A PARTIR DOS IMAGE COPY                     00030001
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
   'EXEC PROC=RECBKP,SS='||SUBSTR(STRIP(DBNAME), 1, 2)||                00300001
   ',TS='||STRIP(NAME)||',DT=&DT,', 80),                                00310001
   SUBSTR(STRIP(DBNAME), 1, 2), NAME, 1                                 00320001
  FROM SYSIBM.SYSTABLESPACE                                             00330001
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00340001
UNION ALL                                                               00350001
SELECT CHAR('//           '||                                           00360001
   'XLAT='||''''||                                                      00370001
   CASE                                                                 00380001
     WHEN PARTITIONS > 0 THEN ',NUMPARTS('||STRIP(CHAR(PARTITIONS))||')'00390001
     ELSE ''                                                            00400001
   END                                                                  00410001
   ||                                                                   00420001
   CASE                                                                 00430001
     WHEN DSSIZE = 2097152 THEN ',DSSIZE(2G)'                           00440001
     WHEN DSSIZE = 4194304 THEN ',DSSIZE(4G)'                           00450001
     WHEN DSSIZE = 8388608 THEN ',DSSIZE(8G)'                           00460001
     WHEN DSSIZE = 16777216 THEN ',DSSIZE(16G)'                         00470001
     ELSE ''                                                            00480001
   END                                                                  00490001
   ||                                                                   00500001
   CASE                                                                 00510001
     WHEN PGSIZE = 4 THEN ',PAGESIZE(4K)'                               00520001
     WHEN PGSIZE = 8 THEN ',PAGESIZE(8K)'                               00530001
     WHEN PGSIZE = 16 THEN ',PAGESIZE(16K)'                             00540001
     WHEN PGSIZE = 32 THEN ',PAGESIZE(32K)'                             00550001
     ELSE ''                                                            00560001
   END                                                                  00570001
   ||'''', 80)                                                          00580001
  ,SUBSTR(STRIP(DBNAME), 1, 2), NAME, 2                                 00590001
  FROM SYSIBM.SYSTABLESPACE                                             00600001
 WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                             00610001
 ORDER BY 3, 4                                                          00620001
;                                                                       00630001
//*-------------------------------------------------------------------  00640000
//*                                                                     00650000
//*-------------------------------------------------------------------  00660000
//GENJCL   EXEC PGM=IKJEFT1A,DYNAMNBR=200                               00670000
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00680000
//SYSPRINT DD   SYSOUT=*                                                00690000
//SYSTSPRT DD   SYSOUT=*                                                00700000
//SYSTSIN  DD   *                                                       00710000
%RXJCL2                                                                 00720001
//INFILE   DD   DSN=&&COPY,DISP=OLD                                     00730000
