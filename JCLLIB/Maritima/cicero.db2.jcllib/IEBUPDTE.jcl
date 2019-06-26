//DB@CICER JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID TYPRUN=SCAN   00010014
//*                                                                     00020002
//DBSS01   EXEC PGM=IEBUPDTE,PARM=NEW                                   00030003
//SYSUT1   DD DUMMY                                                     00050002
//SYSUT2   DD DSN=JONAS.DBA.RUNSTATS,DISP=OLD                           00060012
//SYSPRINT DD SYSOUT=*                                                  00080002
//SYSIN    DD DATA,DLM='><'                                             00090004
./ ADD NAME=SSCAMCPM,LIST=ALL                                           01350012
RUNSTATS TABLESPACE DBSS01.SSCAMCPM TABLE(ALL) INDEX(ALL) UPDATE ALL    01360012
><                                                                      04490006
