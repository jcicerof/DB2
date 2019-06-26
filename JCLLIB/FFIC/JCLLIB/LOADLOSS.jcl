//IBM1JCF3 JOB (T00101,610,Z000900,000,A11,000),'RUNSTATS  *',          JOB03366
//*       RESTART=STEPNAME, <== FOR RESTART REMOVE * AND ENTER STEP NAME
//         NOTIFY=IBM1JCF,USER=DB2TEST
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*        CLASS=L
//*
//*
//**********************************************************************
//*
//* DB2 ADMIN GENERATED JOB - RUN LOAD UTILITY (TABLES)
//*
//***********************************************************ADB2UTL****
//*
//**********************************************************************
//* STEP LOAD0: LOAD TABLES
//**********************************************************************
//LOAD0  EXEC DSNUPROC,SYSTEM=DB2D,
//             LIB='DB2S.DB2LOAD',
//             UID=''
//DSNUPROC.SYSREC00 DD DSN=IBM1H2J.DB2Q.UNLD.UCST@MRB.@LOSS,
//             DISP=SHR
//DSNUPROC.SYSIN DD *
  LOAD DATA LOG NO INDDN SYSREC00 RESUME YES NOCOPYPEND
  INTO TABLE
      "DB2TEST"."UCST_MRB_LOSS"
   (
   ML_CLM_ID_NBR                          POSITION(       1         )
   CHAR(                     11) ,
   ML_CLM_TYPE_CD                         POSITION(      12         )
   CHAR(                      1) ,
   ML_TYPE_LOSS_CD                        POSITION(      13         )
   CHAR(                      2) ,
   ML_NOTICE_DT                           POSITION(      15         )
   DATE EXTERNAL(            10) ,
   ML_LOSS_AMT                            POSITION(      25:      29)
   DECIMAL                       ,
   ML_PAYEE_LAST_NM                       POSITION(      30         )
   CHAR(                     10) ,
   ML_PAYEE_ADDR_1                        POSITION(      40         )
   CHAR(                     15) ,
   ML_LOSS_STAT_CD                        POSITION(      55         )
   CHAR(                      1) ,
   ML_LOSS_STAT_DT                        POSITION(      56         )
   DATE EXTERNAL(            10)
   )
//  DD DATA,DLM='@@'
@@
//DSNUPROC.SYSUT1 DD  DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(50,5),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTOUT DD DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(50,5),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK01 DD DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(50,5),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK02 DD DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(50,5),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK03 DD DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(50,5),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK04 DD  DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(50,5),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SYSMAP DD  DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(50,5),RLSE),
//             UNIT=SYSDA
