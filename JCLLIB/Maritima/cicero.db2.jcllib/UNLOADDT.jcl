//DB@UNLOA JOB 'CICERO,R:5627',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID        00010007
//*                                                                     00020000
//*------------------------------------------------------------------   00021000
//* UNLOAD    - RETORNO DE DADOS                                        00022010
//*------------------------------------------------------------------   00023000
//UNLOAD   EXEC PGM=DSNUTILB,PARM='DB2P'                                00031002
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                          00040000
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                          00050000
//SYSPRINT DD   SYSOUT=*                                                00060000
//SYSOUT   DD   SYSOUT=*                                                00070000
//SYSIN    DD   *                                                       00073700
OPTIONS EVENT(ITEMERROR, SKIP)                                          00073803
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                  00073903
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00074003
                                                                        00074103
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT..TAPE)                 00074212
   UNIT VSM DISP (NEW,CATLG,DELETE)                                     00074312
                                                                        00074414
UNLOAD TABLESPACE DBEEOR.ORCITCOB                                       00074518
  FROMCOPY DB2PCOPY.FE2.DBEEOR.ORCITCOB.D2009156                        00074618
  UNLDDN DDREC                                                          00074718
  PUNCHDDN DDPUNCH                                                      00074818
  SHRLEVEL CHANGE ISOLATION UR                                          00074918
//                                                                      00075017
UNLOAD DATA FROM TABLE MARITIMA.MOVCTBPVDCORRT                          00075116
  WHEN (  DATE(DHPCS) >= '2008-01-01'                                   00075216
    AND   DATE(DHPCS) <= '2008-01-31')                                  00075316
  UNLDDN DDREC                                                          00075414
  PUNCHDDN DDPUNCH                                                      00075514
  SHRLEVEL CHANGE ISOLATION UR                                          00075614
//                                                                      00075714
                                                                        00076003
UNLOAD TABLESPACE DBRE02.TBCONBCO                                       00091213
  UNLDDN DDREC                                                          00091412
  PUNCHDDN DDPUNCH                                                      00091512
  SHRLEVEL CHANGE ISOLATION UR                                          00091612
//                                                                      00091713
                                                                        00091812
UNLOAD DATA FROM TABLE MARITIMA.PAGAMENTO                               00091912
  WHEN (DTLCT >= '2008-01-01'                                           00092012
   AND  DTLCT <= '2008-05-31'                                           00092112
   AND  SISTEMA IN (3, 6))                                              00092212
  UNLDDN DDREC                                                          00092312
  PUNCHDDN DDPUNCH                                                      00092412
  SHRLEVEL CHANGE ISOLATION UR                                          00092512
//                                                                      00092712
UNLOAD TABLESPACE DBEETA.CONGENQ2                                       00093012
  FROMCOPY DB2PCOPY.FE.DBEETA.CONGENQ2.D2008284.HR2323                  00130010
  UNLDDN DDREC                                                          00140010
  PUNCHDDN DDPUNCH                                                      00150010
  SHRLEVEL CHANGE ISOLATION UR                                          00160010
                                                                        00170010
UNLOAD TABLESPACE DBEETA.CONGENQ1                                       00171011
  FROMCOPY DB2PCOPY.FE.DBEETA.CONGENQ1.D2008284.HR2323                  00210010
  UNLDDN DDREC                                                          00220010
  PUNCHDDN DDPUNCH                                                      00230010
  SHRLEVEL CHANGE ISOLATION UR                                          00240010
