//DB@COPY  JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010004
//*                                                                     00020000
//*------------------------------------------------------------------   00040000
//* COPY                                                                00050000
//*------------------------------------------------------------------   00060000
//COPY     EXEC PGM=DSNUTILB,PARM='DB2P'                                00070002
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                          00080002
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                          00090002
//SYSPRINT DD   SYSOUT=*                                                00100000
//UTPRINT  DD   SYSOUT=*                                                00110000
//SYSUDUMP DD   SYSOUT=*                                                00120000
//SYSIN    DD   *                                                       00190000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200000
LISTDEF LISTA                                                           00211001
               INCLUDE TABLESPACE DBSS03.SSPROGLO                       00255005
               INCLUDE TABLESPACE DBSS03.SSVENPRE                       00256005
TEMPLATE DDCOPY                                                         00269200
         DSN('DB2PCOPY.FS1.&DB..&TS.(+1)')                              00270003
         UNIT=TAPV                                                      00280000
         VOLCNT(255)                                                    00290000
         DISP(NEW,CATLG,DELETE)                                         00310000
         STACK YES                                                      00320000
         GDGLIMIT(4)                                                    00321003
COPY LIST LISTA                                                         00330000
     SHRLEVEL REFERENCE                                                 00340000
     FULL YES                                                           00350000
     COPYDDN DDCOPY                                                     00360000
