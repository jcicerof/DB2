//SDBJCOPY  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID             00010012
//*-------------------------------------------------------------------  00020000
//* CRIA MEMBROS CONTENDO A COPY DE TABLESPACES                         00030004
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
//*    GERA COMANDOS DE COPY DB                                         00140007
//*-------------------------------------------------------------------  00150000
//SELECT   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00160007
//SYSTSPRT DD  SYSOUT=*                                                 00170000
//SYSTSIN  DD  *                                                        00180000
 DSN SYSTEM(DB2P)                                                       00190000
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB61) PARMS('SQL') -                   00200000
      LIB('DB2.DSN610.RUNLIB.LOAD')                                     00210000
//SYSPRINT DD SYSOUT=*                                                  00220000
//SYSUDUMP DD SYSOUT=*                                                  00230000
//SYSPUNCH DD DUMMY                                                     00240000
//SYSREC00 DD DSN=&&COPY,                                               00250008
//         UNIT=SYSDA,SPACE=(TRK,(100,100),RLSE),                       00260008
//         DISP=(,PASS,DELETE)                                          00270008
//*SYSREC00 DD SYSOUT=*                                                 00280008
//SYSIN    DD *                                                         00290000
  SELECT CHAR('COPY TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||     00300002
         ' SHRLEVEL REFERENCE FULL YES', 80), CHAR(NAME, 8)             00310009
    FROM SYSIBM.SYSTABLESPACE                                           00320002
   WHERE SUBSTR(DBNAME, 4, 2) IN ('BP', 'BD')                           00330002
 UNION                                                                  00340002
 SELECT CHAR('COPY INDEX '||STRIP(IP.IXCREATOR)||'.'||STRIP(IP.IXNAME)||00350002
         ' SHRLEVEL REFERENCE FULL YES', 80), CHAR(IX.INDEXSPACE, 8)    00360009
    FROM SYSIBM.SYSINDEXPART IP,                                        00370002
         SYSIBM.SYSINDEXES   IX                                         00380002
   WHERE IP.PARTITION = 1                                               00390002
     AND SUBSTR(IX.DBNAME, 4, 2) IN ('BP', 'BD')                        00400002
     AND IP.IXNAME = IX.NAME                                            00410002
     AND IP.IXCREATOR = IX.CREATOR                                      00420002
;                                                                       00430002
//*-------------------------------------------------------------------  00440000
//*                                                                     00450000
//*-------------------------------------------------------------------  00460000
//COPY     EXEC PGM=IKJEFT1A,DYNAMNBR=200                               00470004
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00480000
//SYSPRINT DD   SYSOUT=*                                                00490000
//SYSTSPRT DD   SYSOUT=*                                                00500000
//SYSTSIN  DD   *                                                       00510000
%RXCOPY COPY                                                            00520008
//INFILE   DD   DSN=&&COPY,DISP=OLD                                     00530004
