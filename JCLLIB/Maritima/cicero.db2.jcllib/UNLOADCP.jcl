//DB@UNLOA JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010008
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
OPTIONS EVENT(ITEMERROR, SKIP)                                          00201006
TEMPLATE SPUNCH  DSN(CICERO.UNL.&DB..&TS..PUN.D&DT.)                    00201110
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00201210
TEMPLATE SREC    DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                    00201310
   UNIT SYSDBA SPACE (5000,5000) TRK DISP (NEW,CATLG,DELETE)            00201412
                                                                        00201610
UNLOAD TABLESPACE DBNOVA.CADAPOL                                        00201712
       FROMCOPY DB2PCOPY.FM1.DBNOVA.CADAPOL.P0.G0199V00                 00201812
       UNLDDN SREC    PUNCHDDN SPUNCH  SHRLEVEL REFERENCE               00201910
                                                                        00202010
UNLOAD TABLESPACE DBNOVA.CADPARCL                                       00202112
       FROMCOPY DB2PCOPY.FM1.DBNOVA.CADPARCL.P0.G0212V00                00202212
       UNLDDN SREC    PUNCHDDN SPUNCH  SHRLEVEL REFERENCE               00202310
                                                                        00202412
UNLOAD TABLESPACE DBMA02.ENDERSEG                                       00202512
       FROMCOPY DB2PCOPY.FS1.DBMA02.ENDERSEG.P0.G0768V00                00202612
       UNLDDN SREC    PUNCHDDN SPUNCH  SHRLEVEL REFERENCE               00202712
                                                                        00202812
UNLOAD TABLESPACE DBMA02.SEGURADO                                       00202912
       FROMCOPY DB2PCOPY.FS1.DBMA02.SEGURADO.P0.G0766V00                00203012
       UNLDDN SREC    PUNCHDDN SPUNCH  SHRLEVEL REFERENCE               00203112
//                                                                      00203212
TEMPLATE PUN0107 DSN(CICERO.UNL.&DB..&TS..PUN0107.D&DT.)                00203312
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00203412
TEMPLATE PUN0207 DSN(CICERO.UNL.&DB..&TS..PUN0207.D&DT.)                00203512
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00203612
TEMPLATE PUN0307 DSN(CICERO.UNL.&DB..&TS..PUN0307.D&DT.)                00203712
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00203812
TEMPLATE PUN0407 DSN(CICERO.UNL.&DB..&TS..PUN0407.D&DT.)                00203912
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00204012
TEMPLATE PUN0507 DSN(CICERO.UNL.&DB..&TS..PUN0507.D&DT.)                00204112
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00204212
TEMPLATE PUN0607 DSN(CICERO.UNL.&DB..&TS..PUN0607.D&DT.)                00204312
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00204412
TEMPLATE PUN0707 DSN(CICERO.UNL.&DB..&TS..PUN0707.D&DT.)                00204512
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00204612
TEMPLATE PUN0807 DSN(CICERO.UNL.&DB..&TS..PUN0807.D&DT.)                00204712
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00204812
TEMPLATE PUN0907 DSN(CICERO.UNL.&DB..&TS..PUN0907.D&DT.)                00204912
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00205012
TEMPLATE PUN1007 DSN(CICERO.UNL.&DB..&TS..PUN1007.D&DT.)                00205112
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00205212
TEMPLATE PUN1107 DSN(CICERO.UNL.&DB..&TS..PUN1107.D&DT.)                00205312
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00205412
TEMPLATE PUN1207 DSN(CICERO.UNL.&DB..&TS..PUN1207.D&DT.)                00205512
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00205612
TEMPLATE PUN0108 DSN(CICERO.UNL.&DB..&TS..PUN0108.D&DT.)                00205712
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00205812
TEMPLATE PUN0208 DSN(CICERO.UNL.&DB..&TS..PUN0208.D&DT.)                00205912
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00206012
TEMPLATE PUN0308 DSN(CICERO.UNL.&DB..&TS..PUN0308.D&DT.)                00206112
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00206212
TEMPLATE PUN0408 DSN(CICERO.UNL.&DB..&TS..PUN0408.D&DT.)                00206312
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00206412
                                                                        00206512
TEMPLATE REC0107 DSN(CICERO.UNL.&DB..&TS..REC0107.D&DT.)                00206612
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00206712
TEMPLATE REC0207 DSN(CICERO.UNL.&DB..&TS..REC0207.D&DT.)                00206812
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00206912
TEMPLATE REC0307 DSN(CICERO.UNL.&DB..&TS..REC0307.D&DT.)                00207012
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00207112
TEMPLATE REC0407 DSN(CICERO.UNL.&DB..&TS..REC0407.D&DT.)                00207212
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00207312
TEMPLATE REC0507 DSN(CICERO.UNL.&DB..&TS..REC0507.D&DT.)                00207412
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00207512
TEMPLATE REC0607 DSN(CICERO.UNL.&DB..&TS..REC0607.D&DT.)                00207612
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00207712
TEMPLATE REC0707 DSN(CICERO.UNL.&DB..&TS..REC0707.D&DT.)                00207812
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00207912
TEMPLATE REC0807 DSN(CICERO.UNL.&DB..&TS..REC0807.D&DT.)                00208012
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00208112
TEMPLATE REC0907 DSN(CICERO.UNL.&DB..&TS..REC0907.D&DT.)                00208212
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00208312
TEMPLATE REC1007 DSN(CICERO.UNL.&DB..&TS..REC1007.D&DT.)                00208412
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00208512
TEMPLATE REC1107 DSN(CICERO.UNL.&DB..&TS..REC1107.D&DT.)                00208612
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00208712
TEMPLATE REC1207 DSN(CICERO.UNL.&DB..&TS..REC1207.D&DT.)                00208812
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00208912
TEMPLATE REC0108 DSN(CICERO.UNL.&DB..&TS..REC0108.D&DT.)                00209012
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00209112
TEMPLATE REC0208 DSN(CICERO.UNL.&DB..&TS..REC0208.D&DT.)                00209212
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00209312
TEMPLATE REC0308 DSN(CICERO.UNL.&DB..&TS..REC0308.D&DT.)                00209412
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00209512
TEMPLATE REC0408 DSN(CICERO.UNL.&DB..&TS..REC0408.D&DT.)                00209612
   UNIT SYSDBA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)             00209712
                                                                        00209812
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00209912
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0594V00                00210012
       UNLDDN REC0408 PUNCHDDN PUN0408 SHRLEVEL REFERENCE               00210112
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00210212
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0590V00                00210312
       UNLDDN REC0308 PUNCHDDN PUN0308 SHRLEVEL REFERENCE               00210412
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00210512
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0586V00                00210612
       UNLDDN REC0208 PUNCHDDN PUN0208 SHRLEVEL REFERENCE               00210712
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00210812
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0583V00                00210912
       UNLDDN REC0108 PUNCHDDN PUN0108 SHRLEVEL REFERENCE               00211012
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00211112
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0579V00                00211212
       UNLDDN REC1207 PUNCHDDN PUN1207 SHRLEVEL REFERENCE               00211312
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00211412
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0575V00                00211512
       UNLDDN REC1107 PUNCHDDN PUN1107 SHRLEVEL REFERENCE               00211612
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00211712
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0571V00                00211812
       UNLDDN REC1007 PUNCHDDN PUN1007 SHRLEVEL REFERENCE               00211912
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00212012
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0567V00                00212112
       UNLDDN REC0907 PUNCHDDN PUN0907 SHRLEVEL REFERENCE               00212212
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00212312
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0562V00                00212412
       UNLDDN REC0807 PUNCHDDN PUN0807 SHRLEVEL REFERENCE               00212512
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00212612
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0558V00                00212712
       UNLDDN REC0707 PUNCHDDN PUN0707 SHRLEVEL REFERENCE               00212812
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00212912
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0553V00                00213012
       UNLDDN REC0607 PUNCHDDN PUN0607 SHRLEVEL REFERENCE               00213112
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00213212
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0549V00                00213312
       UNLDDN REC0507 PUNCHDDN PUN0507 SHRLEVEL REFERENCE               00213412
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00213512
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0545V00                00213612
       UNLDDN REC0407 PUNCHDDN PUN0407 SHRLEVEL REFERENCE               00213712
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00213812
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0540V00                00213912
       UNLDDN REC0307 PUNCHDDN PUN0307 SHRLEVEL REFERENCE               00214012
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00214112
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0536V00                00214212
       UNLDDN REC0207 PUNCHDDN PUN0207 SHRLEVEL REFERENCE               00214312
UNLOAD TABLESPACE DBSS02.SSCOREPE                                       00214412
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSCOREPE.P0.G0533V00                00214512
       UNLDDN REC0107 PUNCHDDN PUN0107 SHRLEVEL REFERENCE               00214612
//                                                                      00214712
OPTIONS EVENT(ITEMERROR, SKIP)                                          00214812
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00214912
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00215012
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00215112
   DISP (NEW,CATLG,DELETE) UNIT SYSDA                                   00215212
   SPACE (100,1000) TRK SYSDBA                                          00215312
UNLOAD TABLESPACE DBRE02.TBMVCONT                                       00215412
       FROM TABLE MARITIMA.TBMVCONT                                     00215512
       WHEN (CDEMP = 2                                                  00215612
             AND SISTEMA = 5                                            00215712
             AND CDINTERF = 81                                          00215812
             AND DTCONTAB = '2007-07-02')                               00215912
       PUNCHDDN DDPUNCH                                                 00216012
       UNLDDN DDREC                                                     00216112
       SHRLEVEL REFERENCE                                               00216212
//                                                                      00216312
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00216412
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE) VOLUMES(SHR005)   00216512
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00216612
   DISP (NEW,CATLG,DELETE) UNIT SYSDA                                   00216712
   SPACE (500,1000) TRK VOLUMES(SHR005)                                 00216812
UNLOAD TABLESPACE DBRE04.CADCRALT                                       00216912
       FROMCOPY DB2PCOPY.FM1.DBRE04.CADCRALT.P0.G0194V00                00217012
       UNLDDN DDREC                                                     00217112
       PUNCHDDN DDPUNCH                                                 00217212
       SHRLEVEL REFERENCE                                               00217312
//                                                                      00217412
UNLOAD TABLESPACE DBNOVA.CADPARCL                                       00217512
       FROMCOPY DB2PCOPY.FM1.DBNOVA.CADPARCL.P0.G0171V00                00217612
       UNLDDN DDREC                                                     00217712
       SHRLEVEL REFERENCE                                               00217812
UNLOAD TABLESPACE DBRE05.HSTPARCL                                       00217912
       FROMCOPY DB2PCOPY.FM1.DBRE05.HSTPARCL.P0.G0212V00                00218012
       UNLDDN DDREC                                                     00218112
       SHRLEVEL REFERENCE                                               00218212
//                                                                      00218312
OPTIONS EVENT(ITEMERROR, SKIP)                                          00218412
LISTDEF DBLIST  INCLUDE TABLESPACE DBNOVA.CADAPOL                       00218512
                INCLUDE TABLESPACE DBRE05.HSTAPOL                       00218612
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00218712
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                   00218812
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00218912
   DISP (NEW,CATLG,DELETE)                                              00219012
   UNIT TAPV VOLCNT(255) RETPD 10                                       00219112
UNLOAD LIST DBLIST  PUNCHDDN DDPUNCH                                    00219212
       UNLDDN DDREC                                                     00219312
       SHRLEVEL REFERENCE                                               00219412
//                                                                      00219512
LISTDEF DBLIST  INCLUDE TABLESPACE DB2ADM.TSSSPL71                      00219612
LISTDEF DBLIST  INCLUDE TABLESPACE DB2ADM.TSSSPL71                      00219712
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00219812
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE) VOLUME(SHR005)    00219912
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00220000
   DISP (NEW,CATLG,DELETE) UNIT SYSDA                                   00230000
   SPACE (5000,1000) TRK VOLUME(SHR005)                                 00240000
UNLOAD LIST DBLIST  PUNCHDDN DDPUNCH                                    00250000
       UNLDDN DDREC                                                     00260000
       SHRLEVEL REFERENCE                                               00270000
//                                                                      00280000
UNIT=TAPV                                                               00290000
VOLCNT(255)                                                             00300000
RETPD 40                                                                00310000
DISP(NEW,CATLG,DELETE)                                                  00320000
STACK YES                                                               00330000
