//SDBEQ003 JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID TYPRUN=SCAN  00010005
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)                          00020000
//*                                                                     00030002
//         SET XLAT=('OBIDXLAT,RESET,PAGESIZE(4K)'),                    00040008
//             LIB=DB2.DSN610,                                          00050001
//             DB=EQ0BP,                                                00060002
//             TS=EQ003T                                                00070002
//*                                                                     00080003
//JOBLIB   DD  DSN=&LIB..SDSNEXIT,DISP=SHR                              00090003
//         DD  DSN=&LIB..SDSNLOAD,DISP=SHR                              00100003
//*-------------------------------------------------------------------  00110001
//*    EXECUTA STOP DB                                                  00120001
//*-------------------------------------------------------------------  00130001
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00140006
//SYSTSPRT DD SYSOUT=*                                                  00150006
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                       00160006
//SYSPRINT DD SYSOUT=*                                                  00170006
//SYSUDUMP DD SYSOUT=*                                                  00180006
//*-------------------------------------------------------------------  00190001
//*    EXECUTA DSN1COPY                                                 00200001
//*-------------------------------------------------------------------  00210001
//SEGMNTO1 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00220002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00230001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00240001
//SYSPRINT DD SYSOUT=*                                                  00250001
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A001,DISP=OLD             00260007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00270007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00280001
//*                                                                     00290002
//SEGMNTO2 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00300002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00310002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00320002
//SYSPRINT DD SYSOUT=*                                                  00330002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A002,DISP=OLD             00340007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A002,DISP=OLD         00350007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00360002
//*                                                                     00370002
//SEGMNTO3 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00380002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00390002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00400002
//SYSPRINT DD SYSOUT=*                                                  00410002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A003,DISP=OLD             00420007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A003,DISP=OLD         00430007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00440002
//*                                                                     00450002
//SEGMNTO4 EXEC PGM=DSN1COPY,PARM=&XLAT                                 00460002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00470002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00480002
//SYSPRINT DD SYSOUT=*                                                  00490002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A004,DISP=OLD             00500007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A004,DISP=OLD         00510007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00520002
//*-------------------------------------------------------------------  00530002
//*    EXECUTA START DB                                                 00540001
//*-------------------------------------------------------------------  00550001
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00560006
//SYSTSPRT DD SYSOUT=*                                                  00570006
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      00580006
//SYSPRINT DD SYSOUT=*                                                  00590006
//SYSUDUMP DD SYSOUT=*                                                  00600006
