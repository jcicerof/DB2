//UNLOAD   PROC TS=NONE
//UNLOAD   EXEC PGM=DSNUTILB,PARM='DB2P',COND=EVEN
//STEPLIB  DD   DSN=DB2.DSN610.SDSNEXIT,DISP=SHR
//         DD   DSN=DB2.DSN610.SDSNLOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSOUT   DD   SYSOUT=*
//SYSPUNCH DD   DSN=DB2P.ISERIES.&TS..SYSPUNCH,
//         DISP=(,CATLG,CATLG),
//         SPACE=(TRK,(1)),UNIT=SYSDA
//SYSREC   DD   DSN=&&TEMP,
//         DISP=(,DELETE,DELETE),
//         SPACE=(TRK,(1)),UNIT=SYSDA
//SYSIN    DD   DSN=DB2P.ISERIES.UNLOAD(&TS),DISP=SHR
// PEND
