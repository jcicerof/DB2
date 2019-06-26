//SWUTELST JOB ,CLASS=S,MSGCLASS=S,NOTIFY=&SYSUID                       00010000
//S01      EXEC PGM=TAPECOPY,PARM=DEBE                                  00020000
//MASTER   DD   UNIT=VSM,DISP=SHR,VOL=SER=M09881,                       00030000
//         LABEL=(,BLP,EXPDT=98000)                                     00040000
//SYSPRINT DD   SYSOUT=*                                                00050000
