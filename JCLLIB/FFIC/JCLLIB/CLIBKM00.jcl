//JOBNAME  JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,USER=DB2ACP4,
//         CLASS=L
/*JOBPARM Z=G,HOLD=ALL,S=ESYS,T=1439
//*--------------------------------------------------------------------
//* &DB., &TS., &DATE. - DB2 WILL AUTOMATICALLY REPLACE THESE VARIABLES
//* BY DATABASE-NAME, TABLESPACE-NAME AND JULIAN-DATE. DO NOT CHANGE
//* THESE VARIABLES.
//*
//*--------------------------------------------------------------------
//COPY      EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2J')
//STEPLIB   DD   DSN=DB2K.DB2LOAD,DISP=SHR
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//SYSIN    DD  *
  LISTDEF LSTTAB
     INCLUDE TABLESPACES DATABASE DCLI0M00 PARTLEVEL
--
  TEMPLATE TPLTAB
     DSN 'XXXX.XXXXXXX.IC0.&DB..&TS..D&DATE.'
     UNIT MAGV  RETPD 30
     STACK YES
     DISP (NEW,CATLG,DELETE)
--
  COPY LIST LSTTAB COPYDDN (TPLTAB) SHRLEVEL CHANGE
/*