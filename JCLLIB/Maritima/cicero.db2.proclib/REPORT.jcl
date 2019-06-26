//REPORT   PROC DSN=NONE                                                00021001
//*------------------------------------------------------------------   00022001
//* REPORT                                                              00023001
//*------------------------------------------------------------------   00024001
//REPORT   EXEC PGM=DSNUTILB,PARM='&DSN'                                00030001
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00040001
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00050001
//SYSPRINT DD   SYSOUT=*                                                00060000
//SYSOUT   DD   SYSOUT=*                                                00070000
//SYSIN    DD   DUMMY                                                   00140001
// PEND                                                                 00150001
