//C2I5XP   PROC XLAT=('OBIDXLAT,RESET'),                                00001002
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001300
//             TS=NONE,                                                 00001404
//             IX=NONE,                                                 00001504
//             IX2=NONE                                                 00001604
//*-------------------------------------------------------------------  00002000
//*    COPIA DATASETS DB2 PARA DISPONIBILIZAR PARA O ISERIES            00003000
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00005003
//*    EXECUTA STOP DB                                                  00006003
//*-------------------------------------------------------------------  00007003
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00008003
//SYSTSPRT DD SYSOUT=*                                                  00009003
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(&TS),DISP=SHR                       00009103
//SYSPRINT DD SYSOUT=*                                                  00009203
//SYSUDUMP DD SYSOUT=*                                                  00009303
//*-------------------------------------------------------------------  00009400
//*    EXECUTA DSN1COPY                                                 00009500
//*-------------------------------------------------------------------  00009600
//INDEX01  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00010001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A001,DISP=SHR             00070000
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A001,DISP=OLD        00070100
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00080000
//*-------------------------------------------------------------------  00090001
//INDEX02  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00100001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00110001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00120001
//SYSPRINT DD SYSOUT=*                                                  00130001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A002,DISP=SHR             00140001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A002,DISP=OLD        00150001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00160001
//*-------------------------------------------------------------------  00170001
//INDEX03  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00180001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00190001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00200001
//SYSPRINT DD SYSOUT=*                                                  00210001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A003,DISP=SHR             00220001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A003,DISP=OLD        00230001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00240001
//*-------------------------------------------------------------------  00250001
//INDEX04  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00251001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00252001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00253001
//SYSPRINT DD SYSOUT=*                                                  00254001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A004,DISP=SHR             00255001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A004,DISP=OLD        00256001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00257001
//*-------------------------------------------------------------------  00258001
//INDEX05  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00259001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00259101
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00259201
//SYSPRINT DD SYSOUT=*                                                  00259301
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A005,DISP=SHR             00259401
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A005,DISP=OLD        00259501
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00259601
//*-------------------------------------------------------------------  00259701
//INDEX06  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00259801
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00259901
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00260001
//SYSPRINT DD SYSOUT=*                                                  00261001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A006,DISP=SHR             00262001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A006,DISP=OLD        00263001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00264001
//*-------------------------------------------------------------------  00265001
//INDEX07  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00266001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00267001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00268001
//SYSPRINT DD SYSOUT=*                                                  00269001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A007,DISP=SHR             00269101
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A007,DISP=OLD        00269201
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00269301
//*-------------------------------------------------------------------  00269401
//INDEX08  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00269501
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00269601
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00269701
//SYSPRINT DD SYSOUT=*                                                  00269801
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A008,DISP=SHR             00269901
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A008,DISP=OLD        00270001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00271001
//*-------------------------------------------------------------------  00272001
//INDEX09  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00273001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00274001
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00275001
//SYSPRINT DD SYSOUT=*                                                  00276001
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A009,DISP=SHR             00277001
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A009,DISP=OLD        00278001
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00279001
//*-------------------------------------------------------------------  00279101
//INDEX10  EXEC PGM=DSN1COPY,PARM=&XLAT                                 00279201
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00279301
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00279401
//SYSPRINT DD SYSOUT=*                                                  00279501
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A010,DISP=SHR             00279601
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A010,DISP=OLD        00279701
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00279801
//*-------------------------------------------------------------------  00279903
//*    EXECUTA START DB                                                 00280003
//*-------------------------------------------------------------------  00281003
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00282003
//SYSTSPRT DD SYSOUT=*                                                  00283003
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      00284003
//SYSPRINT DD SYSOUT=*                                                  00285003
//SYSUDUMP DD SYSOUT=*                                                  00286003
//         PEND                                                         00290001
