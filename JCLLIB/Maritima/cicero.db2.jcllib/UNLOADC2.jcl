//DB@UNLOA JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010002
//*                                                                     00020002
//         SET DSN=DB2P                                                 00030002
//*------------------------------------------------------------------   00040002
//* UNLOAD                                                              00050002
//*------------------------------------------------------------------   00060002
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN'                                00070002
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00080002
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00090002
//SYSPRINT DD   SYSOUT=*                                                00100002
//UTPRINT  DD   SYSOUT=*                                                00110002
//SYSUDUMP DD   SYSOUT=*                                                00120002
//SYSIN    DD   *                                                       00130002
OPTIONS EVENT(ITEMERROR, SKIP)                                          00140002
TEMPLATE PUN0107 DSN(CICERO.UNL.&DB..&TS..PUN0107.D&DT.)                00150002
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00160002
TEMPLATE PUN0207 DSN(CICERO.UNL.&DB..&TS..PUN0207.D&DT.)                00170002
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00180002
TEMPLATE PUN0307 DSN(CICERO.UNL.&DB..&TS..PUN0307.D&DT.)                00190002
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00200002
TEMPLATE PUN0407 DSN(CICERO.UNL.&DB..&TS..PUN0407.D&DT.)                00210002
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00220002
TEMPLATE PUN0507 DSN(CICERO.UNL.&DB..&TS..PUN0507.D&DT.)                00221002
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00222002
TEMPLATE PUN0607 DSN(CICERO.UNL.&DB..&TS..PUN0607.D&DT.)                00222102
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00222202
TEMPLATE PUN0707 DSN(CICERO.UNL.&DB..&TS..PUN0707.D&DT.)                00222302
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00222402
TEMPLATE PUN0807 DSN(CICERO.UNL.&DB..&TS..PUN0807.D&DT.)                00222502
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00222602
TEMPLATE PUN0907 DSN(CICERO.UNL.&DB..&TS..PUN0907.D&DT.)                00222702
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00222802
TEMPLATE PUN1007 DSN(CICERO.UNL.&DB..&TS..PUN1007.D&DT.)                00222902
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00223002
TEMPLATE PUN1107 DSN(CICERO.UNL.&DB..&TS..PUN1107.D&DT.)                00223102
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00223202
TEMPLATE PUN1207 DSN(CICERO.UNL.&DB..&TS..PUN1207.D&DT.)                00223302
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00223402
TEMPLATE PUN0108 DSN(CICERO.UNL.&DB..&TS..PUN0108.D&DT.)                00223502
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00223602
TEMPLATE PUN0208 DSN(CICERO.UNL.&DB..&TS..PUN0208.D&DT.)                00223702
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00223802
TEMPLATE PUN0308 DSN(CICERO.UNL.&DB..&TS..PUN0308.D&DT.)                00223902
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00224002
TEMPLATE PUN0408 DSN(CICERO.UNL.&DB..&TS..PUN0408.D&DT.)                00224102
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00224202
                                                                        00224302
TEMPLATE REC0107 DSN(CICERO.UNL.&DB..&TS..REC0107.D&DT.)                00224402
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00224502
   VOLUMES (SHR001)                                                     00224602
TEMPLATE REC0207 DSN(CICERO.UNL.&DB..&TS..REC0207.D&DT.)                00224702
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00224802
   VOLUMES (SHR002)                                                     00224902
TEMPLATE REC0307 DSN(CICERO.UNL.&DB..&TS..REC0307.D&DT.)                00225002
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00225102
   VOLUMES (SHR003)                                                     00225202
TEMPLATE REC0407 DSN(CICERO.UNL.&DB..&TS..REC0407.D&DT.)                00225302
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00225402
   VOLUMES (SHR001)                                                     00225502
TEMPLATE REC0507 DSN(CICERO.UNL.&DB..&TS..REC0507.D&DT.)                00225602
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00225702
   VOLUMES (SHR002)                                                     00225802
TEMPLATE REC0607 DSN(CICERO.UNL.&DB..&TS..REC0607.D&DT.)                00225902
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00226002
   VOLUMES (SHR003)                                                     00226102
TEMPLATE REC0707 DSN(CICERO.UNL.&DB..&TS..REC0707.D&DT.)                00226202
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00226302
   VOLUMES (SHR001)                                                     00226402
TEMPLATE REC0807 DSN(CICERO.UNL.&DB..&TS..REC0807.D&DT.)                00226502
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00226602
   VOLUMES (SHR002)                                                     00226702
TEMPLATE REC0907 DSN(CICERO.UNL.&DB..&TS..REC0907.D&DT.)                00226802
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00226902
   VOLUMES (SHR003)                                                     00227002
TEMPLATE REC1007 DSN(CICERO.UNL.&DB..&TS..REC1007.D&DT.)                00227102
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00227202
   VOLUMES (SHR001)                                                     00227302
TEMPLATE REC1107 DSN(CICERO.UNL.&DB..&TS..REC1107.D&DT.)                00227402
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00227502
   VOLUMES (SHR002)                                                     00227602
TEMPLATE REC1207 DSN(CICERO.UNL.&DB..&TS..REC1207.D&DT.)                00227702
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00227802
   VOLUMES (SHR003)                                                     00227902
TEMPLATE REC0108 DSN(CICERO.UNL.&DB..&TS..REC0108.D&DT.)                00228002
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00228102
   VOLUMES (SHR001)                                                     00228202
TEMPLATE REC0208 DSN(CICERO.UNL.&DB..&TS..REC0208.D&DT.)                00228302
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00228402
   VOLUMES (SHR002)                                                     00228502
TEMPLATE REC0308 DSN(CICERO.UNL.&DB..&TS..REC0308.D&DT.)                00228602
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00228702
   VOLUMES (SHR003)                                                     00228802
TEMPLATE REC0408 DSN(CICERO.UNL.&DB..&TS..REC0408.D&DT.)                00228902
   UNIT SYSDA SPACE (1000,500) TRK DISP (NEW,CATLG,DELETE)              00229002
   VOLUMES (SHR001)                                                     00229102
                                                                        00229202
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00229302
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0532V00                00229402
       UNLDDN REC0107 PUNCHDDN PUN0107 SHRLEVEL REFERENCE               00229502
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00229602
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0535V00                00229702
       UNLDDN REC0207 PUNCHDDN PUN0207 SHRLEVEL REFERENCE               00229802
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00229902
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0539V00                00230002
       UNLDDN REC0307 PUNCHDDN PUN0307 SHRLEVEL REFERENCE               00230102
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00230202
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0544V00                00230302
       UNLDDN REC0407 PUNCHDDN PUN0407 SHRLEVEL REFERENCE               00230402
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00230502
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0548V00                00230602
       UNLDDN REC0507 PUNCHDDN PUN0507 SHRLEVEL REFERENCE               00230702
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00230802
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0552V00                00230902
       UNLDDN REC0607 PUNCHDDN PUN0607 SHRLEVEL REFERENCE               00231002
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00231102
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0557V00                00231202
       UNLDDN REC0707 PUNCHDDN PUN0707 SHRLEVEL REFERENCE               00231302
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00231402
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0561V00                00231502
       UNLDDN REC0807 PUNCHDDN PUN0807 SHRLEVEL REFERENCE               00231602
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00231702
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0566V00                00231802
       UNLDDN REC0907 PUNCHDDN PUN0907 SHRLEVEL REFERENCE               00231902
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00232002
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0570V00                00232102
       UNLDDN REC1007 PUNCHDDN PUN1007 SHRLEVEL REFERENCE               00232202
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00232302
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0574V00                00232402
       UNLDDN REC1107 PUNCHDDN PUN1107 SHRLEVEL REFERENCE               00232502
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00232602
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0578V00                00232702
       UNLDDN REC1207 PUNCHDDN PUN1207 SHRLEVEL REFERENCE               00232802
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00232902
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0582V00                00233002
       UNLDDN REC0108 PUNCHDDN PUN0108 SHRLEVEL REFERENCE               00233102
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00233202
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0585V00                00233302
       UNLDDN REC0208 PUNCHDDN PUN0208 SHRLEVEL REFERENCE               00233402
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00233502
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0589V00                00233602
       UNLDDN REC0308 PUNCHDDN PUN0308 SHRLEVEL REFERENCE               00233702
UNLOAD TABLESPACE DBSS02.SSSEGTIT                                       00233802
       FROMCOPY DB2PCOPY.FS1.DBSS02.SSSEGTIT.P0.G0593V00                00233902
       UNLDDN REC0408 PUNCHDDN PUN0408 SHRLEVEL REFERENCE               00234002
                                                                        00234102
//                                                                      00234200
OPTIONS EVENT(ITEMERROR, SKIP)                                          00234300
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00234400
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00234500
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00234600
   DISP (NEW,CATLG,DELETE) UNIT SYSDA                                   00234700
   SPACE (100,1000) TRK SYSDBA                                          00234800
UNLOAD TABLESPACE DBRE02.TBMVCONT                                       00234900
       FROM TABLE MARITIMA.TBMVCONT                                     00235000
       WHEN (CDEMP = 2                                                  00235100
             AND SISTEMA = 5                                            00235200
             AND CDINTERF = 81                                          00235300
             AND DTCONTAB = '2007-07-02')                               00235400
       PUNCHDDN DDPUNCH                                                 00235500
       UNLDDN DDREC                                                     00235600
       SHRLEVEL REFERENCE                                               00235700
//                                                                      00235800
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00235900
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE) VOLUMES(SHR005)   00236000
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00236100
   DISP (NEW,CATLG,DELETE) UNIT SYSDA                                   00236200
   SPACE (500,1000) TRK VOLUMES(SHR005)                                 00236300
UNLOAD TABLESPACE DBRE04.CADCRALT                                       00236400
       FROMCOPY DB2PCOPY.FM1.DBRE04.CADCRALT.P0.G0194V00                00236500
       UNLDDN DDREC                                                     00236600
       PUNCHDDN DDPUNCH                                                 00236700
       SHRLEVEL REFERENCE                                               00236800
//                                                                      00236900
UNLOAD TABLESPACE DBNOVA.CADPARCL                                       00237000
       FROMCOPY DB2PCOPY.FM1.DBNOVA.CADPARCL.P0.G0171V00                00237100
       UNLDDN DDREC                                                     00237200
       SHRLEVEL REFERENCE                                               00237300
UNLOAD TABLESPACE DBRE05.HSTPARCL                                       00237400
       FROMCOPY DB2PCOPY.FM1.DBRE05.HSTPARCL.P0.G0212V00                00237500
       UNLDDN DDREC                                                     00237600
       SHRLEVEL REFERENCE                                               00237700
//                                                                      00237800
OPTIONS EVENT(ITEMERROR, SKIP)                                          00237900
LISTDEF DBLIST  INCLUDE TABLESPACE DBNOVA.CADAPOL                       00238000
                INCLUDE TABLESPACE DBRE05.HSTAPOL                       00238100
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00238200
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                   00238300
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00238400
   DISP (NEW,CATLG,DELETE)                                              00238500
   UNIT TAPV VOLCNT(255) RETPD 10                                       00238600
UNLOAD LIST DBLIST  PUNCHDDN DDPUNCH                                    00238700
       UNLDDN DDREC                                                     00238800
       SHRLEVEL REFERENCE                                               00238900
//                                                                      00239000
LISTDEF DBLIST  INCLUDE TABLESPACE DB2ADM.TSSSPL71                      00239100
LISTDEF DBLIST  INCLUDE TABLESPACE DB2ADM.TSSSPL71                      00239200
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00239300
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE) VOLUME(SHR005)    00239400
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00239500
   DISP (NEW,CATLG,DELETE) UNIT SYSDA                                   00239600
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
