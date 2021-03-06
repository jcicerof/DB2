//JOBNAME  JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,USER=DB2ACP4,
//         CLASS=L
/*JOBPARM Z=G,HOLD=ALL,S=ESYS,T=1439
//*--------------------------------------------------------------------
//* THE DATASET NAME IT IS SURROUNDED BY APOSTROPHES (')
//*
//*--------------------------------------------------------------------
//RECOVER   EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2J')
//STEPLIB   DD   DSN=DB2K.DB2LOAD,DISP=SHR
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//SYSIN    DD  *
RECOVER TABLESPACE DIAP0M01.SCBS0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SCDS0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SMKN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SMLN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SMMN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SMNN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SMON0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SMZN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SNAN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SNBN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SNCN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SNEN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DIAP0M01.SNFN0M01 TOCOPY 'DATA-SET TO BE RECOVERED'
//*--------------------------------------------------------------------
//* REBUILD INDEXES
//*--------------------------------------------------------------------
//REBLDIX   EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2J')
//STEPLIB   DD   DSN=DB2K.DB2LOAD,DISP=SHR
//SW01WK01  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW01WK02  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW01WK03  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW01WK04  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW02WK01  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW02WK02  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW02WK03  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW02WK04  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW03WK01  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW03WK02  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW03WK03  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SW03WK04  DD UNIT=SYSDA,SPACE=(CYL,(800,200),,,ROUND)
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//SYSIN    DD  *
  LISTDEF DDRRECVIX
     INCLUDE INDEXSPACES DATABASE DIAP0M01 PARTLEVEL
  REBUILD INDEX
          LIST DDRRECVIX
          STATISTICS KEYCARD UPDATE ALL
          SORTDEVT SYSDA SORTNUM 12 SORTKEYS
//*
