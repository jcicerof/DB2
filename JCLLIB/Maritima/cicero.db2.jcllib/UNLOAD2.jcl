//DB@UNLO1 JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010029
//*                                                                     00020000
//         SET DSN=DB2P                                                 00030004
//*------------------------------------------------------------------   00050000
//* UNLOAD                                                              00060001
//*------------------------------------------------------------------   00070000
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN'                                00080001
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00090000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00100000
//SYSPRINT DD   SYSOUT=*                                                00110000
//UTPRINT  DD   SYSOUT=*                                                00120000
//SYSUDUMP DD   SYSOUT=*                                                00130000
//SYSIN    DD   *                                                       00200000
LISTDEF DBLIST                                                          00200124
               INCLUDE TABLESPACE  DBNOVA.CORRETOR                      00212236
                                                                        00216427
TEMPLATE DDPUNCH DSN(JONAS.UNL.&DB..&TS..PUNCH.D&DT.)                   00217536
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00217619
                                                                        00217727
TEMPLATE DDREC DSN(JONAS.UNL.&DB..&TS..REC.D&DT.)                       00217836
   UNIT SYSDBA SPACE (1000,1000) TRK DISP (NEW,CATLG,DELETE)            00217934
                                                                        00218127
UNLOAD LIST DBLIST                                                      00218219
       PUNCHDDN DDPUNCH                                                 00218319
       UNLDDN   DDREC                                                   00218424
       SHRLEVEL CHANGE ISOLATION UR                                     00218524
//*                                                                     00219025
