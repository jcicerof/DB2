//LOAD     PROC DSN=NONE,
//             TS=NONE,
//             PRI=1500,
//             SEC=700
//*------------------------------------------------------------------
//* LOAD
//*------------------------------------------------------------------
//LOAD     EXEC PGM=DSNUTILB,PARM='&DSN,LOAD.&TS'
//STEPLIB  DD   DSN=DB2.DSN610.SDSNEXIT,DISP=SHR
//         DD   DSN=DB2.DSN610.SDSNLOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(250,100),RLSE)
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(&PRI,&SEC),RLSE)
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(250,100),RLSE)
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(&PRI,&SEC),RLSE)
//SYSDISC  DD   DUMMY
//*SYSDISC  DD   DSN=DRP.SYSDISC.&TS,DISP=(,CATLG,DELETE),
//*         UNIT=SYSDA,SPACE=(CYL,(50,10),RLSE)
//SYSREC   DD   DSN=DRP.UNLDI5.&TS,DISP=SHR
//SYSIN    DD   DSN=DB2P.ISERIES.LOAD(&TS),DISP=SHR
// PEND
