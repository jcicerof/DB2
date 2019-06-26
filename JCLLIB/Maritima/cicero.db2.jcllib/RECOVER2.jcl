//DB@DSNTI JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               00001001
//*                                                                     00001100
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            00001201
//         SET DSN=DB2P                                                 00001400
//*------------------------------------------------------------------   00001500
//* COPY                                                                00001600
//*------------------------------------------------------------------   00001700
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                00001800
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00001900
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00002000
//SYSPRINT DD   SYSOUT=*                                                00003000
//UTPRINT  DD   SYSOUT=*                                                00004000
//SYSUDUMP DD   SYSOUT=*                                                00005000
//SYSIN    DD   *                                                       00009300
OPTIONS EVENT(ITEMERROR, SKIP)                                          00009400
LISTDEF LISTA                                                           00009500
               INCLUDE TABLESPACE DBNOVA.CORRETOR                       00009602
TEMPLATE DDCOPY                                                         00009800
         DSN(DB2PCOPY.FE1.&DB..&TS..D&DT..HR&HO.&MI.)                   00009900
         UNIT=VSM                                                       00010000
         VOLCNT(255)                                                    00010100
         DISP(NEW,CATLG,DELETE)                                         00010200
         STACK YES                                                      00010300
COPY LIST LISTA                                                         00010400
     SHRLEVEL REFERENCE                                                 00010500
     FULL YES                                                           00010600
     COPYDDN DDCOPY                                                     00010700
//*------------------------------------------------------------------   00010800
//* RECOVER                                                             00011000
//*------------------------------------------------------------------   00020000
//RECOVER  EXEC PGM=DSNUTILB,PARM='&DSN'                                00030002
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00030100
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00030200
//SYSPRINT DD  SYSOUT=*                                                 00040000
//SYSOUT   DD  SYSOUT=*                                                 00050000
//SYSIN    DD  *                                                        00090000
  RECOVER TABLESPACE DBNOVA.CORRETOR                                    00100002
   TORBA  X'0A9A19809B7A'                                               00100102
//*------------------------------------------------------------------   00102000
//* COPY                                                                00103000
//*------------------------------------------------------------------   00104000
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                00105000
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00106000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00107000
//SYSPRINT DD   SYSOUT=*                                                00108000
//UTPRINT  DD   SYSOUT=*                                                00109000
//SYSUDUMP DD   SYSOUT=*                                                00110000
//SYSIN    DD   *                                                       00120000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00130000
LISTDEF LISTA                                                           00140000
               INCLUDE TABLESPACE DBNOVA.CORRETOR                       00150002
TEMPLATE DDCOPY                                                         00170000
         DSN(DB2PCOPY.FE2.&DB..&TS..D&DT..HR&HO.&MI.)                   00180001
         UNIT=VSM                                                       00190000
         VOLCNT(255)                                                    00200000
         DISP(NEW,CATLG,DELETE)                                         00210000
         STACK YES                                                      00220000
COPY LIST LISTA                                                         00230000
     SHRLEVEL REFERENCE                                                 00240000
     FULL YES                                                           00250000
     COPYDDN DDCOPY                                                     00260000
//*------------------------------------------------------------------   00270001
//* REBUILD INDEX                                                       00280001
//*------------------------------------------------------------------   00281001
//INDEX01  EXEC PROC=REBUILD,DSN='&DSN'                                 00300002
//SYSIN    DD   *                                                       00310001
 REBUILD INDEX (ALL) TABLESPACE DBNOVA.CORRETOR                         00320002
  STATISTICS KEYCARD UPDATE ALL                                         00330001
//*------------------------------------------------------------------   00390001
//* RUNSTATS                                                            00400001
//*------------------------------------------------------------------   00410001
//RUNSTATS EXEC PGM=DSNUTILB,PARM='&DSN'                                00420001
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00430001
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00440001
//SYSPRINT DD   SYSOUT=*                                                00450001
//UTPRINT  DD   SYSOUT=*                                                00460001
//SYSUDUMP DD   SYSOUT=*                                                00470001
//SYSIN    DD   *                                                       00480001
LISTDEF DBLIST                                                          00490001
                    INCLUDE TABLESPACE (DBNOVA.CORRETOR)                00500002
RUNSTATS TABLESPACE  LIST DBLIST                                        00550001
         TABLE(ALL) INDEX(ALL)                                          00560001
         KEYCARD FREQVAL NUMCOLS 5 COUNT 50                             00570001
          UPDATE ALL HISTORY ALL                                        00580002
         SHRLEVEL CHANGE                                                00590001
//*                                                                     00600001
