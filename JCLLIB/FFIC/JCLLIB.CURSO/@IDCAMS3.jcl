//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',           JOB10628
//         NOTIFY=IBM1JCF,CLASS=O
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*-------------------------------------------------------------------
//*
//*-------------------------------------------------------------------
//IDCAMSD  EXEC  PGM=IDCAMS
//SYSPRINT DD    SYSOUT=*
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
//IDCAMSE  EXEC  PGM=IDCAMS
//SYSPRINT DD    SYSOUT=*
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
//IDCAMSA  EXEC  PGM=IDCAMS
//SYSPRINT DD    SYSOUT=*
//SYSIN    DD    *
  LISTC LEVEL(DB2A.DSNDBD) ALL
  LISTC LEVEL(FRGDT.DSNDBD) ALL
  LISTC LEVEL(PSBDD.DSNDBD) ALL
  LISTC LEVEL(PSPDA.DSNDBD) ALL
  LISTC LEVEL(PSPDC.DSNDBD) ALL
  LISTC LEVEL(PSPDD.DSNDBD) ALL
  LISTC LEVEL(PSPDG.DSNDBD) ALL
  LISTC LEVEL(PSPDT.DSNDBD) ALL
  LISTC LEVEL(PSPDV.DSNDBD) ALL
  LISTC LEVEL(PSRDA.DSNDBD) ALL
  LISTC LEVEL(PSRDD.DSNDBD) ALL
  LISTC LEVEL(PSRDG.DSNDBD) ALL
  LISTC LEVEL(PSRDV.DSNDBD) ALL
