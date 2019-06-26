//IBM1JCF2 JOB (T00101,610,Z000900,000,A11,000),'RUNSTATS  *',          JOB14318
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
//DSNUPROC.SYSREC00 DD DSN=IBM1H2J.DB2Q.UNLD.UCST@MRB.@TRAN,
//             DISP=SHR
//DSNUPROC.SYSIN DD *
  LOAD DATA LOG NO INDDN SYSREC00 RESUME YES NOCOPYPEND INTO TABLE
      "DB2TEST"."UCST_MRB_TRAN"
   (
   MT_CLM_ID_NBR                          POSITION(       1         )
   CHAR(                     11) ,
   MT_CLM_TYPE_CD                         POSITION(      12         )
   CHAR(                      1) ,
   MT_TYPE_LOSS_CD                        POSITION(      13         )
   CHAR(                      2) ,
   MT_TRAN_DT_TM_STMP                     POSITION(      15         )
   TIMESTAMP EXTERNAL(       26) ,
   MT_TRAN_CD                             POSITION(      41         )
   CHAR(                      2) ,
   MT_TRAN_STAT_CD                        POSITION(      43         )
   CHAR(                      1) ,
   MT_TRAN_STAT_DT                        POSITION(      44         )
   DATE EXTERNAL(            10) ,
   MT_TRAN_XMIT_DT                        POSITION(      54         )
   DATE EXTERNAL(            10) ,
   MT_TRAN_IMAGE                          POSITION(      64         )
   VARCHAR
   )
//  DD DATA,DLM='@@'
@@
//DSNUPROC.SYSUT1 DD  DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(5,5),RLSE),
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
