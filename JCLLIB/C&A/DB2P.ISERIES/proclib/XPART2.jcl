//XPART2   PROC XLAT=('OBIDXLAT,RESET'),                                00001000
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001300
//             TS=NONE,                                                 00001400
//             IX=NONE,                                                 00001500
//             IX2=NONE                                                 00001600
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00005000
//*    EXECUTA STOP DB                                                  00006000
//*-------------------------------------------------------------------  00007000
//*STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                               00008000
//*SYSTSPRT DD SYSOUT=*                                                 00009000
//*SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                      00009100
//*SYSPRINT DD SYSOUT=*                                                 00009200
//*SYSUDUMP DD SYSOUT=*                                                 00009300
//*-------------------------------------------------------------------  00017600
//*    EXECUTA DSN1COPY                                                 00017700
//*-------------------------------------------------------------------  00018000
//DATA01   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00020000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A001,DISP=OLD             00070004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00070103
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00080000
//*-------------------------------------------------------------------  00090000
//DATA02   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00100000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00110000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00120000
//SYSPRINT DD SYSOUT=*                                                  00130000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A002,DISP=OLD             00140004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A002,DISP=OLD         00150003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00160000
//*-------------------------------------------------------------------  00170000
//DATA03   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00180000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00190000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00200000
//SYSPRINT DD SYSOUT=*                                                  00210000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A003,DISP=OLD             00220004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A003,DISP=OLD         00221003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00222000
//*-------------------------------------------------------------------  00223000
//DATA04   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00224000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00225000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00226000
//SYSPRINT DD SYSOUT=*                                                  00227000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A004,DISP=OLD             00228004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A004,DISP=OLD         00229003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229100
//*-------------------------------------------------------------------  00229200
//DATA05   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00229300
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00229400
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00229500
//SYSPRINT DD SYSOUT=*                                                  00229600
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A005,DISP=OLD             00229704
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A005,DISP=OLD         00229803
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229900
//*-------------------------------------------------------------------  00230000
//DATA06   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00231000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00232000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00233000
//SYSPRINT DD SYSOUT=*                                                  00234000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A006,DISP=OLD             00235004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A006,DISP=OLD         00236003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00237000
//*-------------------------------------------------------------------  00238000
//DATA07   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239100
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00239200
//SYSPRINT DD SYSOUT=*                                                  00239300
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A007,DISP=OLD             00239404
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A007,DISP=OLD         00239503
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00239600
//*-------------------------------------------------------------------  00239700
//DATA08   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239800
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239900
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00240000
//SYSPRINT DD SYSOUT=*                                                  00241000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A008,DISP=OLD             00242004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A008,DISP=OLD         00243003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00244000
//*-------------------------------------------------------------------  00245000
//DATA09   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00246000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00247000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00248000
//SYSPRINT DD SYSOUT=*                                                  00249000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A009,DISP=OLD             00249104
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A009,DISP=OLD         00249203
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00249300
//*-------------------------------------------------------------------  00249400
//DATA10   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00249500
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00249600
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00249700
//SYSPRINT DD SYSOUT=*                                                  00249800
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&TS..I0001.A010,DISP=OLD             00249904
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A010,DISP=OLD         00250003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00251000
//*-------------------------------------------------------------------  00252002
//*    EXECUTA INDEX                                                    00253002
//*-------------------------------------------------------------------  00254002
//INDEX01  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00255002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00256002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00257002
//SYSPRINT DD SYSOUT=*                                                  00258002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A001,DISP=OLD            00259004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A001,DISP=OLD        00260003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00270002
//*-------------------------------------------------------------------  00280002
//INDEX02  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00290002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00300002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00310002
//SYSPRINT DD SYSOUT=*                                                  00320002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A002,DISP=OLD            00330004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A002,DISP=OLD        00340003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00350002
//*-------------------------------------------------------------------  00360002
//INDEX03  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00370002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00380002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00390002
//SYSPRINT DD SYSOUT=*                                                  00400002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A003,DISP=OLD            00410004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A003,DISP=OLD        00420003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00430002
//*-------------------------------------------------------------------  00440002
//INDEX04  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00450002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00460002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00470002
//SYSPRINT DD SYSOUT=*                                                  00480002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A004,DISP=OLD            00490004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A004,DISP=OLD        00500003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00510002
//*-------------------------------------------------------------------  00520002
//INDEX05  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00530002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00540002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00550002
//SYSPRINT DD SYSOUT=*                                                  00560002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A005,DISP=OLD            00570004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A005,DISP=OLD        00580003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00590002
//*-------------------------------------------------------------------  00600002
//INDEX06  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00610002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00620002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00630002
//SYSPRINT DD SYSOUT=*                                                  00640002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A006,DISP=OLD            00650004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A006,DISP=OLD        00660003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00670002
//*-------------------------------------------------------------------  00680002
//INDEX07  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00690002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00700002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00710002
//SYSPRINT DD SYSOUT=*                                                  00720002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A007,DISP=OLD            00730004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A007,DISP=OLD        00740003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00750002
//*-------------------------------------------------------------------  00760002
//INDEX08  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00770002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00780002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00790002
//SYSPRINT DD SYSOUT=*                                                  00800002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A008,DISP=OLD            00810004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A008,DISP=OLD        00820003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00830002
//*-------------------------------------------------------------------  00840002
//INDEX09  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00850002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00860002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00870002
//SYSPRINT DD SYSOUT=*                                                  00880002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A009,DISP=OLD            00890004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A009,DISP=OLD        00900003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00910002
//*-------------------------------------------------------------------  00920002
//INDEX10  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00930002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00940002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00950002
//SYSPRINT DD SYSOUT=*                                                  00960002
//SYSUT1   DD DSN=DC.EQ.DSNDBC.&DB..&IX..I0001.A010,DISP=OLD            00970004
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A010,DISP=OLD        00980003
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00990002
//*-------------------------------------------------------------------  01340000
//*    EXECUTA START DB                                                 01350000
//*-------------------------------------------------------------------  01360000
//*STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                               01370000
//*SYSTSPRT DD SYSOUT=*                                                 01380000
//*SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                     01390000
//*SYSPRINT DD SYSOUT=*                                                 01400000
//*SYSUDUMP DD SYSOUT=*                                                 01410000
//         PEND                                                         01420000
