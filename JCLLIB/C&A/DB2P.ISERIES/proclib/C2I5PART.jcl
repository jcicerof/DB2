//C2I5PART PROC XLAT=('OBIDXLAT,RESET'),                                00001006
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001300
//             TS=NONE,                                                 00001402
//             IX=NONE,                                                 00001502
//             IX2=NONE                                                 00001602
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00005000
//*    EXECUTA STOP DB                                                  00006000
//*-------------------------------------------------------------------  00007000
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00008007
//SYSTSPRT DD SYSOUT=*                                                  00009007
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                       00009107
//SYSPRINT DD SYSOUT=*                                                  00009207
//SYSUDUMP DD SYSOUT=*                                                  00009307
//*-------------------------------------------------------------------  00009400
//*    EXECUTA DSN1COPY                                                 00009500
//*-------------------------------------------------------------------  00009600
//DATA01   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00010001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A001,DISP=OLD             00070007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A001,DISP=OLD         00070107
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00080000
//*-------------------------------------------------------------------  00090000
//DATA02   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00100001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00110000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00120000
//SYSPRINT DD SYSOUT=*                                                  00130000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A002,DISP=OLD             00140007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A002,DISP=OLD         00150007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00160000
//*-------------------------------------------------------------------  00170000
//DATA03   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00180001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00190000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00200000
//SYSPRINT DD SYSOUT=*                                                  00210000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A003,DISP=OLD             00220007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A003,DISP=OLD         00221007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00222000
//*-------------------------------------------------------------------  00223000
//DATA04   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00224001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00225000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00226000
//SYSPRINT DD SYSOUT=*                                                  00227000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A004,DISP=OLD             00228007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A004,DISP=OLD         00229007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229100
//*-------------------------------------------------------------------  00229200
//DATA05   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00229301
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00229400
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00229500
//SYSPRINT DD SYSOUT=*                                                  00229600
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A005,DISP=OLD             00229707
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A005,DISP=OLD         00229807
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00229900
//*-------------------------------------------------------------------  00230000
//DATA06   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00231001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00232000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00233000
//SYSPRINT DD SYSOUT=*                                                  00234000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A006,DISP=OLD             00235007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A006,DISP=OLD         00236007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00237000
//*-------------------------------------------------------------------  00238000
//DATA07   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239100
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00239200
//SYSPRINT DD SYSOUT=*                                                  00239300
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A007,DISP=OLD             00239407
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A007,DISP=OLD         00239507
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00239600
//*-------------------------------------------------------------------  00239700
//DATA08   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00239801
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00239900
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00240000
//SYSPRINT DD SYSOUT=*                                                  00241000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A008,DISP=OLD             00242007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A008,DISP=OLD         00243007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00244000
//*-------------------------------------------------------------------  00245000
//DATA09   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00246001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00247000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00248000
//SYSPRINT DD SYSOUT=*                                                  00249000
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A009,DISP=OLD             00249107
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A009,DISP=OLD         00249207
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00249300
//*-------------------------------------------------------------------  00249400
//DATA10   EXEC PGM=DSN1COPY,PARM=&XLAT                                 00249501
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00249600
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00249700
//SYSPRINT DD SYSOUT=*                                                  00249800
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&TS..I0001.A010,DISP=OLD             00249907
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&TS..I0001.A010,DISP=OLD         00250007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&TS),DISP=SHR                       00251000
//*-------------------------------------------------------------------  00520002
//*    EXECUTA INDEX                                                    00530002
//*-------------------------------------------------------------------  00540002
//INDEX01  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00550002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00560002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00570002
//SYSPRINT DD SYSOUT=*                                                  00580002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A001,DISP=OLD             00590007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A001,DISP=OLD        00600007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00610002
//*-------------------------------------------------------------------  00620002
//INDEX02  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00630002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00640002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00650002
//SYSPRINT DD SYSOUT=*                                                  00660002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A002,DISP=OLD             00670007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A002,DISP=OLD        00680007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00690002
//*-------------------------------------------------------------------  00700002
//INDEX03  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00710002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00720002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00730002
//SYSPRINT DD SYSOUT=*                                                  00740002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A003,DISP=OLD             00750007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A003,DISP=OLD        00760007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00770002
//*-------------------------------------------------------------------  00780002
//INDEX04  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00790002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00800002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00810002
//SYSPRINT DD SYSOUT=*                                                  00820002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A004,DISP=OLD             00830007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A004,DISP=OLD        00840007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00850002
//*-------------------------------------------------------------------  00860002
//INDEX05  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00870002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00880002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00890002
//SYSPRINT DD SYSOUT=*                                                  00900002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A005,DISP=OLD             00910007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A005,DISP=OLD        00920007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00930002
//*-------------------------------------------------------------------  00940002
//INDEX06  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00950002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00960002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00970002
//SYSPRINT DD SYSOUT=*                                                  00980002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A006,DISP=OLD             00990007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A006,DISP=OLD        01000007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       01010002
//*-------------------------------------------------------------------  01020002
//INDEX07  EXEC PGM=DSN1COPY,PARM=&XLAT                                 01030002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               01040002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               01050002
//SYSPRINT DD SYSOUT=*                                                  01060002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A007,DISP=OLD             01070007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A007,DISP=OLD        01080007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       01090002
//*-------------------------------------------------------------------  01100002
//INDEX08  EXEC PGM=DSN1COPY,PARM=&XLAT                                 01110002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               01120002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               01130002
//SYSPRINT DD SYSOUT=*                                                  01140002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A008,DISP=OLD             01150007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A008,DISP=OLD        01160007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       01170002
//*-------------------------------------------------------------------  01180002
//INDEX09  EXEC PGM=DSN1COPY,PARM=&XLAT                                 01190002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               01200002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               01210002
//SYSPRINT DD SYSOUT=*                                                  01220002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A009,DISP=OLD             01230007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A009,DISP=OLD        01240007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       01250002
//*-------------------------------------------------------------------  01260002
//INDEX10  EXEC PGM=DSN1COPY,PARM=&XLAT                                 01270002
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               01280002
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               01290002
//SYSPRINT DD SYSOUT=*                                                  01300002
//SYSUT1   DD DSN=DB2P.DSNDBC.&DB..&IX..I0001.A010,DISP=OLD             01310007
//SYSUT2   DD DSN=DB2P.DSNDBC.AISERIES.&IX2..I0001.A010,DISP=OLD        01320007
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       01330002
//*-------------------------------------------------------------------  01340002
//*    EXECUTA START DB                                                 01350002
//*-------------------------------------------------------------------  01360002
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                01370007
//SYSTSPRT DD SYSOUT=*                                                  01380007
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      01390007
//SYSPRINT DD SYSOUT=*                                                  01400007
//SYSUDUMP DD SYSOUT=*                                                  01410007
//         PEND                                                         01420002
