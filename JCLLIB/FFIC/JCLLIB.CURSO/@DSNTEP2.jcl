//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,USER=DB2PROD
/*JOBPARM Z=O,L=9999,SYSAFF=ASYS,H=ALL,TIME=1440
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//         JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//DSNTEP2  EXEC DSNTEP2,DSN=DB2E,LIB=DB2F
//SYSIN    DD *
SELECT CT_CLM_SUB_OFF_NBR                                               00010000
     , CT_CLM_ATLAS_YR                                                  00020000
     , CT_CLM_SEQ_NBR                                                   00030000
     , COUNT(*)                                                         00040000
  FROM ERSPROD.MACT_CT_CLM_TRAUMA                                       00050000
 GROUP BY CT_CLM_SUB_OFF_NBR                                            00051000
        , CT_CLM_ATLAS_YR                                               00052000
        , CT_CLM_SEQ_NBR                                                00053000
 HAVING COUNT(*) > 1                                                    00054000
