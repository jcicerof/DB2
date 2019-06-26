//C2I5     PROC XLAT=('OBIDXLAT,RESET'),                                00001000
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001300
//             TS=NONE                                                  00001400
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00005002
//*    EXECUTA STOP DB                                                  00006002
//*-------------------------------------------------------------------  00007002
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00008002
//SYSTSPRT DD SYSOUT=*                                                  00009002
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                       00009102
//SYSPRINT DD SYSOUT=*                                                  00009202
//SYSUDUMP DD SYSOUT=*                                                  00009302
//*-------------------------------------------------------------------  00009400
//*    EXECUTA DSN1COPY                                                 00009500
//*-------------------------------------------------------------------  00009600
//PART01   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00010001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A001,DISP=SHR             00070000
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A001,DISP=OLD         00070100
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00080000
//*-------------------------------------------------------------------  00090001
//PART02   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00100001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00110001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00120001
//SYSPRINT DD SYSOUT=*                                                  00130001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A002,DISP=SHR             00140001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A002,DISP=OLD         00150001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00160001
//*-------------------------------------------------------------------  00170001
//PART03   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00180001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00190001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00200001
//SYSPRINT DD SYSOUT=*                                                  00210001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A003,DISP=SHR             00220001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A003,DISP=OLD         00221001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00222001
//*-------------------------------------------------------------------  00223001
//PART04   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00224001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00225001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00226001
//SYSPRINT DD SYSOUT=*                                                  00227001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A004,DISP=SHR             00228001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A004,DISP=OLD         00229001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229101
//*-------------------------------------------------------------------  00229201
//PART05   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00229301
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00229401
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00229501
//SYSPRINT DD SYSOUT=*                                                  00229601
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A005,DISP=SHR             00229701
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A005,DISP=OLD         00229801
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229901
//*-------------------------------------------------------------------  00230001
//PART06   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00231001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00232001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00233001
//SYSPRINT DD SYSOUT=*                                                  00234001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A006,DISP=SHR             00235001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A006,DISP=OLD         00236001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00237001
//*-------------------------------------------------------------------  00238001
//PART07   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239101
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00239201
//SYSPRINT DD SYSOUT=*                                                  00239301
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A007,DISP=SHR             00239401
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A007,DISP=OLD         00239501
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00239601
//*-------------------------------------------------------------------  00239701
//PART08   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239801
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239901
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00240001
//SYSPRINT DD SYSOUT=*                                                  00241001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A008,DISP=SHR             00242001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A008,DISP=OLD         00243001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00244001
//*-------------------------------------------------------------------  00245001
//PART09   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00246001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00247001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00248001
//SYSPRINT DD SYSOUT=*                                                  00249001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A009,DISP=SHR             00249101
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A009,DISP=OLD         00249201
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00249301
//*-------------------------------------------------------------------  00249401
//PART10   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00249501
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00249601
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00249701
//SYSPRINT DD SYSOUT=*                                                  00249801
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&TS..I0001.A010,DISP=SHR             00249901
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A010,DISP=OLD         00250001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00251001
//*-------------------------------------------------------------------  00252002
//*    EXECUTA START DB                                                 00253002
//*-------------------------------------------------------------------  00254002
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00255002
//SYSTSPRT DD SYSOUT=*                                                  00256002
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      00257002
//SYSPRINT DD SYSOUT=*                                                  00258002
//SYSUDUMP DD SYSOUT=*                                                  00259002
//         PEND                                                         00260001
