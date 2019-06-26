//DSN01F03 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*-------------------------------------------------------------------*
//* PROCESSO DE DELETE/DEFINE DO USER CATALOG DO CLONE                *
//* EM CASO DE PROBLEMAS ACIONAR O SUPORTE BASICO MVS                 *
//*-------------------------------------------------------------------*
//DELICF    EXEC  PGM=IDCAMS                                            00000350
//SYSPRINT  DD  SYSOUT=*                                                00000370
//DD1       DD UNIT=3390,VOL=SER=DBAT01,DISP=SHR                        00000370
//SYSIN     DD  *
    DELETE (SYS3C.ICFCAT.DBAT01) USERCATALOG  FILE(DD1) RECOVERY
//*
//ICFCAT    EXEC PGM=IDCAMS,COND=(0,NE)
//SYSPRINT  DD SYSOUT=*
//DBAT01    DD UNIT=SYSDA,VOL=SER=DBAT01,DISP=SHR
//SYSIN     DD *
    DEFINE  USERCATALOG                      -                          00120000
          (NAME(SYS3C.ICFCAT.DBAT01)         -                          00130000
          VOLUME(DBAT01)                     -                          00150000
          FILE(DBAT01)                       -                          00150000
          SHAREOPTIONS(3 4)                  -                          00160000
          CYLINDERS(80 10)                   -
          FREESPACE(10 10)                   -                          00170000
          RECORDSIZE(4086 4086)              -                          00180000
          ICFCATALOG)                        -                          00190000
       DATA                                  -                          00200000
          (BUFND(4)                          -
           CONTROLINTERVALSIZE(4096))        -
       INDEX                                 -
          (BUFNI(4)                          -
           CONTROLINTERVALSIZE(2048))        -
           CATALOG(SYS1.MVSB.MCAT170)
//*
//ALIAS   EXEC PGM=IDCAMS,COND=(0,NE)
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *
  DEF ALIAS (NAME(D2C1) REL(SYS3C.ICFCAT.DBAT01)) -
           CATALOG(SYS1.MVSB.MCAT170)
  DEF ALIAS (NAME(D2C1AC) REL(SYS3C.ICFCAT.DBAT01)) -
           CATALOG(SYS1.MVSB.MCAT170)
  DEF ALIAS (NAME(D2C1AS) REL(SYS3C.ICFCAT.DBAT01)) -
           CATALOG(SYS1.MVSB.MCAT170)
  DEF ALIAS (NAME(D2C1IN) REL(SYS3C.ICFCAT.DBAT01)) -
           CATALOG(SYS1.MVSB.MCAT170)
  DEF ALIAS (NAME(D2C1CO) REL(SYS3C.ICFCAT.DBAT01)) -
           CATALOG(SYS1.MVSB.MCAT170)
  DEF ALIAS (NAME(D2C1FA) REL(SYS3C.ICFCAT.DBAT01)) -
           CATALOG(SYS1.MVSB.MCAT170)
  DEF ALIAS (NAME(D2C1WK) REL(SYS3C.ICFCAT.DBAT01)) -
           CATALOG(SYS1.MVSB.MCAT170)
/*
//
