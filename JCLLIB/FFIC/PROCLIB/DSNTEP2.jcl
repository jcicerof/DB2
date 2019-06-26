//*------------------------------------------------------------------   00010000
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB                                  00020000
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB                                  00030000
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB                                  00040000
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB                                  00050000
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB                                  00060000
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB                                  00070000
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB                                  00080000
//*------------------------------------------------------------------   00090000
//DSNTEP2  PROC DSN=NONE,LIB=NONE                                       00091001
//IKJEFT01 EXEC PGM=IKJEFT01                                            00100000
//STEPLIB  DD DSN=&LIB..DB2LOAD,DISP=SHR                                00110003
//         DD DSN=&LIB..DB2RUNLB,DISP=SHR                               00120003
//SYSTSPRT DD SYSOUT=*                                                  00130000
//SYSTSIN  DD DISP=SHR,DSN=DBA5.DB2.PROCLIB(&DSN)                       00140003
//SYSPRINT DD SYSOUT=*                                                  00180000
//SYSUDUMP DD SYSOUT=*                                                  00190000
// PEND                                                                 00210002
