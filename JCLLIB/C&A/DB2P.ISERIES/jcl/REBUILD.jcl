//SDB801I0  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,            JOB17592
// USER=BR#JCSF,PASSWORD=
//         SET PRI=1500,
//             SEC=700,
//             DSN=DB2P
//*            TS=EQ034T
//*------------------------------------------------------------------
//* REBUILD
//*------------------------------------------------------------------
//EQ034I   EXEC PGM=DSNUTILB,PARM='&DSN,REBUILD.EQ034I',COND=EVEN
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
//SYSIN    DD   *
  REBUILD INDEX(PROD.EQ034I) SORTKEYS STATISTICS UPDATE ALL
//*
//SDB801I1  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,            JOB17592
// USER=BR#JCSF,PASSWORD=
//         SET PRI=1500,
//             SEC=700,
//             DSN=DB2P
//*            TS=EQ034T
//*------------------------------------------------------------------
//* REBUILD
//*------------------------------------------------------------------
//EQ034I1  EXEC PGM=DSNUTILB,PARM='&DSN,REBUILD.EQ034I1',COND=EVEN
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
//SYSIN    DD   *
  REBUILD INDEX(PROD.EQ034I_1) SORTKEYS STATISTICS UPDATE ALL
