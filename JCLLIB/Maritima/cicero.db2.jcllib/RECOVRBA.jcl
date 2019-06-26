//DB@RECOV JOB   MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID                      00010003
//*-------------------------------------------------------------------  00020000
//*   RECOVER DE TABELAS VIA TOCOPY                                     00030000
//*------------------------------------------------------------------   00040000
//RECOVER  EXEC PGM=DSNUTILB,REGION=5M,                                 00060000
//         PARM='DB2P,RCV.RECIBO'                                       00070000
//SYSPRINT DD SYSOUT=*                                                  00080000
//UTPRINT  DD SYSOUT=*                                                  00090000
//SYSIN    DD *                                                         00120000
  RECOVER TABLESPACE DBEETA.PPIMOBSE TORBA X'08A4CE4153E6'              00130002
