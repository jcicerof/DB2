//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',           JOB11116
//         NOTIFY=IBM1JCF,CLASS=O
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//IEFBR14  EXEC PGM=IEFBR14
//IN1      DD DSN=IBM1JCF.TESTE.TESTE.V1,
//            DISP=(OLD,DELETE,DELETE),UNIT=SYSDA
//IN2      DD DSN=IBM1JCF.TESTE.TESTE.V2,
//            DISP=(OLD,DELETE,DELETE),UNIT=SYSDA
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//LISTCAT  EXEC PGM=IDCAMS
//SYSPRINT DD DSN=IBM1JCF.TESTE.TESTE.V1,
//            DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,
//            SPACE=(TRK,(10,10),RLSE)
//SYSIN    DD *
 LISTC LEVEL(POLD5.DSNDBD.DPOL0B0V) ALL
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//IEBGENER EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  GENERATE MAXFLDS=1
  RECORD FIELD=(120,1)
//SYSUT1   DD DSN=IBM1JCF.TESTE.TESTE.V1,DISP=OLD
//SYSUT2   DD DSN=IBM1JCF.TESTE.TESTE.V2,
//         DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,
//         SPACE=(TRK,(10,10),RLSE),
//         DCB=(LRECL=120,RECFM=FB)
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//SORT     EXEC PGM=SORT,REGION=0K    PARM='MSG=AP,VLTEST=0,VLTESTI=2'
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=IBM1JCF.TESTE.TESTE.V2,DISP=OLD
//SORTOUT  DD SYSOUT=*
//SORTWK01 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK02 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK03 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD *
 SORT FIELDS=COPY
  INCLUDE COND=((9,7,CH,EQ,C'CLUSTER'),OR,
                (67,7,CH,EQ,C'EXTENTS'),OR,
                (9,6,CH,EQ,C'SPACE-'))
 END
