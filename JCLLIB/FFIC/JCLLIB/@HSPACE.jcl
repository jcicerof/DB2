//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',           JOB11116
//         NOTIFY=IBM1JCF,CLASS=O
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=O
//*
//         SET RXLIB=IBM1JCF.DB2.JCLLIB
//*-------------------------------------------------------------------
//* LISTCAT DO LEVEL VCAT.DSNDBD
//*-------------------------------------------------------------------
//DB2JLIST EXEC  PGM=IDCAMS
//SYSPRINT DD    DSN=&&DB2JLIST,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD    *
  LISTC LEVEL(AZL6M10.DSNDBD) ALL
  LISTC LEVEL(BCWD5.DSNDBD) ALL
  LISTC LEVEL(BCWD6.DSNDBD) ALL
  LISTC LEVEL(BCWD7.DSNDBD) ALL
  LISTC LEVEL(BCWDA.DSNDBD) ALL
  LISTC LEVEL(BCWDT.DSNDBD) ALL
  LISTC LEVEL(BUDDT.DSNDBD) ALL
  LISTC LEVEL(CCADA.DSNDBD) ALL
  LISTC LEVEL(CHGDE.DSNDBD) ALL
  LISTC LEVEL(CLID5.DSNDBD) ALL
  LISTC LEVEL(CLID6.DSNDBD) ALL
  LISTC LEVEL(CLID7.DSNDBD) ALL
  LISTC LEVEL(CLIDA.DSNDBD) ALL
  LISTC LEVEL(CLIDT.DSNDBD) ALL
  LISTC LEVEL(DAPD5.DSNDBD) ALL
  LISTC LEVEL(DAPDT.DSNDBD) ALL
  LISTC LEVEL(DB2K.DSNDBD) ALL
  LISTC LEVEL(DB2L.DSNDBD) ALL
  LISTC LEVEL(DB2Y.DSNDBD) ALL
  LISTC LEVEL(DSSD5.DSNDBD) ALL
  LISTC LEVEL(FWSD5.DSNDBD) ALL
  LISTC LEVEL(FWSD6.DSNDBD) ALL
  LISTC LEVEL(FWSD7.DSNDBD) ALL
  LISTC LEVEL(FWSDA.DSNDBD) ALL
  LISTC LEVEL(FWSDT.DSNDBD) ALL
  LISTC LEVEL(IAPD5.DSNDBD) ALL
  LISTC LEVEL(IAPD6.DSNDBD) ALL
  LISTC LEVEL(IAPD7.DSNDBD) ALL
  LISTC LEVEL(IAPDA.DSNDBD) ALL
  LISTC LEVEL(IAPDT.DSNDBD) ALL
  LISTC LEVEL(ILSDT.DSNDBD) ALL
  LISTC LEVEL(INTDT.DSNDBD) ALL
  LISTC LEVEL(IOSDT.DSNDBD) ALL
  LISTC LEVEL(JINDT.DSNDBD) ALL
  LISTC LEVEL(JLPDT.DSNDBD) ALL
  LISTC LEVEL(MADD5.DSNDBD) ALL
  LISTC LEVEL(MADDT.DSNDBD) ALL
  LISTC LEVEL(MARD5.DSNDBD) ALL
  LISTC LEVEL(MMMDA.DSNDBD) ALL
  LISTC LEVEL(MMMDT.DSNDBD) ALL
  LISTC LEVEL(OASDT.DSNDBD) ALL
  LISTC LEVEL(PANDT.DSNDBD) ALL
  LISTC LEVEL(PERD5.DSNDBD) ALL
  LISTC LEVEL(PERDA.DSNDBD) ALL
  LISTC LEVEL(PERDT.DSNDBD) ALL
  LISTC LEVEL(PIPDT.DSNDBD) ALL
  LISTC LEVEL(PMXD5.DSNDBD) ALL
  LISTC LEVEL(PMXD6.DSNDBD) ALL
  LISTC LEVEL(PMXD7.DSNDBD) ALL
  LISTC LEVEL(PMXDA.DSNDBD) ALL
  LISTC LEVEL(PMXDT.DSNDBD) ALL
  LISTC LEVEL(POLD5.DSNDBD) ALL
  LISTC LEVEL(POLDA.DSNDBD) ALL
  LISTC LEVEL(POLDT.DSNDBD) ALL
  LISTC LEVEL(PUTDT.DSNDBD) ALL
  LISTC LEVEL(PZMDT.DSNDBD) ALL
  LISTC LEVEL(QSTD5.DSNDBD) ALL
  LISTC LEVEL(QSTDA.DSNDBD) ALL
  LISTC LEVEL(QSTDT.DSNDBD) ALL
  LISTC LEVEL(REIDT.DSNDBD) ALL
  LISTC LEVEL(UBSD5.DSNDBD) ALL
  LISTC LEVEL(UBSDA.DSNDBD) ALL
  LISTC LEVEL(UBSDT.DSNDBD) ALL
//DB2DLIST EXEC  PGM=IDCAMS
//SYSPRINT DD    DSN=&&DB2DLIST,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD    *
  LISTC LEVEL(AIMD5.DSNDBD) ALL
  LISTC LEVEL(AIMDA.DSNDBD) ALL
  LISTC LEVEL(APMD5.DSNDBD) ALL
  LISTC LEVEL(APMDA.DSNDBD) ALL
  LISTC LEVEL(APMDT.DSNDBD) ALL
  LISTC LEVEL(ATFD5.DSNDBD) ALL
  LISTC LEVEL(ATFDE.DSNDBD) ALL
  LISTC LEVEL(ATMD5.DSNDBD) ALL
  LISTC LEVEL(ATMDA.DSNDBD) ALL
  LISTC LEVEL(ATMDT.DSNDBD) ALL
  LISTC LEVEL(CBRD5.DSNDBD) ALL
  LISTC LEVEL(CBRDA.DSNDBD) ALL
  LISTC LEVEL(CBRDT.DSNDBD) ALL
  LISTC LEVEL(CCIDA.DSNDBD) ALL
  LISTC LEVEL(CCIDT.DSNDBD) ALL
  LISTC LEVEL(CDID5.DSNDBD) ALL
  LISTC LEVEL(CDIDA.DSNDBD) ALL
  LISTC LEVEL(CDIDT.DSNDBD) ALL
  LISTC LEVEL(CEIDA.DSNDBD) ALL
  LISTC LEVEL(CEIDT.DSNDBD) ALL
  LISTC LEVEL(CIAD5.DSNDBD) ALL
  LISTC LEVEL(CIADA.DSNDBD) ALL
  LISTC LEVEL(CIADT.DSNDBD) ALL
  LISTC LEVEL(CIZDA.DSNDBD) ALL
  LISTC LEVEL(CIZDT.DSNDBD) ALL
  LISTC LEVEL(CLIDA.DSNDBD) ALL
  LISTC LEVEL(CLIDT.DSNDBD) ALL
  LISTC LEVEL(CLRDA.DSNDBD) ALL
  LISTC LEVEL(CLRDT.DSNDBD) ALL
  LISTC LEVEL(CMPD5.DSNDBD) ALL
  LISTC LEVEL(CMPDA.DSNDBD) ALL
  LISTC LEVEL(CMPDT.DSNDBD) ALL
  LISTC LEVEL(CMTDA.DSNDBD) ALL
  LISTC LEVEL(CMTDT.DSNDBD) ALL
  LISTC LEVEL(CPIDA.DSNDBD) ALL
  LISTC LEVEL(CPIDT.DSNDBD) ALL
  LISTC LEVEL(CRFDA.DSNDBD) ALL
  LISTC LEVEL(CRFDT.DSNDBD) ALL
  LISTC LEVEL(CWPD5.DSNDBD) ALL
  LISTC LEVEL(CWPDA.DSNDBD) ALL
  LISTC LEVEL(CWPDT.DSNDBD) ALL
  LISTC LEVEL(CWSD5.DSNDBD) ALL
  LISTC LEVEL(DAPD5.DSNDBD) ALL
  LISTC LEVEL(DAPDA.DSNDBD) ALL
  LISTC LEVEL(DAPDE.DSNDBD) ALL
  LISTC LEVEL(DAPDT.DSNDBD) ALL
  LISTC LEVEL(DB2D.DSNDBD) ALL
  LISTC LEVEL(DB2S.DSNDBD) ALL
  LISTC LEVEL(DSSD5.DSNDBD) ALL
  LISTC LEVEL(DSSDA.DSNDBD) ALL
  LISTC LEVEL(DSSDE.DSNDBD) ALL
  LISTC LEVEL(DSSDT.DSNDBD) ALL
  LISTC LEVEL(EDIDA.DSNDBD) ALL
  LISTC LEVEL(EFPDA.DSNDBD) ALL
  LISTC LEVEL(EFPDT.DSNDBD) ALL
  LISTC LEVEL(EISD5.DSNDBD) ALL
  LISTC LEVEL(EISDA.DSNDBD) ALL
  LISTC LEVEL(EISDT.DSNDBD) ALL
  LISTC LEVEL(EMFD5.DSNDBD) ALL
  LISTC LEVEL(EMFD6.DSNDBD) ALL
  LISTC LEVEL(EMFDA.DSNDBD) ALL
  LISTC LEVEL(EMFDT.DSNDBD) ALL
  LISTC LEVEL(EPMD5.DSNDBD) ALL
  LISTC LEVEL(ESRDA.DSNDBD) ALL
  LISTC LEVEL(ESRDT.DSNDBD) ALL
  LISTC LEVEL(ESTDT.DSNDBD) ALL
  LISTC LEVEL(FLSD5.DSNDBD) ALL
  LISTC LEVEL(FLSDA.DSNDBD) ALL
  LISTC LEVEL(FLSDT.DSNDBD) ALL
  LISTC LEVEL(FRFD5.DSNDBD) ALL
  LISTC LEVEL(FRFDT.DSNDBD) ALL
  LISTC LEVEL(FRGD5.DSNDBD) ALL
  LISTC LEVEL(FRGDT.DSNDBD) ALL
  LISTC LEVEL(HRID5.DSNDBD) ALL
  LISTC LEVEL(HRID6.DSNDBD) ALL
  LISTC LEVEL(HRIDA.DSNDBD) ALL
  LISTC LEVEL(HRIDE.DSNDBD) ALL
  LISTC LEVEL(HRIDT.DSNDBD) ALL
  LISTC LEVEL(IRBDA.DSNDBD) ALL
  LISTC LEVEL(IRBDT.DSNDBD) ALL
  LISTC LEVEL(IRED5.DSNDBD) ALL
  LISTC LEVEL(IREDA.DSNDBD) ALL
  LISTC LEVEL(IREDT.DSNDBD) ALL
  LISTC LEVEL(LARDA.DSNDBD) ALL
  LISTC LEVEL(LARDT.DSNDBD) ALL
  LISTC LEVEL(MAAD5.DSNDBD) ALL
  LISTC LEVEL(MAADA.DSNDBD) ALL
  LISTC LEVEL(MAADT.DSNDBD) ALL
  LISTC LEVEL(MACD5.DSNDBD) ALL
  LISTC LEVEL(MACDA.DSNDBD) ALL
  LISTC LEVEL(MACDT.DSNDBD) ALL
  LISTC LEVEL(MADD5.DSNDBD) ALL
  LISTC LEVEL(MADDA.DSNDBD) ALL
  LISTC LEVEL(MADDE.DSNDBD) ALL
  LISTC LEVEL(MADDT.DSNDBD) ALL
  LISTC LEVEL(MAPD5.DSNDBD) ALL
  LISTC LEVEL(MAPDA.DSNDBD) ALL
  LISTC LEVEL(MAPDT.DSNDBD) ALL
  LISTC LEVEL(MARD5.DSNDBD) ALL
  LISTC LEVEL(MARDA.DSNDBD) ALL
  LISTC LEVEL(MARDE.DSNDBD) ALL
  LISTC LEVEL(MARDT.DSNDBD) ALL
  LISTC LEVEL(MCCDT.DSNDBD) ALL
  LISTC LEVEL(NWMD5.DSNDBD) ALL
  LISTC LEVEL(NWMDA.DSNDBD) ALL
  LISTC LEVEL(NWMDT.DSNDBD) ALL
  LISTC LEVEL(PAED5.DSNDBD) ALL
  LISTC LEVEL(PAEDA.DSNDBD) ALL
  LISTC LEVEL(PAEDT.DSNDBD) ALL
  LISTC LEVEL(PAFDA.DSNDBD) ALL
  LISTC LEVEL(PAFDT.DSNDBD) ALL
  LISTC LEVEL(PAND5.DSNDBD) ALL
  LISTC LEVEL(PANDA.DSNDBD) ALL
  LISTC LEVEL(PANDT.DSNDBD) ALL
  LISTC LEVEL(PATDA.DSNDBD) ALL
  LISTC LEVEL(PATDT.DSNDBD) ALL
  LISTC LEVEL(PCPDA.DSNDBD) ALL
  LISTC LEVEL(PCPDE.DSNDBD) ALL
  LISTC LEVEL(PCPDT.DSNDBD) ALL
  LISTC LEVEL(PERD5.DSNDBD) ALL
  LISTC LEVEL(PERDA.DSNDBD) ALL
  LISTC LEVEL(POLD5.DSNDBD) ALL
  LISTC LEVEL(PRLD5.DSNDBD) ALL
  LISTC LEVEL(PRLDA.DSNDBD) ALL
  LISTC LEVEL(PRLDT.DSNDBD) ALL
  LISTC LEVEL(PROD5.DSNDBD) ALL
  LISTC LEVEL(PRODA.DSNDBD) ALL
  LISTC LEVEL(PRODT.DSNDBD) ALL
  LISTC LEVEL(PUTDA.DSNDBD) ALL
  LISTC LEVEL(PUTDT.DSNDBD) ALL
  LISTC LEVEL(PZMD5.DSNDBD) ALL
  LISTC LEVEL(PZMDA.DSNDBD) ALL
  LISTC LEVEL(PZMDT.DSNDBD) ALL
  LISTC LEVEL(RIDD5.DSNDBD) ALL
  LISTC LEVEL(RIDDT.DSNDBD) ALL
  LISTC LEVEL(ROFDA.DSNDBD) ALL
  LISTC LEVEL(ROSD5.DSNDBD) ALL
  LISTC LEVEL(ROSDA.DSNDBD) ALL
  LISTC LEVEL(ROSDT.DSNDBD) ALL
  LISTC LEVEL(RTFD5.DSNDBD) ALL
  LISTC LEVEL(SADD5.DSNDBD) ALL
  LISTC LEVEL(SEED5.DSNDBD) ALL
  LISTC LEVEL(SEED6.DSNDBD) ALL
  LISTC LEVEL(SEEDA.DSNDBD) ALL
  LISTC LEVEL(SEEDT.DSNDBD) ALL
  LISTC LEVEL(SFRDA.DSNDBD) ALL
  LISTC LEVEL(SFRDT.DSNDBD) ALL
  LISTC LEVEL(SRED5.DSNDBD) ALL
  LISTC LEVEL(SRED6.DSNDBD) ALL
  LISTC LEVEL(SREDA.DSNDBD) ALL
  LISTC LEVEL(SREDT.DSNDBD) ALL
  LISTC LEVEL(SRUD5.DSNDBD) ALL
  LISTC LEVEL(SRUD6.DSNDBD) ALL
  LISTC LEVEL(SRUDA.DSNDBD) ALL
  LISTC LEVEL(SRUDT.DSNDBD) ALL
  LISTC LEVEL(STGDT.DSNDBD) ALL
  LISTC LEVEL(STSDA.DSNDBD) ALL
  LISTC LEVEL(STSDT.DSNDBD) ALL
  LISTC LEVEL(SURD5.DSNDBD) ALL
  LISTC LEVEL(TATD5.DSNDBD) ALL
  LISTC LEVEL(TRFD5.DSNDBD) ALL
  LISTC LEVEL(UBSD5.DSNDBD) ALL
  LISTC LEVEL(UBSDA.DSNDBD) ALL
  LISTC LEVEL(UBSDT.DSNDBD) ALL
  LISTC LEVEL(UCSD5.DSNDBD) ALL
  LISTC LEVEL(UCSDA.DSNDBD) ALL
  LISTC LEVEL(UCSDT.DSNDBD) ALL
  LISTC LEVEL(UDTD5.DSNDBD) ALL
  LISTC LEVEL(UDTD6.DSNDBD) ALL
  LISTC LEVEL(UDTDA.DSNDBD) ALL
  LISTC LEVEL(UDTDT.DSNDBD) ALL
  LISTC LEVEL(UPSDA.DSNDBD) ALL
  LISTC LEVEL(UPSDT.DSNDBD) ALL
  LISTC LEVEL(WMRD6.DSNDBD) ALL
  LISTC LEVEL(WMRDA.DSNDBD) ALL
  LISTC LEVEL(WMRDT.DSNDBD) ALL
//DB2ELIST EXEC  PGM=IDCAMS
//SYSPRINT DD    DSN=&&DB2ELIST,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD    *
  LISTC LEVEL(AIMDE.DSNDBD) ALL
  LISTC LEVEL(ATMDE.DSNDBD) ALL
  LISTC LEVEL(CBRDE.DSNDBD) ALL
  LISTC LEVEL(DAPDE.DSNDBD) ALL
  LISTC LEVEL(DB2F.DSNDBD) ALL
  LISTC LEVEL(DB2G.DSNDBD) ALL
  LISTC LEVEL(DB2L.DSNDBD) ALL
  LISTC LEVEL(DISDE.DSNDBD) ALL
  LISTC LEVEL(ERSDE.DSNDBD) ALL
  LISTC LEVEL(MAAD5.DSNDBD) ALL
  LISTC LEVEL(MAADE.DSNDBD) ALL
  LISTC LEVEL(MACDA.DSNDBD) ALL
  LISTC LEVEL(MACDE.DSNDBD) ALL
  LISTC LEVEL(MADDE.DSNDBD) ALL
  LISTC LEVEL(MAPDE.DSNDBD) ALL
  LISTC LEVEL(MARDE.DSNDBD) ALL
  LISTC LEVEL(MCCDE.DSNDBD) ALL
  LISTC LEVEL(PCRDB.DSNDBD) ALL
  LISTC LEVEL(PCRDE.DSNDBD) ALL
  LISTC LEVEL(RIDDB.DSNDBD) ALL
//DB2PLIST EXEC  PGM=IDCAMS
//SYSPRINT DD    DSN=&&DB2PLIST,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD    *
  LISTC LEVEL(ACDDE.DSNDBD) ALL
  LISTC LEVEL(BCWDE.DSNDBD) ALL
  LISTC LEVEL(CLIDE.DSNDBD) ALL
  LISTC LEVEL(CYPDE.DSNDBD) ALL
  LISTC LEVEL(DAPDE.DSNDBD) ALL
  LISTC LEVEL(DB2B.DSNDBD) ALL
  LISTC LEVEL(DB2P.DSNDBD) ALL
  LISTC LEVEL(ERSDE.DSNDBD) ALL
  LISTC LEVEL(FWSDE.DSNDBD) ALL
  LISTC LEVEL(IAPDE.DSNDBD) ALL
  LISTC LEVEL(INTDE.DSNDBD) ALL
  LISTC LEVEL(INTDQ.DSNDBD) ALL
  LISTC LEVEL(JACDE.DSNDBD) ALL
  LISTC LEVEL(JGADE.DSNDBD) ALL
  LISTC LEVEL(JGBDE.DSNDBD) ALL
  LISTC LEVEL(JINDE.DSNDBD) ALL
  LISTC LEVEL(JLPDE.DSNDBD) ALL
  LISTC LEVEL(JUDDE.DSNDBD) ALL
  LISTC LEVEL(MKTDE.DSNDBD) ALL
  LISTC LEVEL(MMMDE.DSNDBD) ALL
  LISTC LEVEL(OASDE.DSNDBD) ALL
  LISTC LEVEL(PERD5.DSNDBD) ALL
  LISTC LEVEL(PERDE.DSNDBD) ALL
  LISTC LEVEL(PMXDE.DSNDBD) ALL
  LISTC LEVEL(POLD5.DSNDBD) ALL
  LISTC LEVEL(POLDE.DSNDBD) ALL
  LISTC LEVEL(QSTDE.DSNDBD) ALL
  LISTC LEVEL(REIDE.DSNDBD) ALL
  LISTC LEVEL(UBSDE.DSNDBD) ALL
//DB2QLIST EXEC  PGM=IDCAMS
//SYSPRINT DD    DSN=&&DB2QLIST,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD    *
  LISTC LEVEL(APMDE.DSNDBD) ALL
  LISTC LEVEL(CCIDE.DSNDBD) ALL
  LISTC LEVEL(CDBVCAT.DSNDBD) ALL
  LISTC LEVEL(CDIDE.DSNDBD) ALL
  LISTC LEVEL(CEIDE.DSNDBD) ALL
  LISTC LEVEL(CIADE.DSNDBD) ALL
  LISTC LEVEL(CIZDE.DSNDBD) ALL
  LISTC LEVEL(CLRDE.DSNDBD) ALL
  LISTC LEVEL(CMPDE.DSNDBD) ALL
  LISTC LEVEL(CMTDE.DSNDBD) ALL
  LISTC LEVEL(CPIDE.DSNDBD) ALL
  LISTC LEVEL(CRFDE.DSNDBD) ALL
  LISTC LEVEL(CWPDE.DSNDBD) ALL
  LISTC LEVEL(DAPDE.DSNDBD) ALL
  LISTC LEVEL(DB2U.DSNDBD) ALL
  LISTC LEVEL(EDIDE.DSNDBD) ALL
  LISTC LEVEL(EFPDE.DSNDBD) ALL
  LISTC LEVEL(EISDE.DSNDBD) ALL
  LISTC LEVEL(EMFDE.DSNDBD) ALL
  LISTC LEVEL(ESRDE.DSNDBD) ALL
  LISTC LEVEL(FLSDE.DSNDBD) ALL
  LISTC LEVEL(HRIDE.DSNDBD) ALL
  LISTC LEVEL(IRBDE.DSNDBD) ALL
  LISTC LEVEL(IREDE.DSNDBD) ALL
  LISTC LEVEL(LARDE.DSNDBD) ALL
  LISTC LEVEL(NWMDE.DSNDBD) ALL
  LISTC LEVEL(PAEDE.DSNDBD) ALL
  LISTC LEVEL(PAFDE.DSNDBD) ALL
  LISTC LEVEL(PANDE.DSNDBD) ALL
  LISTC LEVEL(PERDE.DSNDBD) ALL
  LISTC LEVEL(POLDE.DSNDBD) ALL
  LISTC LEVEL(PRLDE.DSNDBD) ALL
  LISTC LEVEL(PRODE.DSNDBD) ALL
  LISTC LEVEL(PSPDA.DSNDBD) ALL
  LISTC LEVEL(PUTDE.DSNDBD) ALL
  LISTC LEVEL(PZMDE.DSNDBD) ALL
  LISTC LEVEL(RIDDE.DSNDBD) ALL
  LISTC LEVEL(ROFDE.DSNDBD) ALL
  LISTC LEVEL(ROSDE.DSNDBD) ALL
  LISTC LEVEL(SEEDE.DSNDBD) ALL
  LISTC LEVEL(SFRDT.DSNDBD) ALL
  LISTC LEVEL(SREDE.DSNDBD) ALL
  LISTC LEVEL(SREDT.DSNDBD) ALL
  LISTC LEVEL(SRUDE.DSNDBD) ALL
  LISTC LEVEL(STSDE.DSNDBD) ALL
  LISTC LEVEL(UBSDE.DSNDBD) ALL
  LISTC LEVEL(UCSDE.DSNDBD) ALL
  LISTC LEVEL(UDTDE.DSNDBD) ALL
  LISTC LEVEL(UPSDE.DSNDBD) ALL
  LISTC LEVEL(WMRDE.DSNDBD) ALL
//*-------------------------------------------------------------------
//* EXECUTA REXX RXALLOC QUE GERA ARQUIVO SEQUENCIAL PARA LOAD
//*-------------------------------------------------------------------
//RXALLOC  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='@RXALLOC',REGION=0K
//SYSEXEC  DD   DSN=&RXLIB,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   DUMMY
//INFILE   DD   DSN=&&DB2JLIST,DISP=(OLD,PASS,DELETE)
//         DD   DSN=&&DB2DLIST,DISP=(OLD,PASS,DELETE)
//         DD   DSN=&&DB2ELIST,DISP=(OLD,PASS,DELETE)
//         DD   DSN=&&DB2PLIST,DISP=(OLD,PASS,DELETE)
//         DD   DSN=&&DB2QLIST,DISP=(OLD,PASS,DELETE)
//OUTFILE  DD   DSN=&&RECIN1,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(150,150),RLSE),
//         DCB=(LRECL=255,RECFM=FB,BLKSIZE=2550)
//*------------------------------------------------------------------
//* LOAD DE TABELA DE CONTROLE
//*------------------------------------------------------------------
//LOAD     EXEC PGM=DSNUTILB,PARM='DB2J',REGION=0K
//STEPLIB  DD   DISP=SHR,DSN=DB2K.DB2EXIT
//         DD   DISP=SHR,DSN=DB2K.DB2LOAD
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)
//SW01WK01 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SW01WK02 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SW01WK03 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SW01WK04 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SW02WK01 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SW02WK02 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SW02WK03 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SW02WK04 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SORTWK01 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SORTWK02 DD   UNIT=SYSDA,SPACE=(CYL,(1200,200),,,ROUND)
//SYSREC   DD   DSN=&&RECIN1,DISP=OLD
//SYSIN    DD   *
LOAD DATA INDDN SYSREC   LOG NO  RESUME YES NOCOPYPEND
 INTO TABLE DBA1ADM.HSTVSAM
 ( "DSNAME"
        POSITION(  00001:00044) CHAR(00044)
 , "HI_A_RBA"
        POSITION(  00046:00061) FLOAT EXTERNAL
 , "HI_U_RBA"
        POSITION(  00063:00078) FLOAT EXTERNAL
 , "DBNAME"
        POSITION(  00080:00087) CHAR(00008)
 , "SPACENAM"
        POSITION(  00089:00096) CHAR(00008)
 , "EXTENTS"
        POSITION(  00098:00107) INTEGER EXTERNAL
 )
//*------------------------------------------------------------------
//* COPY
//*------------------------------------------------------------------
//COPY     EXEC PGM=DSNUTILB,PARM='DB2J',REGION=0K
//STEPLIB  DD   DISP=SHR,DSN=DB2K.DB2EXIT
//         DD   DISP=SHR,DSN=DB2K.DB2LOAD
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSIN    DD   *
OPTIONS EVENT(ITEMERROR, SKIP)
LISTDEF DBLIST
               INCLUDE TABLESPACE DDBA0T00.HSTVSAM

TEMPLATE DDCOPY
         DSN('DBA5.IC0.&DB..&TS..D&DT.')
         UNIT MAGV
         VOLCNT(255)
         DISP(NEW,CATLG,DELETE)
         STACK YES
         RETPD 180

COPY LIST DBLIST
     SHRLEVEL REFERENCE
     FULL YES
     COPYDDN DDCOPY
     CHECKPAGE

MODIFY RECOVERY LIST DBLIST DELETE AGE 180                              00060003
