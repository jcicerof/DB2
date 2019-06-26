//DB@UNLOA JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010003
//*                                                                     00020000
//         SET DSN=DB2P                                                 00030000
//*------------------------------------------------------------------   00050000
//* UNLOAD                                                              00060000
//*------------------------------------------------------------------   00070000
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN'                                00080000
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00090000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00100000
//SYSPRINT DD   SYSOUT=*                                                00110000
//UTPRINT  DD   SYSOUT=*                                                00120000
//SYSUDUMP DD   SYSOUT=*                                                00130000
//SYSIN    DD   *                                                       00200000
LISTDEF DBLIST  INCLUDE TABLESPACE DMRPRDB1.DMRPRTPS                    00200100
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00200300
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00200500
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00200600
   UNIT SYSDBA SPACE (1000,100) TRK DISP (NEW,CATLG,DELETE)             00200800
UNLOAD TABLESPACE DMRPRDB1.DMRPRTPS                                     00201502
       FROM TABLE DMRPR.DMRAPSUM HEADER NONE                            00201602
            (CDSENHA CHAR,                                              00201702
             CDSUCUR INTEGER EXTERNAL,                                  00201802
             NMDEPTO CHAR,                                              00201902
             CDUSUAR CHAR,                                              00202002
             NVACSUC CHAR,                                              00202102
             NVACIPA CHAR,                                              00202202
             NVACCOR CHAR,                                              00202302
             NVACAGE CHAR,                                              00202402
             CDSNHANT CHAR,                                             00202502
             DTALTER INTEGER EXTERNAL,                                  00202602
             CDCLSNH CHAR,                                              00202702
             FLAGGSI CHAR,                                              00202802
             DTALTER_CNV INTEGER EXTERNAL)                              00202902
       PUNCHDDN DDPUNCH                                                 00203000
       UNLDDN DDREC                                                     00203100
       SHRLEVEL CHANGE ISOLATION UR                                     00204000
