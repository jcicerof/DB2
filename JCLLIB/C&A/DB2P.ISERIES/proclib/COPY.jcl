//COPY     PROC LIB=DB2.DSN610, ** BIBLIOTECA DB2                       00001201
//             SS=NONE,        ** SIGLA DO SISTEMA                      00001401
//             DT=NONE,        ** DATA DE EXECUCAO                      00001501
//             TS=NONE         ** TABLESPACE/INDEXSPACE                 00001701
//*-------------------------------------------------------------------  00002000
//*    BACKUP DB2 PARA DISPONIBILIZAR PARA O ISERIES                    00003001
//*    AUTOR: JOSE CICERO (JOSECICEROFILHO@HOTMAIL.COM)                 00003100
//*    DATA:  JUN/2006                                                  00003200
//*-------------------------------------------------------------------  00004000
//*-------------------------------------------------------------------  00004300
//*    EXECUTA START UT                                                 00004406
//*-------------------------------------------------------------------  00004500
//STARTUT  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00005006
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00005104
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00005204
//SYSTSPRT DD SYSOUT=*                                                  00006000
//SYSTSIN  DD DSN=DB2P.ISERIES.STARTUT(&TS),DISP=SHR                    00007006
//SYSPRINT DD SYSOUT=*                                                  00009200
//SYSUDUMP DD SYSOUT=*                                                  00009300
//*------------------------------------------------------------------   00009901
//* COPY                                                                00010001
//*------------------------------------------------------------------   00020001
//COPY     EXEC PGM=DSNUTILB,PARM='DB2P'                                00030001
//STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                               00031004
//         DD DSN=&LIB..SDSNLOAD,DISP=SHR                               00032004
//SYSPRINT DD  SYSOUT=*                                                 00040001
//SYSOUT   DD  SYSOUT=*                                                 00050001
//SYSCOPY  DD  DSN=HC.&SS..CI.&TS..I5.D&DT,                             00060001
//             DISP=(,CATLG,DELETE),                                    00070001
//             UNIT=EAGLE,VOL=(,,,255),DCB=DSCB                         00080005
//SYSIN    DD  DSN=DB2P.ISERIES.COPY(&TS),DISP=SHR                      00090002
//*-------------------------------------------------------------------  00120000
//*    EXECUTA START DB                                                 00130000
//*-------------------------------------------------------------------  00140000
//*STARTRW  EXEC PGM=IKJEFT01,DYNAMNBR=20                               00150007
//*STEPLIB  DD DSN=&LIB..SDSNEXIT,DISP=SHR                              00151007
//*         DD DSN=&LIB..SDSNLOAD,DISP=SHR                              00152007
//*SYSTSPRT DD SYSOUT=*                                                 00160007
//*SYSTSIN  DD DSN=DB2P.ISERIES.START(&TS),DISP=SHR                     00171007
//*SYSPRINT DD SYSOUT=*                                                 00210007
//*SYSUDUMP DD SYSOUT=*                                                 00220007
//         PEND                                                         00230000
