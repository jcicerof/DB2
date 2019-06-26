//SDB8DBID  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010006
//*-------------------------------------------------------------------  00020000
//* CRIA MEMBROS CONTENDO A TRANSLATE DA TABELAS DB2 PARA SEREM USADAS  00030000
//* DURANTE O PROCESSO DE COPIA PARA O ISERIES                          00040000
//*                                                                     00050000
//* AUTOR: JOSE CICERO                                                  00060000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00070000
//* DATA:  JUN/06                                                       00080000
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00110002
//         SET  REXXLIB=DB2P.ISERIES.REXX                               00120002
//*-------------------------------------------------------------------  00130002
//*    DSNTIAUL                                                         00140002
//*-------------------------------------------------------------------  00150002
//DSNSTOP  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00160002
//SYSTSPRT DD  SYSOUT=*                                                 00170002
//SYSTSIN  DD  *                                                        00180002
 DSN SYSTEM(DB2P)                                                       00190002
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB61) PARMS('SQL') -                   00200002
      LIB('DB2.DSN610.RUNLIB.LOAD')                                     00210002
//SYSPRINT DD SYSOUT=*                                                  00220002
//SYSUDUMP DD SYSOUT=*                                                  00230002
//SYSPUNCH DD DUMMY                                                     00240002
//SYSREC00 DD DSN=&&XLAT,                                               00250004
//         UNIT=SYSDA,SPACE=(TRK,(100,100),RLSE),                       00260002
//         DISP=(,PASS,DELETE)                                          00270002
//SYSIN    DD *                                                         00280002
SELECT CHAR(S.NAME, 8),                                                 00290003
       CHAR(STRIP(CHAR(S.DBID))||','||STRIP(CHAR(D.DBID)), 20), 1       00300003
  FROM SYSIBM.SYSTABLESPACE S                                           00310003
     , SYSIBM.SYSTABLESPACE D                                           00320003
 WHERE                                                                  00330003
       S.DBNAME <> 'AISERIES'  AND                                      00340003
       D.NAME = S.NAME       AND                                        00350003
       D.DBNAME = 'AISERIES'                                            00360003
UNION ALL                                                               00370003
SELECT CHAR(S.NAME, 8),                                                 00380003
       CHAR(STRIP(CHAR(S.PSID))||','||STRIP(CHAR(D.PSID)), 20), 2       00390003
  FROM SYSIBM.SYSTABLESPACE S                                           00400003
     , SYSIBM.SYSTABLESPACE D                                           00410003
 WHERE                                                                  00420003
       S.DBNAME <> 'AISERIES'  AND                                      00430003
       D.NAME = S.NAME       AND                                        00440003
       D.DBNAME = 'AISERIES'                                            00450003
UNION ALL                                                               00460003
SELECT CHAR(S.TSNAME, 8),                                               00470003
       CHAR(STRIP(CHAR(S.OBID))||','||STRIP(CHAR(D.OBID)), 20), 3       00480003
  FROM SYSIBM.SYSTABLES S                                               00490003
     , SYSIBM.SYSTABLES D                                               00500003
 WHERE                                                                  00510003
       S.CREATOR = 'PROD'   AND                                         00520003
       D.TSNAME = S.TSNAME  AND                                         00530003
       D.CREATOR = 'SUPPROD'                                            00540003
UNION ALL                                                               00550003
SELECT CHAR(S.NAME, 8),                                                 00560003
       CHAR(STRIP(CHAR(S.DBID))||','||STRIP(CHAR(D.DBID)), 20), 1       00570003
  FROM SYSIBM.SYSINDEXES S                                              00580003
     , SYSIBM.SYSINDEXES D                                              00590003
 WHERE                                                                  00600003
       S.CREATOR = 'PROD'                                               00610003
   AND LENGTH(S.NAME) = 6                                               00620003
   AND D.NAME = SUBSTR(S.NAME, 1, 2)||'9'||SUBSTR(S.NAME, 4, 2)||'T'    00630003
   AND D.CREATOR = 'SUPPROD'                                            00640003
UNION ALL                                                               00650003
SELECT CHAR(S.NAME, 8),                                                 00660003
       CHAR(STRIP(CHAR(S.ISOBID))||','||STRIP(CHAR(D.ISOBID)), 20), 2   00670003
  FROM SYSIBM.SYSINDEXES S                                              00680003
     , SYSIBM.SYSINDEXES D                                              00690003
 WHERE                                                                  00700003
       S.CREATOR = 'PROD'                                               00710003
   AND LENGTH(S.NAME) = 6                                               00720003
   AND D.NAME = SUBSTR(S.NAME, 1, 2)||'9'||SUBSTR(S.NAME, 4, 2)||'T'    00730003
   AND D.CREATOR = 'SUPPROD'                                            00740003
UNION ALL                                                               00750003
SELECT CHAR(S.NAME, 8),                                                 00760003
       CHAR(STRIP(CHAR(S.OBID))||','||STRIP(CHAR(D.OBID)), 20), 3       00770003
  FROM SYSIBM.SYSINDEXES S                                              00780003
     , SYSIBM.SYSINDEXES D                                              00790003
 WHERE                                                                  00800003
       S.CREATOR = 'PROD'                                               00810003
   AND LENGTH(S.NAME) = 6                                               00820003
   AND D.NAME = SUBSTR(S.NAME, 1, 2)||'9'||SUBSTR(S.NAME, 4, 2)||'T'    00830003
   AND D.CREATOR = 'SUPPROD'                                            00840003
ORDER BY 1, 3                                                           00850003
WITH UR;                                                                00860002
//*-------------------------------------------------------------------  00870002
//*                                                                     00880002
//*-------------------------------------------------------------------  00890002
//CALLREXX EXEC PGM=IKJEFT1A,DYNAMNBR=200                               00900000
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00910000
//SYSPRINT DD   SYSOUT=*                                                00920000
//SYSTSPRT DD   SYSOUT=*                                                00930000
//SYSTSIN  DD   *                                                       00940000
%RXDBID                                                                 00950001
//INFILE   DD   DSN=&&XLAT,DISP=OLD                                     00960002
/*EOF                                                                   00970000
//* INFILE   DD DSN=USERID.MY.INPUT,DISP=SHR                            00980000
//* OUTFILE  DD SYSOUT=*                                                00990000
PROFILE PREFIX(USERID) /* PLEASE USE THIS,*/                            01000000
                       /* SPECIFYING YOUR USERID*/                      01010000
%MYREXX                                                                 01020000
