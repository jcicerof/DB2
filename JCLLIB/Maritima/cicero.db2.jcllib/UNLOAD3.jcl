//DB@UNLOA JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID TYPRUN=HOLD   00010004
//*                                                                     00020003
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            00030003
//*------------------------------------------------------------------   00040003
//* UNLOAD                                                              00050003
//*------------------------------------------------------------------   00060003
//UNLOAD   EXEC PROC=UNLOAD,DSN=DB2P                                    00070003
//SYSPUNCH DD   DUMMY                                                   00080003
//SYSREC   DD   DUMMY                                                   00090003
//SYSIN    DD   *                                                       00100003
OPTIONS EVENT(ITEMERROR, SKIP)                                          00110003
LISTDEF DBLIST  INCLUDE TABLESPACE DBEETA.CLCNCOVG                      00120003
                INCLUDE TABLESPACE DBEETA.CNVACECN                      00130003
                INCLUDE TABLESPACE DBEETA.CNVCLAUS                      00140003
                INCLUDE TABLESPACE DBEETA.CNVCONDI                      00150003
                INCLUDE TABLESPACE DBEETA.CNVCBCOM                      00160003
                INCLUDE TABLESPACE DBEETA.CNVDSFRO                      00170003
                INCLUDE TABLESPACE DBEETA.CNVETCND                      00180003
                INCLUDE TABLESPACE DBEETA.CNVETPCO                      00190003
                INCLUDE TABLESPACE DBEETA.CNVETPVG                      00200003
                INCLUDE TABLESPACE DBEETA.CNVFORPG                      00210003
                INCLUDE TABLESPACE DBEETA.CNVNEGOC                      00220003
                INCLUDE TABLESPACE DBEETA.CONVEPRO                      00230003
                INCLUDE TABLESPACE DBEETA.CNVPROCP                      00240003
                INCLUDE TABLESPACE DBEETA.CNVTXTOB                      00250003
                INCLUDE TABLESPACE DBEETA.CONVENVG                      00260003
                INCLUDE TABLESPACE DBEETA.NACOBCNE                      00270003
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00280003
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00290003
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00300003
   UNIT SYSDBA SPACE (1000,1000) TRK DISP (NEW,CATLG,DELETE)            00310003
UNLOAD LIST DBLIST                                                      00320003
       PUNCHDDN DDPUNCH                                                 00330003
       UNLDDN DDREC                                                     00340003
       SHRLEVEL CHANGE ISOLATION UR                                     00350003
//                                                                      00360003
===========================                                             00370003
//SYSIN    DD   *                                                       00380003
LISTDEF DBLIST  INCLUDE TABLESPACE DBRE02.TBCRECON                      00390003
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00400003
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00410003
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00420003
   UNIT SYSDBA SPACE (1000,1000) TRK DISP (NEW,CATLG,DELETE)            00430003
UNLOAD LIST DBLIST                                                      00440003
       PUNCHDDN DDPUNCH                                                 00450003
       UNLDDN DDREC                                                     00460003
       SHRLEVEL CHANGE ISOLATION UR                                     00470003
//                                                                      00480003
OPTIONS EVENT(ITEMERROR, SKIP)                                          00490003
                                                                        00500003
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00510003
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                   00520003
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00530003
   DISP (NEW,CATLG,DELETE)                                              00540003
   UNIT TAPV VOLCNT(255) RETPD 10                                       00550003
                                                                        00560003
UNLOAD TABLESPACE DBNOVA.CADPARCL                                       00570003
       FROMCOPY DB2PCOPY.FM1.DBNOVA.CADPARCL.P0.G0171V00                00580003
       UNLDDN DDREC                                                     00590003
       SHRLEVEL REFERENCE                                               00600003
UNLOAD TABLESPACE DBRE05.HSTPARCL                                       00610003
       FROMCOPY DB2PCOPY.FM1.DBRE05.HSTPARCL.P0.G0212V00                00620003
       UNLDDN DDREC                                                     00630003
       SHRLEVEL REFERENCE                                               00640003
//                                                                      00650003
OPTIONS EVENT(ITEMERROR, SKIP)                                          00660003
LISTDEF DBLIST  INCLUDE TABLESPACE DBNOVA.CADAPOL                       00670003
                INCLUDE TABLESPACE DBRE05.HSTAPOL                       00680003
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00690003
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                   00700003
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00710003
   DISP (NEW,CATLG,DELETE)                                              00720003
   UNIT TAPV VOLCNT(255) RETPD 10                                       00730003
UNLOAD LIST DBLIST  PUNCHDDN DDPUNCH                                    00740003
       UNLDDN DDREC                                                     00750003
       SHRLEVEL REFERENCE                                               00760003
//                                                                      00770003
LISTDEF DBLIST  INCLUDE TABLESPACE DB2ADM.TSSSPL71                      00780003
LISTDEF DBLIST  INCLUDE TABLESPACE DB2ADM.TSSSPL71                      00790003
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00800003
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE) VOLUME(SHR005)    00810003
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                      00820003
   DISP (NEW,CATLG,DELETE) UNIT SYSDA                                   00830003
   SPACE (5000,1000) TRK VOLUME(SHR005)                                 00840003
UNLOAD LIST DBLIST  PUNCHDDN DDPUNCH                                    00850003
       UNLDDN DDREC                                                     00860003
       SHRLEVEL REFERENCE                                               00870003
//                                                                      00880003
UNIT=TAPV                                                               00890003
VOLCNT(255)                                                             00900003
RETPD 40                                                                00910003
DISP(NEW,CATLG,DELETE)                                                  00920003
STACK YES                                                               00930003
