//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//         JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//RECOVER  EXEC RECOVER,DSN=DB2D,LIB=DB2S
//SYSIN DD *
  RECOVER TABLESPACE DROS0A00.SLRS0A00
    TOCOPY ROSE.DB2D.DROS0A00.SLRS0A00.P00000.G0545V00

  REBUILD INDEX(ALL) TABLESPACE DROS0A00.SLRS0A00

  RUNSTATS TABLESPACE DROS0A00.SLRS0A00
    TABLE(ALL) INDEX(ALL) KEYCARD SHRLEVEL CHANGE UPDATE ALL

  TEMPLATE DDCOPY
     DSN 'DBA5.I0358750.&DB..&TS..D&DATE.'
     UNIT MAGV  RETPD 21
     STACK YES
     DISP (NEW,CATLG,DELETE)

  COPY  TABLESPACE DROS0A00.SLRS0A00 FULL YES
    COPYDDN(DDCOPY)
//
//
//
//
//REBIND  EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB   DD DSN=DB2K.DB2RUNLB,DISP=SHR
//          DD DISP=SHR,DSN=DB2K.DB2EXIT
//          DD DISP=SHR,DSN=DB2K.DB2LOAD
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSTSIN   DD *
 DSN SYSTEM(DB2J)
 REBIND PACKAGE(CDI7PMSC.CDIOF07)
 REBIND PACKAGE(CDI7PMSC.CDIOF08)
 REBIND PLAN(XMADMAIN)
 END
//SYSPUNCH  DD SYSOUT=*
//SYSREC00  DD SYSOUT=*
//SYSIN     DD DUMMY
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//DISDB   EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB   DD DSN=DB2K.DB2RUNLB,DISP=SHR
//          DD DISP=SHR,DSN=DB2K.DB2EXIT
//          DD DISP=SHR,DSN=DB2K.DB2LOAD
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSTSIN   DD *
 DSN SYSTEM(DB2J)
 -DIS DB (DCLI0T00) SP(*) LIMIT(*) RESTRICT
 -DIS DB (DCLI0T01) SP(*) LIMIT(*) RESTRICT
 END
//SYSPUNCH  DD SYSOUT=*
//SYSREC00  DD SYSOUT=*
//SYSIN     DD DUMMY