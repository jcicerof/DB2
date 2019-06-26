//DB@CICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID,TYPRUN=SCAN   00010003
//*                                                                     00020000
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            00030002
//*------------------------------------------------------------------   00050000
//* LOAD                                                                00060000
//*------------------------------------------------------------------   00070000
//LOAD     EXEC PROC=LOAD,DSN=DSN                                       00080001
//SYSDISC  DD   DUMMY                                                   00180000
//SYSREC   DD   DUMMY                                                   00190000
//SYSIN    DD   *                                                       00200000
  LOAD DATA LOG NO REPLACE NOCOPYPEND                                   00210000
       INDDN SYSREC                                                     00220000
       INTO TABLE CREATOR.TABLENAME                                     00230001
       STATISTICS TABLE(ALL) INDEX(ALL)                                 00240000
