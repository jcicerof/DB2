//DB@THIST JOB 'CICERO',MSGCLASS=S,CLASS=S,NOTIFY=&SYSUID               00010000
//SORT     EXEC PGM=SORT                                                00020000
//SYSOUT   DD SYSOUT=*                                                  00030000
//SORTIN   DD DISP=SHR,DSN=T.MAINVIEW.ELAPSED.DE8A20HS                  00040000
//SORTOUT  DD DSN=CICERO.MAINVIEW.ELAPSED.DE8A20HS.LIX2,                00050001
//         DISP=(NEW,CATLG,DELETE),UNIT=SYSDBA,                         00060000
//         SPACE=(CYL,(050,09),RLSE),                                   00070000
//         DCB=(LRECL=090,BLKSIZE=9000,RECFM=FB,DSORG=PS)               00080003
//SYSIN    DD *                                                         00090000
   ALTSEQ CODE=(40F0)                    CONVERTE X'40' PARA X'F0'      00100002
   SORT FIELDS=(7,10,CH,A)                                              00110000
   INCLUDE COND=(2,3,CH,EQ,C'PKG')                                      00120000
   OUTREC FIELDS=(7,10,                  DATA                           00130000
                  18,8,                  LOCATION                       00140000
                  35,8,                  COLLID                         00150000
                  54,8,                  PROGRAM                        00160000
                  73,10,TRAN=ALTSEQ,     #EXEC                          00170000
                  84,10,TRAN=ALTSEQ,     #SQL                           00180000
                  95,10,TRAN=ALTSEQ,     ELAPSED TIME                   00190000
                 106,10,TRAN=ALTSEQ,     CPUTIME                        00200000
                 117,10,TRAN=ALTSEQ)     WAITTIME                       00210000
   END                                                                  00220000
