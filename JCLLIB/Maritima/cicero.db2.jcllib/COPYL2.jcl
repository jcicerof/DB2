//DB@COPY  JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010002
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
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00130000
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00140000
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00150000
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00160000
//*SYSDISC  DD   DUMMY                                                  00170000
//*SYSREC   DD   DUMMY                                                  00180000
//SYSIN    DD   *                                                       00190000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200000
LISTDEF DBLISTA                                                         00210001
            INCLUDE TABLESPACE DBEEGD.LGRGTORC                          00259501
            INCLUDE TABLESPACE DBEEGD.LGRGTPPS                          00259601
            INCLUDE TABLESPACE DBEEGD.LGRGTSGR                          00259701
TEMPLATE DDCOPY                                                         00275000
         DSN(DB2PCOPY.FE.&DB..&TS..D&DT..HR&HO.&MI.)                    00276000
         UNIT=VSM                                                       00280000
         VOLCNT(255)                                                    00290000
         RETPD 60                                                       00300000
         DISP(NEW,CATLG,DELETE)                                         00310000
         STACK YES                                                      00320000
COPY LIST DBLISTA                                                       00330001
     SHRLEVEL REFERENCE                                                 00340000
     FULL YES                                                           00350000
     COPYDDN DDCOPY                                                     00360000
