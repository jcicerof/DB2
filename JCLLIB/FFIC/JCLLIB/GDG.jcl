//IBM1JCF0 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',           JOB00927
//         NOTIFY=IBM1JCF,CLASS=L,USER=DB2ACPT
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*
//IDCAMS   EXEC PGM=IDCAMS
//AMSDUMP  DD   SYSOUT=*
//SYPRINT  DD   SYSOUT=*
//SYSIN    DD   *
  DEFINE GDG( -
            NAME(ERPE.YMAP0.ACPT32.COPY) -
            LIMIT(3)                     -
            NOEMPTY                      -
            SCRATCH)
//*
//IEFBR14  EXEC PGM=IEFBR14
//COPYE32  DD  DSN=ERPE.YMAP0.ACPT32.COPY(+1),
//         DISP=(NEW,CATLG,CATLG),UNIT=(MAGV,,DEFER),
//         DCB=(GDG.MODEL.DSCB,BUFNO=20)