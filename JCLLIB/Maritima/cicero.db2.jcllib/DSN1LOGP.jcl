//DB@1LOGP JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010009
//*-------------------------------------------------------------------  00020008
//*                                                                     00021008
//*-------------------------------------------------------------------  00022008
//DSN1LOGP EXEC PGM=DSN1LOGP                                            00030008
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                          00040008
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                          00050008
//SYSABEND DD   SYSOUT=*                                                00060008
//SYSPRINT DD   DSN=CICERO.DSN1LOGP.SYSPRINT,DISP=(NEW,CATLG,CATLG),    00070008
//         UNIT=SYSDBA,SPACE=(TRK,(10000,1000),RLSE),OUTLIM=6000000     00090008
//SYSSUMRY DD   DSN=CICERO.DSN1LOGP.SYSSUMRY,DISP=(NEW,CATLG,CATLG),    00100008
//         UNIT=SYSDBA,SPACE=(TRK,(10000,1000),RLSE),OUTLIM=3000000     00120008
//*BSDS     DD   DSN=DB2PCAT.BSDS01,DISP=SHR                            00130008
//ARCHIVE  DD   DISP=SHR,DSN=DB2PCAT.ARCHLOG2.A0013608                  00140010
//SYSIN    DD   *                                                       00150008
RBASTART(097988838000) DBID(120) OBID(0E8)                              00160010
SUMMARY(YES)                                                            00170008
/*                                                                      00180008
