//IBM1JCFE JOB (T00101,520,AU88100,658,A28,083),'DB2 DBA TOOL',         JOB00182
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=K
/*JOBPARM L=99,Z=O,HOLD=ALL,SYSAFF=ESYS,U=0,TIME=1439
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2S.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//* LIST DBID, PSID, OBID
//*------------------------------------------------------------------
//DSN1PRNT EXEC PGM=DSN1PRNT,
//         PARM='PRINT(0,12),FORMAT,NODATA,NUMPARTS(1)'
//STEPLIB  DD DISP=SHR,DSN=DB2K.DB2LOAD
//SYSUT1   DD DISP=OLD,DSN=ERPE.DB2E.DMAC1P01.SCDP1P01.P00001.G0112V00
//SYSUT2   DD DUMMY
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
