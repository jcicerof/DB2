//DB@COPY  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               00010000
//*                                                                     00020000
//         SET DSN=DB2P                                                 00030000
//*------------------------------------------------------------------   00040000
//* COPY                                                                00050000
//* EM CASO DE ABEND LIGAR 4347-5093 (CICERO-DBA)                       00051000
//*------------------------------------------------------------------   00060000
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                00070000
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00080000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00090000
//SYSPRINT DD   SYSOUT=*                                                00100000
//UTPRINT  DD   SYSOUT=*                                                00110000
//SYSUDUMP DD   SYSOUT=*                                                00120000
//SYSIN    DD   *                                                       00190000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200000
LISTDEF LISTA                                                           00210000
        INCLUDE TABLESPACE DBEETA.CNDGEVAL                              00279600
        INCLUDE TABLESPACE DBEETA.CONGENQ1                              00279700
        INCLUDE TABLESPACE DBEETA.CONGENQ2                              00279800
        INCLUDE TABLESPACE DBEETA.CONGENQ3                              00279900
                                                                        00283600
TEMPLATE DDCOPY                                                         00284600
         DSN(DB2PCOPY.FE.&DB..&TS..D&DT..HR&HO.&MI.)                    00284800
         UNIT=VSM                                                       00285000
         VOLCNT(255)                                                    00290000
         DISP(NEW,CATLG,DELETE)                                         00310000
         STACK YES                                                      00320000
                                                                        00321000
COPY LIST LISTA                                                         00330000
     SHRLEVEL REFERENCE                                                 00340000
     FULL YES                                                           00350000
     COPYDDN DDCOPY                                                     00360000
