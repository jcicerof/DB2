//**************************************************************
//QMFBAT   JOB
//S1       EXEC PGM=DSQQMFE,PARM='M=B,I=YOURQMFPROC'
//*
//*  PROGRAM LIBRARIES REQUIRED WHEN RUNNING IN BATCH
//*
//STEPLIB  DD  DSN=QMF710.SDSQLOAD,DISP=SHR
//         DD  DSN=DSN.SDSNEXIT,DISP=SHR
//         DD  DSN=DSN.SDSNLOAD,DISP=SHR
//         DD  DSN=GDDM.ADMLOAD,DISP=SHR
//*
//*  QMF/GDDM MAPS ARE REQUIRED WHEN RUNNING IN BATCH
//*
//ADMGGMAP DD  DSN=QMF710.DSQMAPE,DISP=SHR
//*
//*
//*  DATASETS USED BY QMR
//*
//DSQPRINT DD  SYSOUT=A,DCB=(RECFM=FBA,LRECL=133,BLKSIZE=1330)
//DSQDEBUG DD  SYSOUT=A,DCB=(RECFM=FBA,LRECL=121,BLKSIZE=1210)
//DSQUDUMP DD  SYSOUT=A,DCB=(RECFM=VBA,LRECL=125,BLKSIZE=1632)
//DSQSPILL DD  DSN=&&SPILL,DISP=(NEW,DELETE),
//  UNIT=SYSDA,SPACE=(TRK,(100),RLSE),
//  DCB=(RECFM=F,LRECL=4096,BLKSIZE=4096)
//*
//**************************************************************
