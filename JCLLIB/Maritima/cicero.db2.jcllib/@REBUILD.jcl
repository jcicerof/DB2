//DB@RBLD1 JOB 'CICERO,R.5093',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID        00010019
//*                                                                     00011000
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            00020000
//INDEX01  EXEC PROC=REBUILD,DSN=DB2P                                   00030000
//SYSIN    DD   *                                                       00040000
 REBUILD INDEX (TECINFOR.ORCITEFORPGTRMO_PK)                            00520020
  STATISTICS KEYCARD UPDATE ALL                                         00521016
