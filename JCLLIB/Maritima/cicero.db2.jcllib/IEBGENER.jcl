//DB@IEBGE JOB CLASS=A,MSGCLASS=S,NOTIFY=&SYSUID                        00010002
//*                                                                     00011000
//IEBGENER EXEC PGM=IEBGENER                                            00020000
//SYSPRINT DD SYSOUT=*                                                  00030000
//SYSIN    DD DUMMY                                                     00040000
//SYSUT1   DD DSN=CICERO.UNL.DBEETA.ACETFVIG.PUNCH,DISP=OLD             00050004
//         DD DSN=CICERO.UNL.DBEETA.ALCCALVG.PUNCH,DISP=OLD             00051004
//         DD DSN=CICERO.UNL.DBEETA.ANBXBASE.PUNCH,DISP=OLD             00052004
//SYSUT2   DD SYSOUT=*                                                  00060004
