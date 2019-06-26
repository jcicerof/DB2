//DB@CICER JOB 'CICERO(R.5627)',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID       00001002
//*                                                                     00002001
//STEP1    EXEC PGM=IEHLIST                                             00020001
//SYSPRINT DD   SYSOUT=*                                                00030001
//DISK     DD   UNIT=SYSSH,VOL=SER=DSHR01,DISP=OLD                      00040001
//SYSIN    DD   *                                                       00050001
   LISTVTOC FORMAT,VOL=SYSSH=DSHR01                                     00060001
/*                                                                      00070000
//                                                                      00080001
    LISTPDS DSNAME=LOADLIB,VOL=3330=D10040                              00090001
    LISTCTLG                                                            00100001
    LISTCTLG CVOL=3330=D10040                                           00110001
