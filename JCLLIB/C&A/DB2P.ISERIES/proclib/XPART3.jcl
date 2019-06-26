//XPART2   PROC XLAT=('OBIDXLAT,RESET'),                                00001000
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001300
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
//*-------------------------------------------------------------------  00252000
//*    EXECUTA INDEX                                                    00253000
//*-------------------------------------------------------------------  00254000
//INDEX01  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00255000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00256000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00257000
//SYSPRINT DD SYSOUT=*                                                  00258000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A001.D,DISP=SHR           00259001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A001,DISP=OLD        00260000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00270000
//*-------------------------------------------------------------------  00280000
//INDEX02  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00290000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00300000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00310000
//SYSPRINT DD SYSOUT=*                                                  00320000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A002.D,DISP=SHR           00330001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A002,DISP=OLD        00340000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00350000
//*-------------------------------------------------------------------  00360000
//INDEX03  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00370000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00380000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00390000
//SYSPRINT DD SYSOUT=*                                                  00400000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A003.D,DISP=SHR           00410001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A003,DISP=OLD        00420000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00430000
//*-------------------------------------------------------------------  00440000
//INDEX04  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00450000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00460000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00470000
//SYSPRINT DD SYSOUT=*                                                  00480000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A004.D,DISP=SHR           00490001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A004,DISP=OLD        00500000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00510000
//*-------------------------------------------------------------------  00520000
//INDEX05  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00530000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00540000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00550000
//SYSPRINT DD SYSOUT=*                                                  00560000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A005.D,DISP=SHR           00570001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A005,DISP=OLD        00580000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00590000
//*-------------------------------------------------------------------  00600000
//INDEX06  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00610000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00620000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00630000
//SYSPRINT DD SYSOUT=*                                                  00640000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A006.D,DISP=SHR           00650001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A006,DISP=OLD        00660000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00670000
//*-------------------------------------------------------------------  00680000
//INDEX07  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00690000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00700000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00710000
//SYSPRINT DD SYSOUT=*                                                  00720000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A007.D,DISP=SHR           00730001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A007,DISP=OLD        00740000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00750000
//*-------------------------------------------------------------------  00760000
//INDEX08  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00770000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00780000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00790000
//SYSPRINT DD SYSOUT=*                                                  00800000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A008.D,DISP=SHR           00810001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A008,DISP=OLD        00820000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00830000
//*-------------------------------------------------------------------  00840000
//INDEX09  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00850000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00860000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00870000
//SYSPRINT DD SYSOUT=*                                                  00880000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A009.D,DISP=SHR           00890001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A009,DISP=OLD        00900000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00910000
//*-------------------------------------------------------------------  00920000
//INDEX10  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00930000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00940000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00950000
//SYSPRINT DD SYSOUT=*                                                  00960000
//SYSUT1   DD DSN=DB2Z.DSNDBC.&DB..&IX..I0001.A010.D,DISP=SHR           00970001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A010,DISP=OLD        00980000
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00990000
//*-------------------------------------------------------------------  01340000
//*    EXECUTA START DB                                                 01350000
//*-------------------------------------------------------------------  01360000
//*STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                               01370000
//*SYSTSPRT DD SYSOUT=*                                                 01380000
//*SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                     01390000
//*SYSPRINT DD SYSOUT=*                                                 01400000
//*SYSUDUMP DD SYSOUT=*                                                 01410000
//         PEND                                                         01420000
