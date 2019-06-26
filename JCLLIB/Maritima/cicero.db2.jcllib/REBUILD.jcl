//DB@RBLD  JOB 'CICERO,R.5093',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID        00010014
//*                                                                     00011000
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            00020000
//INDEX01  EXEC PROC=REBUILD,DSN=DB2P                                   00030000
//SYSIN    DD   *                                                       00040000
 REBUILD INDEX (ALL) TABLESPACE DBMA01.SNITFDSP                         00041016
  STATISTICS KEYCARD UPDATE ALL                                         00042013
//                                                                      00042116
 REBUILD INDEX (MARHISTO.SSPROGLO_IX1)                                  00042216
  STATISTICS KEYCARD UPDATE ALL                                         00042316
 REBUILD INDEX (ALL) TABLESPACE DBMA01.SNITFDSP                         00042416
  STATISTICS KEYCARD UPDATE ALL                                         00042516
