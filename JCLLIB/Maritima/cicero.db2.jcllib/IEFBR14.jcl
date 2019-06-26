//DB@CICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID TYPRUN=SCAN   00010002
//*                                                                     00020000
//IEFBR14  EXEC PGM=IEFBR14                                             00030001
//SYSUT1   DD DUMMY                                                     00050000
//SYSUT2   DD DSN=DBH.DBSS01.UNLDCOPY,DISP=OLD                          00060000
//SYSPRINT DD SYSOUT=*                                                  00080000
//SYSIN    DD DATA,DLM='><'                                             00090000
