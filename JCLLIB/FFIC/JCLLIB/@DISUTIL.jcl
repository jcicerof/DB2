//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=O
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
//IKJEFT01 EXEC PGM=IKJEFT01
//STEPLIB  DD DSN=DB2F.DB2LOAD,DISP=SHR
//         DD DSN=DB2F.DB2RUNLB,DISP=SHR
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DB2E)
 -TERM UTIL     (ERSPROD.MAEAJSSE)
 -TERM UTIL     (ERSPROD.MAEAJSS2)
 -TERM UTIL     (ERSPROD.MAEAJSS3)
 -TERM UTIL     (ERSPROD.MAEAJSSM)
 -TERM UTIL     (ERSPROD.MAEAJSSI)
 -TERM UTIL     (ERSPROD.MAEAJSSJ)
 -TERM UTIL     (ERSPROD.MAEAJSS5)
 -TERM UTIL     (ERSPROD.MAEAJSSD)
 -TERM UTIL     (ERSPROD.MAEAJSSB)
 -TERM UTIL     (ERSPROD.MAEAJSSH)
 -TERM UTIL     (ERSPROD.MAEAJSSF)
 -TERM UTIL     (ERSPROD.MAEAJSS8)
 -TERM UTIL     (ERSPROD.MAEAJSS4)
 -TERM UTIL     (ERSPROD.MAEAJSS7)
 -TERM UTIL     (ERSPROD.MAEAJSS9)
 -TERM UTIL     (ERSPROD.MAEAJSS6)
 END
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD DUMMY