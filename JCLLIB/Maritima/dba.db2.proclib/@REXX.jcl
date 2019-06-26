//DBBCICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID TYPRUN=SCAN   00001003
//*                                                                     00002001
//         JCLLIB ORDER=(CICERO.DB2.REXX)                               00003004
//*                                                                     00004001
//FIXLOAD  PROC REXXLIB=CICERO.DB2.PROCLIB                              00080001
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//*-------------------------------------------------------------------  00110000
//FIXLOAD  EXEC PGM=IKJEFT1A,DYNAMNBR=20,PARM='RXLOAD' ** &OWNER'       00120000
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00130000
//SYSPRINT DD   SYSOUT=*                                                00140000
//SYSTSPRT DD   SYSOUT=*                                                00150000
//SYSTSIN  DD   DUMMY                                                   00160000
//SYSPUNCH DD   DSN=DBH.FE.DBSS01.REGLOCAL.PUNCH.D2007019,DISP=OLD      00170003
//EDTPUNCH DD   SYSOUT=*                                                00171000
// PEND                                                                 00180000
//*                                                                     00190000
//FIXLOAD  EXEC FIXLOAD                                                 00200000
