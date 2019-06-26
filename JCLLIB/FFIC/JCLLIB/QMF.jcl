//IBM1JCFQ JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=O,TYPRUN=SCAN            USER=DB2PROD
/*JOBPARM Z=O,L=9999,SYSAFF=ESYS,H=ALL,TIME=1440
//*------------------------------------------------------------------*
//*   BATCH QMF PROC                                                 *
//*   17/11/2011 PROC CREATION                                       *
//*------------------------------------------------------------------*
//PROCLIB  JCLLIB ORDER=IBM1JCF.DB2.JCLLIB
//*                                                                  *
//QMFBH EXEC QMFBATCH,SIZE=4096K,         REGION SIZE.
//            DB2HLV=DB2H,                DB2 SUBSYS LIB HILEVEL
//            CPUTIME=240,                CPU TIME MINUTES.
//            RECL=133,                   DSQPRINT LRECL.
//            RECFMT=FBA                  DSQPRINT RECFM.
//SYSTSIN  DD *                           QMF/TSO INPUT STMTS
  EXECUTIL SEARCHDD(YES)
   ISPSTART PGM(DSQQMFE) NEWAPPL(DSQE)  +
   PARM(M=B,S=DB2H,I=IBM1LLJ.QMFBATCH_TEST)
   END
/*
