//DB@MODFY JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00001002
//*                                                                     00002001
//*------------------------------------------------------------------   00003001
//* MODIFY                                                              00004001
//* LIMPA AS LINHAS DA SYSIBM.SYSCOPY PARA A TABELA DE CONTROLE         00004101
//* DO TSQUERY                                                          00004201
//*------------------------------------------------------------------   00005001
//MODIFY   EXEC PGM=DSNUTILB,PARM='DB2P'                                00010000
//STEPLIB  DD  DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                           00020000
//         DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                           00030000
//SYSPRINT DD  SYSOUT=*                                                 00040000
//SYSIN    DD  *                                                        00050000
 MODIFY RECOVERY TABLESPACE DB2ADM.RPTMVIEW DELETE AGE 20               00060003
