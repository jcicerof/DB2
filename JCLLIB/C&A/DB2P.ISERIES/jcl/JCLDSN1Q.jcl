//SDBN1Q01 JOB ,CICERO,CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,TYPRUN=HOLD
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)
//         SET DT=NONE
//*
//EQ032T   EXEC PROC=RECBKP,SS=EQ,TS=EQ032T,DT=&DT,
//           XLAT=',NUMPARTS(10),DSSIZE(2G),PAGESIZE(4K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ032T.G1453V00
//EQ033T   EXEC PROC=RECBKP,SS=EQ,TS=EQ033T,DT=&DT,
//           XLAT=',NUMPARTS(10),PAGESIZE(4K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ033T.G1453V00
//*
//SDBN1Q02 JOB ,CICERO,CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,TYPRUN=HOLD
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)
//         SET DT=NONE
//*
//EQ034T   EXEC PROC=RECBKP,SS=EQ,TS=EQ034T,DT=&DT,
//           XLAT=',NUMPARTS(10),DSSIZE(8G),PAGESIZE(4K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ034T.G1453V00
//*
//SDBN1Q03 JOB ,CICERO,CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,TYPRUN=HOLD
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)
//         SET DT=NONE
//*
//EQ036T   EXEC PROC=RECBKP,SS=EQ,TS=EQ036T,DT=&DT,
//           XLAT=',NUMPARTS(10),DSSIZE(16G),PAGESIZE(4K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ036T.G1450V00
//*
//SDBN1Q04 JOB ,CICERO,CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,TYPRUN=HOLD
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)
//         SET DT=NONE
//*
//EQ037T   EXEC PROC=RECBKP,SS=EQ,TS=EQ037T,DT=&DT,
//           XLAT=',NUMPARTS(10),DSSIZE(8G),PAGESIZE(8K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ037T.G1453V00
//EQ038T   EXEC PROC=RECBKP,SS=EQ,TS=EQ038T,DT=&DT,
//           XLAT=',NUMPARTS(10),DSSIZE(8G),PAGESIZE(8K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ038T.G1452V00
//EQ042T   EXEC PROC=RECBKP,SS=EQ,TS=EQ042T,DT=&DT,
//           XLAT=',NUMPARTS(10),DSSIZE(2G),PAGESIZE(4K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ042T.G1456V00
//EQ045T   EXEC PROC=RECBKP,SS=EQ,TS=EQ045T,DT=&DT,
//           XLAT=',NUMPARTS(10),DSSIZE(2G),PAGESIZE(4K)'
//DSN1COPY.SYSUT1 DD DISP=OLD,DSN=HC.EQ.CI.EQ045T.G1456V00
//*
//
HC.EQ.CI.EQ032T.G1453V00
HC.EQ.CI.EQ033T.G1453V00
HC.EQ.CI.EQ034T.G1453V00
HC.EQ.CI.EQ036T.G1450V00
HC.EQ.CI.EQ037T.G1453V00
HC.EQ.CI.EQ038T.G1452V00
HC.EQ.CI.EQ042T.G1456V00
HC.EQ.CI.EQ045T.G1456V00
