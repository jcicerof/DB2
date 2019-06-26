//DB@COPY  JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID TYPRUN=SCAN   00001007
//*                                                                     00001100
//*------------------------------------------------------------------   00009900
//* COPY                                                                00010000
//*------------------------------------------------------------------   00020000
//COPY     EXEC PGM=DSNUTILB,PARM='DB2P'                                00030006
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                            00031000
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                            00032000
//SYSPRINT DD  SYSOUT=*                                                 00040000
//SYSOUT   DD  SYSOUT=*                                                 00050000
//SYSCOPY  DD  DSN=DB2PCOPY.FE1.DB2ADM.RPTMVIEW.D090115.TAPE,           00060009
//             DISP=(,CATLG,DELETE),                                    00070000
//             UNIT=VSM                                                 00080008
//SYSIN    DD  *                                                        00090000
  COPY TABLESPACE DB2ADM.RPTMVIEW FULL YES SHRLEVEL CHANGE              00100009
//*                                                                     00101000
