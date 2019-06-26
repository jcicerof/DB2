//IBM1JCF0 JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//        JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//CHECK   EXEC CHECK,DSN=DB2J,LIB=DB2K
//SYSIN   DD *
CHECK DATA TABLESPACE DCURSO.SCURSO01 SCOPE ALL
