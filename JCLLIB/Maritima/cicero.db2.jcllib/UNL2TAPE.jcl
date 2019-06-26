//DB@UNLOA JOB 'CICERO,R:5627',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID        00010006
//*------------------------------------------------------------------   00020006
//* UNLOAD    - RETORNO DE DADOS                                        00030006
//*------------------------------------------------------------------   00040006
//UNLOAD   EXEC PGM=DSNUTILB,PARM='DB2P'                                00050006
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                          00060006
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                          00070006
//SYSPRINT DD   SYSOUT=*                                                00080008
//SYSOUT   DD   SYSOUT=*                                                00100006
//SYSIN    DD   *                                                       00110006
OPTIONS EVENT(ITEMERROR, SKIP)                                          00120006
LISTDEF DBLIST                                                          00130006
               INCLUDE TABLESPACE DBNOVA.CADPARCL                       00140009
                                                                        00280006
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH)                        00290008
   UNIT SYSDBA SPACE (1,0) TRK DISP (NEW,CATLG,DELETE)                  00300006
                                                                        00310007
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..&UNIQ..TAPE)                    00320007
   UNIT VSM DISP (NEW,CATLG,DELETE) VOLCNT(255) STACK YES               00330006
                                                                        00340006
UNLOAD LIST DBLIST                                                      00350006
       PUNCHDDN DDPUNCH                                                 00360006
       UNLDDN   DDREC                                                   00370006
       SHRLEVEL CHANGE ISOLATION UR                                     00380006
