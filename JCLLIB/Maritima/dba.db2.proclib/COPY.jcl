//COPY     PROC DSN=NONE   ** SSID DB2                                  00001202
//*------------------------------------------------------------------   00009900
//* COPY                                                                00010000
//*------------------------------------------------------------------   00020000
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                00030002
//STEPLIB  DD DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                           00031002
//         DD DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                           00032002
//SYSPRINT DD  SYSOUT=*                                                 00040000
//SYSOUT   DD  SYSOUT=*                                                 00050000
//SYSCOPY  DD  DUMMY                                                    00060002
//SYSIN    DD  DUMMY                                                    00090002
//         PEND                                                         00230000
