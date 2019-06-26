//DB@CHECK JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID TYPRUN=SCAN   00010005
//*                                                                     00020000
//         SET  DSN=DB2P                                                00030000
//*------------------------------------------------------------------   00060000
//* CHECK DATA                                                          00070000
//*------------------------------------------------------------------   00080000
//CHECK    EXEC PGM=DSNUTILB,PARM='&DSN',COND=EVEN                      00090000
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00100000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00110000
//SYSPRINT DD   SYSOUT=*                                                00120000
//UTPRINT  DD   SYSOUT=*                                                00130000
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(200,100),RLSE)                   00150000
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00151004
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00160004
//SYSIN    DD   *                                                       00170000
CHECK DATA TABLESPACE DBWPC1.WPCUSRPF SCOPE ALL                         00180007
