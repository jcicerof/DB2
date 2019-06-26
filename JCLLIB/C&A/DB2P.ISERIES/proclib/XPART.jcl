//XPART    PROC XLAT=('OBIDXLAT,RESET'),                                00001001
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001300
//             TS=NONE                                                  00001402
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00009400
//*    EXECUTA DSN1COPY                                                 00009500
//*-------------------------------------------------------------------  00009600
//DATA01   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00010000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A001,DISP=SHR             00070001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A001,DISP=OLD         00070100
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00080000
//*-------------------------------------------------------------------  00090000
//DATA02   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00100000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00110000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00120000
//SYSPRINT DD SYSOUT=*                                                  00130000
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A002,DISP=SHR             00140001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A002,DISP=OLD         00150000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00160000
//*-------------------------------------------------------------------  00170000
//DATA03   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00180000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00190000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00200000
//SYSPRINT DD SYSOUT=*                                                  00210000
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A003,DISP=SHR             00220001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A003,DISP=OLD         00221000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00222000
//*-------------------------------------------------------------------  00223000
//DATA04   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00224000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00225000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00226000
//SYSPRINT DD SYSOUT=*                                                  00227000
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A004,DISP=SHR             00228001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A004,DISP=OLD         00229000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229100
//*-------------------------------------------------------------------  00229200
//DATA05   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00229300
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00229400
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00229500
//SYSPRINT DD SYSOUT=*                                                  00229600
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A005,DISP=SHR             00229701
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A005,DISP=OLD         00229800
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229900
//*-------------------------------------------------------------------  00230000
//DATA06   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00231000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00232000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00233000
//SYSPRINT DD SYSOUT=*                                                  00234000
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A006,DISP=SHR             00235001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A006,DISP=OLD         00236000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00237000
//*-------------------------------------------------------------------  00238000
//DATA07   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239100
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00239200
//SYSPRINT DD SYSOUT=*                                                  00239300
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A007,DISP=SHR             00239401
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A007,DISP=OLD         00239500
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00239600
//*-------------------------------------------------------------------  00239700
//DATA08   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239800
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239900
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00240000
//SYSPRINT DD SYSOUT=*                                                  00241000
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A008,DISP=SHR             00242001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A008,DISP=OLD         00243000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00244000
//*-------------------------------------------------------------------  00245000
//DATA09   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00246000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00247000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00248000
//SYSPRINT DD SYSOUT=*                                                  00249000
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A009,DISP=SHR             00249101
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A009,DISP=OLD         00249200
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00249300
//*-------------------------------------------------------------------  00249400
//DATA10   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00249500
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00249600
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00249700
//SYSPRINT DD SYSOUT=*                                                  00249800
//SYSUT1   DD DSN=DB2Z.DSNDBD.&DB..&TS..I0001.A010,DISP=SHR             00249901
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&TS..I0001.A010,DISP=OLD         00250000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00251000
//         PEND                                                         01420000
