//*--------------------------------------------------------------------
//* DB2A DB2A.DB2RUNLB
//* DB2D DB2S.DB2RUNLB
//* DB2J DB2K.DB2RUNLB
//* DB2E DB2F.DB2RUNLB
//* DB2H DB2H.DB2RUNLB
//* DB2P DB2C.DB2RUNLB
//* DB2Q DB2R.DB2RUNLB
//*
//* SET
//* //PROCLIB JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//* //STEP EXEC UNLOAD,DSN=DB2J,LIB=DB2K
//* //SYSIN DD *
//UNLOAD   PROC DSN=NONE,LIB=NONE
//*------------------------------------------------------------------
//* UNLOAD
//*------------------------------------------------------------------
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN',REGION=0M,TIME=1440
//STEPLIB  DD   DSN=&LIB..DB2LOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSMAP   DD   UNIT=(SYSDA,20),SPACE=(CYL,(500,250),RLSE)
//SYSERR   DD   UNIT=(SYSDA,20),SPACE=(CYL,(100,250),RLSE)
// PEND
