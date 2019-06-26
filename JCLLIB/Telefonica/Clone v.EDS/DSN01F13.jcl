//DSN01F13 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//*-------------------------------------------------------------------*
//* PROCESSO DE PREPARACAO DAS LOGS E DO BSDS DO DB2 CLONE D2C1       *
//* EM CASO DE PROBLEMAS ACIONAR SUPORTE DB2                          *
//*-------------------------------------------------------------------*
//STEP01  EXEC PGM=DSNJU004
//*-------------------------------------------------------------------*
//* DSNJU004 - EFETUA LISTAGEM DO BSDS DO SOURCE                      *
//*-------------------------------------------------------------------*
//STEPLIB DD DSN=D2P1.V7R1M0.SDSNLOAD,DISP=SHR
//        DD DSN=D2P1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD DSN=SYS7.D2C1.BSDS88,DISP=(,CATLG,DELETE),UNIT=SYSDA,
// SPACE=(CYL,(2,1)),DCB=(LRECL=133,BLKSIZE=0,RECFM=FB)
//SYSUT1   DD DSN=D2C1.BSDS01,DISP=SHR
//*
//STEP02   EXEC PGM=IEBGENER,COND=(0,NE)
//*-------------------------------------------------------------------*
//* IEBGENER COM A FUNCAO DE TRANSFORMAR O REGISTRO EM FIXO           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS88.FIXO,DISP=(,CATLG,DELETE),
//            DCB=(LRECL=121,RECFM=FB,BLKSIZE=6171),UNIT=SYSDA,
//            SPACE=(CYL,(02,2),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB01),DISP=SHR
//*
//SORT03   EXEC  PGM=SORT,REGION=0M,COND=(0,NE)
//*-------------------------------------------------------------------*
//*  SELECIONA OS RBAS DO BSDS SOURCE                                 *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.FIXO,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT,
//          DISP=(,CATLG,DELETE),UNIT=SYSDA,
//          SPACE=(CYL,(3,3),RLSE),DCB=(LRECL=121,BLKSIZE=0)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUSRT01),DISP=SHR
//*
//SORT04   EXEC  PGM=SORT,REGION=0M,COND=(0,NE)
//*------------------------------------------------------------------*
//*   CLASSIFICA OS RBAS OBTIDOS                                     *
//*------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT1,
//          DISP=(,CATLG,DELETE),UNIT=SYSDA,
//          SPACE=(CYL,(3,3),RLSE),DCB=(LRECL=121,BLKSIZE=0)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT05),DISP=SHR
//*
//SORT05   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   SELECIONA O PRIMEIRO RBA OBTIDO                                 *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT11,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUSRT02),DISP=SHR
/*
//SORT06   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT11,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT1A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUSRT06),DISP=SHR
/*
//SORT07   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  SEGUNDO  RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT21,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT03),DISP=SHR
/*
//SORT08   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT21,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT2A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUSRT07),DISP=SHR
/*
//SORT09   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  TERCEIRO RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT31,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT04),DISP=SHR
/*
//SORT10   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT31,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT3A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT08),DISP=SHR
//*
//SORT11   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  QUARTO   RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT41,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT09),DISP=SHR
/*
//SORT12   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT41,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT4A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT10),DISP=SHR
//*
//SORT13   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  QUINTO   RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT51,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT11),DISP=SHR
/*
//SORT14   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT51,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT5A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT12),DISP=SHR
//*
//SORT15   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  SEXTO    RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT61,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT13),DISP=SHR
/*
//SORT16   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT61,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT6A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT14),DISP=SHR
//*
//SORT17   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  SETIMO   RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT71,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT15),DISP=SHR
/*
//SORT18   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT71,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT7A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT16),DISP=SHR
//*
//SORT19   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  OITAVO   RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT81,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT17),DISP=SHR
/*
//SORT20   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT81,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT8A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT18),DISP=SHR
//*
//SORT21   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  NONO     RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT91,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT19),DISP=SHR
/*
//SORT22   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT91,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESULT9A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT20),DISP=SHR
//*
//SORT23   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO   RBA  OBTIDO                               *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL101,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT21),DISP=SHR
/*
//SORT24   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL101,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL10A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT22),DISP=SHR
//*
//SORT25   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO  PRIMEIRO RBA OBTIDO                        *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL111,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT23),DISP=SHR
/*
//SORT26   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL111,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL11A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT24),DISP=SHR
//*
//SORT27   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO SEGUNDO RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL112,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT25),DISP=SHR
//*
//SORT28   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL112,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL12A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
/*
//SORT2A   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO TERCEIRO RBA OBTIDO                         *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL113,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT27),DISP=SHR
/*
//SORT2B   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL113,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL13A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2C   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO QUARTO  RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL114,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT28),DISP=SHR
/*
//SORT2D   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL114,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL14A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2E   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO QUINTO  RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL115,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT29),DISP=SHR
/*
//SORT2F   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL115,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL15A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2G   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO SEXTO   RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL116,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT30),DISP=SHR
/*
//SORT2H   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL116,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL16A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2I   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO SETE    RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL117,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT31),DISP=SHR
/*
//SORT2J   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL117,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL17A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2K   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO OITAVO  RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL118,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT32),DISP=SHR
/*
//SORT2L   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL118,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL18A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2M   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  DECIMO  NONO   RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL119,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT33),DISP=SHR
/*
//SORT2N   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL119,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL19A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2O   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  VIGESIMO       RBA OBTIDO                          *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=SHR
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL120,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT34),DISP=SHR
/*
//SORT2P   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL120,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL20A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//SORT2Q   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*  SELECIONA  O  VIGESIMO PRIMEIRA RBA OBTIDA                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESULT1,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL121,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT35),DISP=SHR
/*
//SORT2R   EXEC  PGM=SORT,REGION=0M
//*-------------------------------------------------------------------*
//*   AJUSTA O START E END  RBA                                       *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2C1.BSDS88.RESUL121,DISP=(OLD,DELETE,KEEP)
//SORTOUT  DD DSN=SYS7.D2C1.BSDS88.RESUL21A,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,1)
//SYSIN     DD  DSN=SYS3.TFU.PARMLIB(TFUSRT26),DISP=SHR
//*
//STEP29   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT1A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS1A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP30   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT2A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS2A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP31   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT3A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS3A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP32   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT4A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS4A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP33   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT5A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS5A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP34   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT6A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS6A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP35   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT7A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS7A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
/*
//STEP36   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT8A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS8A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP37   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESULT9A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS9A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP38   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL10A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS10A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP39   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL11A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS11A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP40   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL12A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS12A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4A   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL13A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS13A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4B   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL14A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS14A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4C   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL15A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS15A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4D   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL16A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS16A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4E   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL17A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS17A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4F   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL18A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS18A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4G   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL19A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS19A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4H   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL20A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS20A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP4I   EXEC PGM=IEBGENER
//*-------------------------------------------------------------------*
//*   CONSOLIDA O SYSIN PARA IEBUPDTE                                 *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS88.RESUL21A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS7.D2C1.BSDS01.BSDS21A,DISP=(,CATLG,DELETE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0),UNIT=SYSDA,
//         SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUIEB02),DISP=SHR
//*
//STEP41   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE PRIMEIRO RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS1A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD01),DISP=SHR
//*
//STEP42   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE SEGUNDO  RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS2A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD02),DISP=SHR
//*
//STEP43   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE TERCEIRO RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS3A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD03),DISP=SHR
//*
//STEP44   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE QUARTO   RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS4A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD04),DISP=SHR
//*
//STEP45   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE QUINTO   RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS5A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD05),DISP=SHR
//*
//STEP46   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE SEXTO    RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS6A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD06),DISP=SHR
//*
//STEP47   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE SETIMO   RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS7A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD07),DISP=SHR
//*
//STEP48   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE OITAVO   RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS8A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD08),DISP=SHR
//*
//STEP49   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE NONO     RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS9A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD09),DISP=SHR
//*
//STEP50   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO   RBA                                           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS10A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD10),DISP=SHR
//*
//STEP51   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO PRIMEIRO RBA                                    *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS11A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD11),DISP=SHR
//*
//STEP52   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS12A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD12),DISP=SHR
//*
//STEP53   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS13A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD13),DISP=SHR
//*
//STEP54   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS14A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD14),DISP=SHR
//*
//STEP55   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS15A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD15),DISP=SHR
//*
//STEP56   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS16A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD16),DISP=SHR
//*
//STEP57   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS17A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD17),DISP=SHR
//*
//STEP58   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS18A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD18),DISP=SHR
//*
//STEP59   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS19A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD19),DISP=SHR
//*
//STEP60   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS20A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD20),DISP=SHR
//*
//STEP61   EXEC PGM=IEBUPDTE,PARM=MOD
//*-------------------------------------------------------------------*
//*   IEBUPDTE DECIMO SEGUNDO RBA                                     *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2C1.BSDS01.BSDS21A,DISP=(OLD,DELETE,KEEP)
//SYSUT2   DD DSN=SYS3.TFU.PARMLIB,DISP=SHR
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFUUPD21),DISP=SHR
//*
