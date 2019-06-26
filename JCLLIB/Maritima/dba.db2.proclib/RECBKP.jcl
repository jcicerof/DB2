//RECBKP   PROC XLATDEF='OBIDXLAT,RESET,FULLCOPY', ** XLAT DEFAULT      00001010
//             LIB=DB2.DSN610,                                          00001200
//             SS=NONE,                                                 00001305
//             TS=NONE,                                                 00001405
//             DT=NONE,                                                 00001510
//             XLAT=                                                    00001610
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00004100
//*    EXECUTA STOP DB                                                  00004200
//*-------------------------------------------------------------------  00004300
//*STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                               00005001
//*STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                              00005106
//*         DD DSN=&LIB..SDSNLOAD,DISP=SHR                              00005206
//*SYSTSPRT DD SYSOUT=*                                                 00006001
//*SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                      00007001
//*SYSPRINT DD SYSOUT=*                                                 00009201
//*SYSUDUMP DD SYSOUT=*                                                 00009301
//*-------------------------------------------------------------------  00009400
//*    EXECUTA DSN1COPY                                                 00009500
//*-------------------------------------------------------------------  00009600
//DSN1COPY EXEC PGM=DSN1COPY,PARM=(&XLATDEF&XLAT)                       00010010
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=HC.&SS..CI.&TS..I5.D&DT,DISP=OLD                      00070005
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00070100
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00080000
//*-------------------------------------------------------------------  00120000
//*    EXECUTA START DB                                                 00130000
//*-------------------------------------------------------------------  00140000
//*STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                               00150001
//*STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                              00151006
//*         DD DSN=&LIB..SDSNLOAD,DISP=SHR                              00152006
//*SYSTSPRT DD SYSOUT=*                                                 00160001
//*SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                     00171001
//*SYSPRINT DD SYSOUT=*                                                 00210001
//*SYSUDUMP DD SYSOUT=*                                                 00220001
//         PEND                                                         00230000
