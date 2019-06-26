//RECBKP2  PROC XLAT='OBIDXLAT,RESET,FULLCOPY',                         00001001
//             LIB=DB2.DSN610,                                          00001200
//             SS=NONE,                                                 00001300
//             TS=NONE,                                                 00001400
//             DT=NONE,                                                 00001501
//             NUMPARTS=,                                               00001601
//             DSSIZE=,                                                 00001701
//             PAGESIZE=                                                00001802
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00004100
//*    EXECUTA STOP DB                                                  00004200
//*-------------------------------------------------------------------  00004300
//*STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                               00005000
//*STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                              00005100
//*         DD DSN=&LIB..SDSNLOAD,DISP=SHR                              00005200
//*SYSTSPRT DD SYSOUT=*                                                 00006000
//*SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                      00007000
//*SYSPRINT DD SYSOUT=*                                                 00009200
//*SYSUDUMP DD SYSOUT=*                                                 00009300
//*-------------------------------------------------------------------  00009400
//*    EXECUTA DSN1COPY                                                 00009500
//*-------------------------------------------------------------------  00009600
//DSN1COPY EXEC PGM=DSN1COPY,PARM=(&XLAT,&NUMPARTS,&DSSIZE,&PAGESIZE)   00010001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=HC.&SS..CI.&TS..I5.D&DT,DISP=OLD                      00070000
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00070100
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00080000
//*-------------------------------------------------------------------  00120000
//*    EXECUTA START DB                                                 00130000
//*-------------------------------------------------------------------  00140000
//*STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                               00150000
//*STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                              00151000
//*         DD DSN=&LIB..SDSNLOAD,DISP=SHR                              00152000
//*SYSTSPRT DD SYSOUT=*                                                 00160000
//*SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                     00171000
//*SYSPRINT DD SYSOUT=*                                                 00210000
//*SYSUDUMP DD SYSOUT=*                                                 00220000
//         PEND                                                         00230000
