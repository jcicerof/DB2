//DB@COPY  JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID,TYPRUN=HOLD   00010005
//*                                                                     00020000
//         SET DSN=DB2P                                                 00030000
//*------------------------------------------------------------------   00040000
//* COPY                                                                00050000
//*------------------------------------------------------------------   00060000
//COPY     EXEC PGM=DSNUTILB,PARM='DB2P'                                00070003
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                          00080003
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                          00090003
//SYSPRINT DD   SYSOUT=*                                                00100000
//UTPRINT  DD   SYSOUT=*                                                00110000
//SYSUDUMP DD   SYSOUT=*                                                00120000
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00130000
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00140000
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00150000
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00160000
//SYSIN    DD   *                                                       00190000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200000
LISTDEF LISTA  INCLUDE TABLESPACE DBSS01.SSLIMSEG                       00210004
TEMPLATE DDCOPY                                                         00260000
         DSN(DB2PCOPY.FE.&DB..&TS..GENIS.#1174669)                      00270004
         UNIT=TAPV                                                      00280000
         VOLCNT(255)                                                    00290000
         RETPD 9                                                        00300004
         DISP(NEW,CATLG,DELETE)                                         00310000
         STACK YES                                                      00320000
COPY LIST LISTA                                                         00330000
     SHRLEVEL REFERENCE                                                 00340000
     FULL YES                                                           00350000
     COPYDDN DDCOPY                                                     00360000
