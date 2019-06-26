//DBA0036R JOB (M356070000),DBA,NOTIFY=&SYSUID.,TIME=1440,
//             CLASS=T,REGION=0M,MSGCLASS=X
//*
/*JOBPARM  ROOM=70
//*
//JCLLIB   JCLLIB ORDER=(DB2.TEST.PROCLIB)
//         SET EDITCMD=&SYSUID..WRK.&SYSJOBNM..&SYSJOBID.
//*----------------------------------------------------------------
//* DELETE EDITRCMD FILE IF EXISTS
//*----------------------------------------------------------------
//IEFBR14  EXEC PGM=IEFBR14
//DD1      DD DSN=&EDITCMD.,DISP=(MOD,DELETE),SPACE=(TRK,1)
//*----------------------------------------------------------------
//* CREATE EDITCMD FILE
//*----------------------------------------------------------------
//IEBGENER EXEC PGM=IEBGENER
//SYSIN    DD DUMMY
//SYSPRINT DD DUMMY
//SYSUT1   DD *
TOP
CHANGE * 99999 /RESUME YES/REPLACE NOCOPYPEND/ ALL
TOP
CHANGE * 99999 /DB2SB/DB2IB/ ALL
TOP
CHANGE * 99999 /DB2SA/DB2IA/ ALL
TOP
LIST * 99999
END SAVE
//SYSUT2   DD DSN=&EDITCMD.,DISP=(NEW,CATLG,DELETE),
//         UNIT=SYSALLDA,SPACE=(TRK,(1,1))
//*----------------------------------------------------------------
//* EDIT FILE USING EDITCMD COMMAND FILE
//*----------------------------------------------------------------
//REPLACE  EXEC PGM=IKJEFT01
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
EDIT 'DBA0036.LIXO.ARB0100A.ARS0151A.PUN' DATA NONUM ASIS
//         DD DSN=&EDITCMD.,DISP=SHR
//         DD *
EDIT 'DBA0036.LIXO.ARB0100D.ARS0151D.PUN' DATA NONUM ASIS
//         DD DSN=&EDITCMD.,DISP=SHR
