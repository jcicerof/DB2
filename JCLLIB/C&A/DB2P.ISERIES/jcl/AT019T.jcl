//SDBAT019 JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID TYPRUN=SCAN  00010004
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)                          00020000
//*                                                                     00030000
//         SET XLAT=('OBIDXLAT,RESET,PAGESIZE(8K)'),                    00040007
//             LIB=DB2.DSN610,                                          00050000
//             DB=AT0BP,                                                00060001
//             TS=AT019T                                                00070001
//*                                                                     00080002
//JOBLIB   DD  DSN=&LIB..SDSNEXIT,DISP=SHR                              00090002
//         DD  DSN=&LIB..SDSNLOAD,DISP=SHR                              00100002
//*-------------------------------------------------------------------  00110000
//*    EXECUTA STOP DB                                                  00120000
//*-------------------------------------------------------------------  00130000
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00140005
//SYSTSPRT DD SYSOUT=*                                                  00150005
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                       00160005
//SYSPRINT DD SYSOUT=*                                                  00170005
//SYSUDUMP DD SYSOUT=*                                                  00180005
//*-------------------------------------------------------------------  00190000
//*    EXECUTA DSN1COPY                                                 00200000
//*-------------------------------------------------------------------  00210000
//SEGMNTO1 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00220000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00230000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00240000
//SYSPRINT DD SYSOUT=*                                                  00250000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A001,DISP=OLD             00260006
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00270006
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00280000
//*                                                                     00290000
//SEGMNTO2 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00300000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00310000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00320000
//SYSPRINT DD SYSOUT=*                                                  00330000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A002,DISP=OLD             00340006
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A002,DISP=OLD         00350006
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00360000
//*-------------------------------------------------------------------  00370000
//*    EXECUTA START DB                                                 00380000
//*-------------------------------------------------------------------  00390000
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00400005
//SYSTSPRT DD SYSOUT=*                                                  00410005
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      00420005
//SYSPRINT DD SYSOUT=*                                                  00430005
//SYSUDUMP DD SYSOUT=*                                                  00440005
