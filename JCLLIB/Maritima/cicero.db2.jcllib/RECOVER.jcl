//DB@DSNTI JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00001010
//*                                                                     00001102
//*------------------------------------------------------------------   00009900
//* RECOVER                                                             00010004
//*------------------------------------------------------------------   00020000
//RECOVER  EXEC PGM=DSNUTILB,PARM='DB2P'                                00030005
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                            00031002
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                            00032002
//SYSPRINT DD  SYSOUT=*                                                 00040000
//SYSOUT   DD  SYSOUT=*                                                 00050000
//SYSIN    DD  *                                                        00090002
  RECOVER TABLESPACE DBNOVA.CADAPOL                                     00100013
   TOCOPY DB2PCOPY.FE.DBNOVA.CADAPOL.D2008293.HR2109                    00100113
//*                                                                     00101003
