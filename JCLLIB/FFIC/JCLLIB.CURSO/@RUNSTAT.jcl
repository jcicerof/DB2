//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF USER=DB2PROD
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//        JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//RUNSTATS EXEC RUNSTATS,DSN=DB2D,LIB=DB2S
//SYSIN DD *
  LISTDEF LSTTAB
                    INCLUDE TABLESPACE DEIS0A00.SEPN0A01
                    INCLUDE TABLESPACE DEIS0T00.SEPN0T01

  RUNSTATS TABLESPACE LIST LSTTAB
    SHRLEVEL CHANGE
    TABLE(ALL) INDEX(ALL) UPDATE ALL
