//SDBES007 JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID TYPRUN=SCAN  00010003
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)                          00020001
//*                                                                     00030001
//         SET XLAT=('OBIDXLAT,RESET,PAGESIZE(16K)'),                   00040005
//             LIB=DB2.DSN610,                                          00050001
//             DB=ES0BP,                                                00060001
//             TS=ES007T                                                00070001
//*                                                                     00080001
//JOBLIB   DD  DSN=&LIB..SDSNEXIT,DISP=SHR                              00090001
//         DD  DSN=&LIB..SDSNLOAD,DISP=SHR                              00100001
//*-------------------------------------------------------------------  00110001
//*    EXECUTA STOP DB                                                  00120001
//*-------------------------------------------------------------------  00130001
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00140004
//SYSTSPRT DD SYSOUT=*                                                  00150004
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                       00160004
//SYSPRINT DD SYSOUT=*                                                  00170004
//SYSUDUMP DD SYSOUT=*                                                  00180004
//*-------------------------------------------------------------------  00190001
//*    EXECUTA DSN1COPY                                                 00200001
//*-------------------------------------------------------------------  00210001
//SEGMNTO1 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00220001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00230001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00240001
//SYSPRINT DD SYSOUT=*                                                  00250001
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A001,DISP=OLD             00260004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00270004
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00280001
//*                                                                     00290001
//SEGMNTO2 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00300001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00310001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00320001
//SYSPRINT DD SYSOUT=*                                                  00330001
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A002,DISP=OLD             00340004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A002,DISP=OLD         00350004
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00360001
//*-------------------------------------------------------------------  00370001
//*    EXECUTA START DB                                                 00380001
//*-------------------------------------------------------------------  00390001
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00400004
//SYSTSPRT DD SYSOUT=*                                                  00410004
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      00420004
//SYSPRINT DD SYSOUT=*                                                  00430004
//SYSUDUMP DD SYSOUT=*                                                  00440004
