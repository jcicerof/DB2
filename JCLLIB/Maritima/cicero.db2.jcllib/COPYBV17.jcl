//DB@COPY  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID,TYPRUN=HOLD   00010003
//*                                                                     00020000
//         SET DSN=DB2P                                                 00030000
//*------------------------------------------------------------------   00040000
//* COPY                                                                00050000
//*------------------------------------------------------------------   00060000
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                00070000
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00080000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00090000
//SYSPRINT DD   SYSOUT=*                                                00100000
//UTPRINT  DD   SYSOUT=*                                                00110000
//SYSUDUMP DD   SYSOUT=*                                                00120000
//SYSIN    DD   *                                                       00190000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200000
LISTDEF DBLIST                                                          00210001
        INCLUDE TABLESPACE DBSS01.SSITEGLO                              00220003
        INCLUDE TABLESPACE DBSS01.SSMEDMAT                              00230003
        INCLUDE TABLESPACE DBSS01.SSPROGLO                              00240003
                                                                        00283600
TEMPLATE DDCOPY                                                         00284600
         DSN(DB2PCOPY.FE.&DB..&TS..D&DT..HR&HO.&MI.)                    00284700
         UNIT=VSM                                                       00285000
         VOLCNT(255)                                                    00290000
         DISP(NEW,CATLG,DELETE)                                         00310000
         STACK YES                                                      00320000
                                                                        00321000
COPY LIST DBLIST                                                        00330001
     SHRLEVEL CHANGE                                                    00340003
     FULL YES                                                           00350000
     COPYDDN DDCOPY                                                     00360000
