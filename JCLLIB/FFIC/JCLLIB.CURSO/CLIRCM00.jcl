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
RECOVER TABLESPACE DCLI0M00.SCDN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SCEN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SCFN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SCGN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEAN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEBN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SECN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEDN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEEN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEFN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEGN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEHN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEIN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEKN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEON0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEPN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEVN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEWN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SEZN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SFEN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
RECOVER TABLESPACE DCLI0M00.SPTN0M00 TOCOPY 'DATA-SET TO BE RECOVERED'
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
     INCLUDE INDEXSPACES DATABASE DCLI0M00 PARTLEVEL
  REBUILD INDEX
          LIST DDRRECVIX
          STATISTICS KEYCARD UPDATE ALL
          SORTDEVT SYSDA SORTNUM 12 SORTKEYS
//*
