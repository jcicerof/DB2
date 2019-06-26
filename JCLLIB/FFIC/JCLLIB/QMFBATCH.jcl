//********************************************************************
//*   BATCH QMF PROC                                                 *
//*   15/07/2011 PROC CREATION                                       *
//********************************************************************
//*                                                                  *
//QMFBATCH    PROC SIZE=4096K,            REGION SIZE.
//            DB2HLV=DB2Z,                DB2 SUBSYS LIB HILEVEL
//            CPUTIME=240,                CPU TIME MINUTES.
//            RECL=133,                   DSQPRINT LRECL.
//            RECFMT=FBA                  DSQPRINT RECFM.
//*
//STEP01      EXEC PGM=IKJEFT1A,DYNAMNBR=80,REGION=&SIZE,TIME=&CPUTIME
//*
//STEPLIB     DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQLOAD
//            DD   DISP=SHR,DSN=&DB2HLV..DB2EXIT
//            DD   DISP=SHR,DSN=&DB2HLV..DB2LOAD
//*
//SYSPROC     DD   DISP=SHR,DSN=&DB2HLV..DB2CLIST
//            DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQCLSTE
//***         DD   DISP=SHR,DSN=DB00.STS1.CLIST     ADD'L CLIST LIB.
//*
//SYSEXEC     DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQEXECE
//*
//SYSPRINT    DD   SYSOUT=*
//SYSTSPRT    DD   SYSOUT=*
//SYSUDUMP    DD   DUMMY
//SYSABEND    DD   DUMMY
//*
//ISPPLIB     DD   DISP=SHR,DSN=&DB2HLV..DB2ISPFP
//            DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQPLIBE
//            DD   DISP=SHR,DSN=SYS8.ISR.ISRPLIB
//*
//ISPMLIB     DD   DISP=SHR,DSN=&DB2HLV..DB2ISPFM
//            DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQMLIBE
//            DD   DISP=SHR,DSN=SYS8.ISR.ISRMLIB
//*
//ISPTLIB     DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQTLIBE
//            DD   DISP=SHR,DSN=SYS8.ISR.ISRTLIB
//*
//ISPSLIB     DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQSLIBE
//            DD   DISP=SHR,DSN=SYS8.ISR.ISRSLIB
//*
//ISPPROF     DD   UNIT=SYSDA,
//         SPACE=(TRK,(3,1,4)),
//         DCB=(LRECL=80,BLKSIZE=9040,RECFM=FB)
//*
//SYSHELP     DD   DISP=SHR,DSN=SYS1.HELP
//*           DD   DISP=SHR,DSN=SYS1.SHELP
//*
//ADMGGMAP    DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQMAPE
//*
//ADMCFORM    DD   DISP=SHR,DSN=&DB2HLV..QMF.DSQCHART
//*
//*ADMSYMBL    DD   DISP=SHR,DSN=SYSE.GDDMSYM     DON'T NEED IN BATCH?
//*
//ADMPRNTQ    DD   DISP=SHR,DSN=SYSE.ADMPRINT.REQUEST.QUEUE
//*
//DSQPRINT    DD   SYSOUT=*,LRECL=&RECL,RECFM=&RECFMT
//*
//DSQDEBUG    DD   SYSOUT=*,LRECL=121
//*
//DSQUDUMP    DD   SYSOUT=*,LRECL=125
//*
//DSQSPILL    DD   DSN=&&SPILL,
//         DISP=(,DELETE),UNIT=SYSDA,
//         SPACE=(CYL,(1,25),RLSE),
//         DCB=(RECFM=F,LRECL=4096,BLKSIZE=0)
//*
//SYSTSIN     DD   DUMMY
//*
