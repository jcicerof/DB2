//DB@IEBPT JOB CLASS=A,MSGCLASS=P,NOTIFY=&SYSUID                        00010001
//*                                                                     00011000
//IEBPTPCH EXEC PGM=IEBPTPCH                                            00020001
//SYSPRINT DD   SYSOUT=*                                                00030001
//SYSIN    DD   *                                                       00040001
  PUNCH TYPORG=PS                                                       00041003
//SYSUT1   DD   DISP=OLD,UNIT=VSM,VOL=SER=M09881,                       00050002
//         DSN=CICERO.UNL.DBMA01.SNSERVIC.REC.D2009141.TAPE             00060002
//SYSUT2   DD   SYSOUT=*                                                00070001
