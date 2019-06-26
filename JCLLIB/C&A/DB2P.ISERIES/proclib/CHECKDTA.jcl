//CHECKDTA PROC DSN=NONE,
//             TS=NONE,
//             PRI=1500,
//             SEC=700
//*------------------------------------------------------------------
//* LOAD
//*------------------------------------------------------------------
//CHECKDTA EXEC PGM=DSNUTILB,PARM='&DSN,CHECK.&TS'
//STEPLIB  DD   DSN=DB2.DSN610.SDSNEXIT,DISP=SHR
//         DD   DSN=DB2.DSN610.SDSNLOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(50,10),RLSE)
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(&PRI,&SEC),RLSE)
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(50,10),RLSE)
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(&PRI,&SEC),RLSE)
//SYSIN    DD   DSN=DB2P.ISERIES.CHECKDTA(&TS),DISP=SHR
// PEND
