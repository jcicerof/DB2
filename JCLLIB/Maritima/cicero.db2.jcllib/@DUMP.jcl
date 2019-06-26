//DB@CICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID               00001004
//*                                                                     00002002
//******************                                                    00040000
//ST10         EXEC PGM=ADRDSSU                                         00050000
//*            PARM='TYPRUN=NORUN,TRACE=YES'                            00060000
//SYSPRINT     DD   SYSOUT=*                                            00070000
//DDOUT        DD   DSN=CICERO.UNLOAD.DB2G.D081204,UNIT=VSM,            00170004
//             DISP=(,CATLG,UNCATLG),VOL=(,,,99)                        00190000
//SYSIN        DD   *                                                   00200000
 DUMP -                                                                 00210000
      OUTDD(DDOUT) CAN -                                                00220000
      DATASET(INCLUDE(CICERO.UNL.**))                                   00230004
/*                                                                      00250000
