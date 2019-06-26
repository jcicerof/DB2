//DB@RBL   JOB 'CICERO(R.5627)',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID       00010001
//*                                                                     00020000
//*------------------------------------------------------------------   00030000
//* REBUILD CADPARCL                                                    00040000
//*------------------------------------------------------------------   00050000
//REBUILD  PROC                                                         00060000
//REBUILD  EXEC PGM=DSNUTILB,PARM='&DSN'                                00070000
//STEPLIB  DD   DSN=DB2.DB2B.SDSNEXIT,DISP=SHR                          00080000
//         DD   DSN=DB2.DB2B.SDSNLOAD,DISP=SHR                          00090000
//SYSPRINT DD   SYSOUT=*                                                00100000
//UTPRINT  DD   SYSOUT=*                                                00110000
//SYSUDUMP DD   SYSOUT=*                                                00120000
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00130000
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00140000
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00150000
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00160000
//SYSDISC  DD   DUMMY                                                   00170000
//SYSREC   DD   DUMMY                                                   00180000
// PEND                                                                 00190000
//*                                                                     00200000
//CADPARCL EXEC PROC=REBUILD,DSN=DB2B                                   00210000
//SYSIN    DD   *                                                       00220000
 REBUILD INDEX (ANO2000.CADPARCL_IX1) STATISTICS UPDATE ALL             00230000
//CADPARCL EXEC PROC=REBUILD,DSN=DB2B                                   00240000
//SYSIN    DD   *                                                       00250000
 REBUILD INDEX (ANO2000.CADPARCL_IX2) STATISTICS UPDATE ALL             00260000
//CADPARCL EXEC PROC=REBUILD,DSN=DB2B                                   00270000
//SYSIN    DD   *                                                       00280000
 REBUILD INDEX (ANO2000.CADPARCL_IX3) STATISTICS UPDATE ALL             00290000
