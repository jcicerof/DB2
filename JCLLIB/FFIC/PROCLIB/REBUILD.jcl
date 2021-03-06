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
//* //STEP EXEC LOAD,DSN=DB2J,LIB=DB2K
//* //SYSIN DD *
//REBUILD  PROC DSN=NONE,LIB=NONE
//*------------------------------------------------------------------
//* LOAD
//*------------------------------------------------------------------
//REBUILD  EXEC PGM=DSNUTILB,PARM='&DSN',REGION=0M,TIME=1440
//STEPLIB  DD   DSN=&LIB..DB2LOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSDISC  DD   UNIT=(SYSDA,20),SPACE=(CYL,(100,250),RLSE)
//SYSUT1   DD   UNIT=(SYSDA,20),SPACE=(CYL,(500,250),RLSE)
//SORTOUT  DD   UNIT=(SYSDA,20),SPACE=(CYL,(500,250),RLSE)
//SYSMAP   DD   UNIT=(SYSDA,20),SPACE=(CYL,(500,250),RLSE)
//SYSERR   DD   UNIT=(SYSDA,20),SPACE=(CYL,(100,250),RLSE)
//SW01WK01 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW01WK02 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW01WK03 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW01WK04 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW02WK01 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW02WK02 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW02WK03 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW02WK04 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW03WK01 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW03WK02 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW03WK03 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW03WK04 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW04WK01 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW04WK02 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW04WK03 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SW04WK04 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SORTWK01 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SORTWK02 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SORTWK03 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
//SORTWK04 DD   UNIT=(SYSDA,20),SPACE=(CYL,(400,200),,,ROUND)
// PEND
