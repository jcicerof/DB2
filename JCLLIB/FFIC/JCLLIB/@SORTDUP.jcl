//IBM1JCFS JOB (T00101,520,AU88100,658,A28,083),'DB2 DBA TOOL',
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L
//*
/*JOBPARM L=99,Z=O,HOLD=ALL,SYSAFF=ESYS,U=0,TIME=1439
//*
//SORT    EXEC PGM=SORT
//SYSOUT  DD   SYSOUT=*
//*SORTIN  DD   DISP=OLD,DSN=IBM1JCF.LIXO.IDCAMSD
//SORTIN  DD   *
01CICEROTESTE
01CICEROTESTE
01CICEROTESTE
01CICEROTESTE
02CICEROTESTE
02CICEROTESTE
02CICEROTESTE
//SORTOUT DD   SYSOUT=*
//SYSIN   DD   *
  SORT FIELDS=(1,80,CH,A)
  SUM FIELDS=NONE
//
 SORT FIELDS=(2,7,CH,A)
 INCLUDE COND=(2,7,CH,EQ,C'NONVSAM')
 END
//
  SORT FIELDS=(5,20,CH,A)
  SUM FIELDS=NONE
 END
//
/*
**REMOVE LINHAS DUPLICADAS
  SORT FIELDS=(106,4,CH,A)
  SUM FIELDS=NONE
//
 SORT FIELDS=(7,6,CH,A)
 INCLUDE COND=(7,6,CH,EQ,C'DSNDBD')
 END
//
