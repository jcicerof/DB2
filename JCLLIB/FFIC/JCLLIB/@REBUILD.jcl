//IBM1JCF0 JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,USER=DB2TEST,
//         CLASS=L,NOTIFY=IBM1JCF
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
//        JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//*------------------------------------------------------------------
//REBUIL1 EXEC REBUILD,DSN=DB2D,LIB=DB2S,COND=EVEN
//SYSIN   DD *
REBUILD INDEX(ALL) TABLESPACE DCIA0B66.SCIS6B30
        STATISTICS KEYCARD UPDATE ALL
//
//
//REBUIL2 EXEC REBUILD,DSN=DB2J,LIB=DB2K,COND=EVEN
//SYSIN   DD *
REBUILD INDEX(DB2TEST.XBS00B02) STATISTICS KEYCARD UPDATE ALL
//REBUIL3 EXEC REBUILD,DSN=DB2J,LIB=DB2K,COND=EVEN
//SYSIN   DD *
REBUILD INDEX(DB2TEST.XBS00B03) STATISTICS KEYCARD UPDATE ALL
//REBUIL4 EXEC REBUILD,DSN=DB2J,LIB=DB2K,COND=EVEN
//SYSIN   DD *
REBUILD INDEX(DB2TEST.XBS00T01) STATISTICS KEYCARD UPDATE ALL
