//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=O,USER=DB2PROD
/*JOBPARM Z=O,L=9999,SYSAFF=ASYS,H=ALL,TIME=1440
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//*
//TAPE0001  EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2Q')
//STEPLIB   DD   DSN=DB2R.DB2LOAD,DISP=SHR
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//*
//SYSIN    DD  *
  LISTDEF DIRBVPD
     INCLUDE TABLESPACE BMCARM.BMCARMCR PARTLEVEL
  TEMPLATE LCL1
     DSN 'DAPE.&SS..&DB..&TS..P&PART.(+1)'
     UNIT MAGV  EXPDL '1999000'
     STACK YES
     DISP (NEW,CATLG,CATLG)
     GDGLIMIT(5)
  TEMPLATE RMT1
     DSN 'DAPX.&SS..&DB..&TS..P&PART.(+1)'
     UNIT OFFS  EXPDL '1999000'
     STACK YES
     DISP (NEW,CATLG,CATLG)
     GDGLIMIT(5)
  COPY LIST DIRBVPD COPYDDN (LCL1) RECOVERYDDN (RMT1) SHRLEVEL CHANGE