//SDBEQ035 JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID TYPRUN=SCAN
//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)
//         SET LIB=DB2.DSN610,XLAT=('OBIDXLAT,RESET,NUMPARTS(10)')
//JOBLIB   DD  DSN=&LIB..SDSNEXIT,DISP=SHR
//         DD  DSN=&LIB..SDSNLOAD,DISP=SHR
//EQ035I   EXEC PROC=XPART2,DB=EQ0BP,IX=EQ035I,IX2=EQ935T,
//             LIB=&LIB,XLAT=&XLAT,TS=EQ035T
//*
