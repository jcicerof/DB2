//DB@TPD65 JOB CLASS=T,MSGCLASS=T,NOTIFY=&SYSUID                        00010002
//         JCLLIB ORDER=SYS9.PROCLIB                                    00020000
//         INCLUDE MEMBER=JOBLIBS                                       00030000
//S1       EXEC PGM=FTP,REGION=4096K,                                   00040000
//             PARM='10.2.11.215 (TIMEOUT 20'                           00050000
//STEPLIB  DD  DSN=TCPIP.SEZALINK,DISP=SHR                              00060000
//SYSMDUMP DD  SYSOUT=Z                                                 00070000
//SYSPRINT DD  SYSOUT=*                                                 00080000
//OUTPUT   DD  SYSOUT=*                                                 00090000
//INPUT    DD  *                                                        00100000
  TRANSFER                                                              00110000
  LOCSITE TRAILINGBLANKS                                                00120000
  PUT 'T.KOREK.RELATO' C:\KOREK\VIDA_BAIXA.TXT                          00130000
  QUIT                                                                  00140000
//                                                                      00150000
