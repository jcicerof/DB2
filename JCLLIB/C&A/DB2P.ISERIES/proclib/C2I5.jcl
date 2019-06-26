//C2I5     PROC XLAT=('OBIDXLAT,RESET'),                                00001002
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001302
//             TS=NONE                                                  00001402
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00004100
//*    EXECUTA STOP DB                                                  00004204
//*-------------------------------------------------------------------  00004300
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00005006
//SYSTSPRT DD SYSOUT=*                                                  00006006
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                       00007006
//SYSPRINT DD SYSOUT=*                                                  00009206
//SYSUDUMP DD SYSOUT=*                                                  00009306
//*-------------------------------------------------------------------  00009400
//*    EXECUTA DSN1COPY                                                 00009500
//*-------------------------------------------------------------------  00009600
//DSN1COPY EXEC PGM=DSN1COPY,PARM=&XLAT                                 00010000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A001,DISP=OLD             00070006
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00070106
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00080003
//*-------------------------------------------------------------------  00120000
//*    EXECUTA START DB                                                 00130000
//*-------------------------------------------------------------------  00140000
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00150006
//SYSTSPRT DD SYSOUT=*                                                  00160006
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      00171006
//SYSPRINT DD SYSOUT=*                                                  00210006
//SYSUDUMP DD SYSOUT=*                                                  00220006
//         PEND                                                         00230000
