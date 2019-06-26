//IBM1JCF2 JOB (T00101,610,Z000900,000,A11,000),'RUNSTATS  *',
//         NOTIFY=IBM1JCF
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*
//*--------------------------------------------------------------------
//* STEP LOAD0: LOAD TABLES
//*--------------------------------------------------------------------
//COPY2COP EXEC DSNUPROC,SYSTEM=DB2J,
//             LIB='DB2S.DB2LOAD',
//             UID=''
//DSNUPROC.SYSIN DD *
  LISTDEF LISTDB
          INCLUDE TABLESPACE DCURSO.SCURSO00

  TEMPLATE TOCOPY
     DSN 'DBA5.DB2.STACK.&DB..&TS..&UQ.'
     UNIT MAGV
     STACK YES
     DISP (NEW,CATLG,DELETE)

  COPY LIST LISTDB COPYDDN(TOCOPY) FULL YES SHRLEVEL CHANGE
