//C2I5X    PROC XLAT=('OBIDXLAT,RESET'),                                00001000
//             LIB=DB2.DSN610,                                          00001200
//             DB=NONE,                                                 00001300
//             IX=NONE,                                                 00001401
//             IX2=NONE                                                 00001501
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
//DSN1COPY EXEC PGM=DSN1COPY,PARM=&XLAT                                 00010000
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00021000
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00022000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSUT1   DD DSN=DB2P.DSNDBD.&DB..&IX..I0001.A001,DISP=SHR             00070002
//SYSUT2   DD DSN=DB2P.DSNDBD.AISERIES.&IX2..I0001.A001,DISP=OLD        00070102
//SYSXLAT  DD DSN=DB2P.ISERIES.XLAT(&IX),DISP=SHR                       00080002
//*-------------------------------------------------------------------  00090003
//*    EXECUTA START DB                                                 00100003
//*-------------------------------------------------------------------  00110003
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00120003
//SYSTSPRT DD SYSOUT=*                                                  00130003
//SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                      00140003
//SYSPRINT DD SYSOUT=*                                                  00150003
//SYSUDUMP DD SYSOUT=*                                                  00160003
//         PEND                                                         00230000
