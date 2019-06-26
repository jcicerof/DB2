**ATENCAO
**ATENCAO DOIS JOBS INLINE
**ATENCAO
//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,USER=DB2PROD
/*JOBPARM Z=O,L=9999,SYSAFF=ESYS,H=ALL,TIME=1440
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
//DSNTEP2  EXEC DSNTEP2,DSN=DB2D,LIB=DB2S
//SYSIN    DD *
SELECT * FROM SYSIBM.SYSSTOGROUP                                        00010013
 WHERE VCATNAME = 'FRGDT'                                               00020013
;                                                                       00030014
SELECT * FROM SYSIBM.SYSTABLEPART                                       00040014
 WHERE STORNAME IN (SELECT NAME FROM SYSIBM.SYSSTOGROUP                 00050014
                     WHERE VCATNAME = 'FRGDT')                          00060014
;                                                                       00070014
//IBM1JCFB JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
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
//DSNTEP2  EXEC DSNTEP2,DSN=DB2Q,LIB=DB2R
//SYSIN    DD *
SELECT * FROM SYSIBM.SYSSTOGROUP                                        00010013
 WHERE VCATNAME = 'PSPDA'                                               00020013
;                                                                       00030014
SELECT * FROM SYSIBM.SYSTABLEPART                                       00040014
 WHERE STORNAME IN (SELECT NAME FROM SYSIBM.SYSSTOGROUP                 00050014
                     WHERE VCATNAME = 'PSPDA')                          00060014
;                                                                       00070014
