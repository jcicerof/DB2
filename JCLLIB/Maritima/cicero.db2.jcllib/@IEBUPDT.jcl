//HERC01U JOB (HERC01),'UPDTE',CLASS=A,MSGCLASS=X,                      00010000
//        MSGLEVEL=(1,1),NOTIFY=HERC01                                  00020000
//*                                                                     00030000
//STEP010 EXEC PGM=IEBUPDTE,PARM=NEW                                    00040000
//*                                                                     00050000
//SYSUT1 DD DUMMY                                                       00060000
//SYSUT2 DD DSN=HERC01.TEMP.REXX,DISP=(NEW,CATLG,DELETE),               00070000
//       SPACE=(CYL,(5,5,20)),UNIT=3350,                                00080000
//       DCB=(RECFM=FB,LRECL=80,BLKSIZE=3120)                           00090000
//*                                                                     00100000
//SYSPRINT DD SYSOUT=X                                                  00110000
//*                                                                     00120000
//SYSIN DD DATA,DLM='><'                                                00130000
./ ADD NAME=DAEDIT,LIST=ALL                                             00140000
/* REXX */                                                              00150000
/* DA-EDIT */                                                           00160000
/***********************************************************/           00170000
SAY 'HELLO'                                                             00180000
EXIT                                                                    00190000
./ ENDUP                                                                00200000
><                                                                      00210000
//*                                                                     00220000
