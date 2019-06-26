//UNLOADI5 PROC TS=NONE,
//           OWNER=NONE,                                                00170000
//           REXXLIB=DB2P.ISERIES.REXX                                  00171000
//UNLOAD   EXEC PGM=DSNUTILB,PARM='DB2P',COND=EVEN
//STEPLIB  DD   DSN=DB2.DSN610.SDSNEXIT,DISP=SHR
//         DD   DSN=DB2.DSN610.SDSNLOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSOUT   DD   SYSOUT=*
//SYSPUNCH DD   DSN=&&SYSPUNCH,
//         DISP=(NEW,PASS,KEEP),
//         SPACE=(TRK,(1)),UNIT=SYSDA
//SYSREC   DD   DSN=&&TEMP,
//         DISP=(NEW,DELETE,DELETE),
//         SPACE=(TRK,(1)),UNIT=SYSDA
//SYSIN    DD   DSN=DB2P.ISERIES.UNLOAD(&TS),DISP=SHR
//*-------------------------------------------------------------------  00080000
//*                                                                     00080000
//*-------------------------------------------------------------------  00080000
//FIXLOAD  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXLOAD &TS,&OWNER',     00210000
//          COND=EVEN
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00220000
//SYSPRINT DD   SYSOUT=*                                                00230000
//SYSTSPRT DD   SYSOUT=*                                                00240000
//SYSTSIN  DD   DUMMY                                                   00250000
//*INFILE   DD   DSN=DB2P.ISERIES.&TS..SYSPUNCH,DISP=OLD                00260000
//INFILE   DD   DSN=&&SYSPUNCH,DISP=(OLD,DELETE,DELETE)                 00260000
//*-------------------------------------------------------------------  00080000
//*                                                                     00080000
//*-------------------------------------------------------------------  00080000
//TERMUTIL EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=EVEN
//STEPLIB  DD   DSN=DB2.DSN610.SDSNEXIT,DISP=SHR
//         DD   DSN=DB2.DSN610.SDSNLOAD,DISP=SHR
//SYSOUT   DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSPRINT DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSTSIN  DD   DSN=DB2P.ISERIES.TERM.UTIL,DISP=SHR
// PEND                                                                 00270000
