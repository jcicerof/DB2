//DB@JU004 JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010006
//*                                                                     00020000
//DSNJU004 EXEC PGM=DSNJU004                                            00030001
//GROUP    DD   DSN=DB2PCAT.BSDS01,DISP=SHR                             00040003
//SYSPRINT DD   SYSOUT=*                                                00050000
//SYSIN    DD   *                                                       00060000
  MEMBER *                                                              00070000
