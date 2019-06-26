//DB@CICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID               00010002
//*                                                                     00020000
//         SET DSN=DB2T                                                 00030001
//         SET LIB=DB2.DB2T                                             00040000
//*------------------------------------------------------------------   00050000
//* EXEC SQL                                                            00060001
//*------------------------------------------------------------------   00070000
//EXECSQL  EXEC PGM=DSNUTILB,PARM='&DSN'                                00080001
//STEPLIB  DD   DSN=&LIB..SDSNEXIT,DISP=SHR                             00090000
//         DD   DSN=&LIB..SDSNLOAD,DISP=SHR                             00100000
//SYSPRINT DD   SYSOUT=*                                                00110000
//UTPRINT  DD   SYSOUT=*                                                00120000
//SYSUDUMP DD   SYSOUT=*                                                00130000
//SYSIN    DD   *                                                       00200000
  EXEC SQL                                                              00210001
       DECLARE C01 CURSOR FOR                                           00220001
          SELECT * FROM SYSIBM.SYSTABLES                                00230001
  ENDEXEC                                                               00240001
