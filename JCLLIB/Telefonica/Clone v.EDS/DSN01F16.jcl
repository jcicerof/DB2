//DSN01F16 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//*--------------------------------------------------------------------*
//* ATUALIZA O BSDS DO D2C1 E PREPARA O START DO DB2 CLONE             *
//* EM CASO DE ABEND CHAMAR O SUPORTE DB2                              *
//*--------------------------------------------------------------------*
//STEP1   EXEC PGM=DSNJU003                                             00005000
//* CHANGE LOG INVENTORY **** DELETA INFORMACOES DO BSDS ****           00004001
//STEPLIB  DD DSN=D2C1.V7R1M0.SDSNLOAD,DISP=SHR                         00006006
//SYSUT1   DD DSN=D2C1.BSDS01,DISP=SHR                                  00007006
//SYSUT2   DD DSN=D2C1.BSDS02,DISP=SHR                                  00007106
//SYSPRINT DD SYSOUT=*                                                  00007200
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFDEL001),DISP=SHR                   00007300
/*
//STEP2    EXEC PGM=DSNJU003,COND=(4,NE)                                00005000
//STEPLIB  DD DSN=D2C1.V7R1M0.SDSNLOAD,DISP=SHR                         00006006
//SYSUT1   DD DSN=D2C1.BSDS01,DISP=SHR                                  00007006
//SYSUT2   DD DSN=D2C1.BSDS02,DISP=SHR                                  00007106
//SYSPRINT DD SYSOUT=*                                                  00007200
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TF0101F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0101V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0201F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0101V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0102F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0102V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0202F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0102V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0103F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0103V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0203F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0103V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0204F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0104V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0205F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0104V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0206F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0105V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0207F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0105V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0208F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0106V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0209F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0106V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0210F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0107V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0211F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0107V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0212F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0108V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0213F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0108V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0214F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0109V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0215F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0109V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0216F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0110V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0217F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0110V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0218F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0111V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0219F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0111V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0220F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0112V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0221F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0112V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0113F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0113V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0313F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0113V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0114F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0114V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0314F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0114V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0115F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0115V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0315F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0115V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0116F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0116V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0316F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0116V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0117F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0117V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0317F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0117V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0118F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0118V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0318F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0118V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0119F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0119V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0319F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0119V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0120F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0120V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0320F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0120V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0121F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0121V),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0321F),DISP=SHR                    00007300
//         DD DSN=SYS3.TFU.PARMLIB(TF0121V),DISP=SHR                    00007300
/*                                                                      00007900
//DSNTLOG EXEC PGM=DSNJU003
//STEPLIB  DD  DISP=SHR,DSN=D2C1.V7R1M0.SDSNLOAD
//SYSUT1   DD  DISP=OLD,DSN=D2C1.BSDS01
//SYSUT2   DD  DISP=OLD,DSN=D2C1.BSDS02
//SYSPRINT DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//SYSIN    DD  *
 DDF    LOCATION=D2C1,LUNAME=SP0D2C1B,
        NOPASSWD,RESPORT=2447,PORT=2446
//*
