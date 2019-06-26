//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'RUNSTATS  *',          JOB02859
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
//DSNUPROC.SYSREC00 DD DSN=IBM1H2J.DB2Q.UNLD.UCST@MRB.@CLM,
//             DISP=SHR
//DSNUPROC.SYSIN DD *
  LOAD DATA LOG NO INDDN SYSREC00 REPLACE NOCOPYPEND INTO TABLE
      "DB2TEST"."UCST_MRB_CLM"
   (
   MC_CLM_ID_NBR                          POSITION(       1         )
   CHAR(                     11) ,
   MC_CAR_INS_CO_CD                       POSITION(      12         )
   CHAR(                      3) ,
   MC_POLH_LIC_NBR                        POSITION(      15         )
   CHAR(                     25) ,
   MC_POLH_LIC_ST_CD                      POSITION(      40         )
   CHAR(                      2) ,
   MC_POLH_BRTH_DT                        POSITION(      42         )
   DATE EXTERNAL(            10) ,
   MC_POLH_LAST_NM                        POSITION(      52         )
   CHAR(                     16) ,
   MC_POLH_FRST_NM                        POSITION(      68         )
   CHAR(                     12) ,
   MC_OPER_LIC_NBR                        POSITION(      80         )
   CHAR(                     25) ,
   MC_OPER_LIC_ST_CD                      POSITION(     105         )
   CHAR(                      2) ,
   MC_OPER_BRTH_DT                        POSITION(     107         )
   DATE EXTERNAL(            10) ,
   MC_OPER_LAST_NM                        POSITION(     117         )
   CHAR(                     16) ,
   MC_OPER_FRST_NM                        POSITION(     133         )
   CHAR(                     12) ,
   MC_INCID_DT                            POSITION(     145         )
   DATE EXTERNAL(            10) ,
   MC_INCID_TOWN_CD                       POSITION(     155         )
   CHAR(                      3) ,
   MC_POL_EFF_DT                          POSITION(     158         )
   DATE EXTERNAL(            10) ,
   MC_POL_NBR                             POSITION(     168         )
   CHAR(                     16) ,
   MC_CAT_CD                              POSITION(     184         )
   CHAR(                      2) ,
   MC_OPER_ADDR_1                         POSITION(     186         )
   CHAR(                     20) ,
   MC_OPER_ADDR_2                         POSITION(     206         )
   CHAR(                     20) ,
   MC_OPER_CITY_NM                        POSITION(     226         )
   CHAR(                     15) ,
   MC_OPER_ST_CD                          POSITION(     241         )
   CHAR(                      2) ,
   MC_OPER_ZIP_CD                         POSITION(     243         )
   CHAR(                     10) ,
   MC_OPER_MID_NM                         POSITION(     253         )
   CHAR(                      8) ,
   MC_POLH_ADDR_1                         POSITION(     261         )
   CHAR(                     20) ,
   MC_POLH_ADDR_2                         POSITION(     281         )
   CHAR(                     20) ,
   MC_POLH_CITY_NM                        POSITION(     301         )
   CHAR(                     15) ,
   MC_POLH_ST_CD                          POSITION(     316         )
   CHAR(                      2) ,
   MC_POLH_ZIP_CD                         POSITION(     318         )
   CHAR(                     10) ,
   MC_POLH_MID_NM                         POSITION(     328         )
   CHAR(                      8) ,
   MC_VEH_CLASS_CD                        POSITION(     336         )
   CHAR(                      4) ,
   MC_VEH_ID_NBR                          POSITION(     340         )
   CHAR(                     17) ,
   MC_ATFLT_REV_RSN                       POSITION(     357         )
   CHAR(                      2) ,
   MC_ATFLT_STAT_CD                       POSITION(     359         )
   CHAR(                      1) ,
   MC_ATFLT_STAT_DT                       POSITION(     360         )
   DATE EXTERNAL(            10) ,
   MC_COMPR_REV_RSN                       POSITION(     370         )
   CHAR(                      2) ,
   MC_COMPR_STAT_CD                       POSITION(     372         )
   CHAR(                      1) ,
   MC_COMPR_STAT_DT                       POSITION(     373         )
   DATE EXTERNAL(            10) ,
   MC_SURCHG_CD                           POSITION(     383         )
   CHAR(                      2) ,
   MC_SURCHG_DT                           POSITION(     385         )
   DATE EXTERNAL(            10) ,
   MC_SURCHG_STAT_CD                      POSITION(     395         )
   CHAR(                      1) ,
   MC_SURCHG_STAT_DT                      POSITION(     396         )
   DATE EXTERNAL(            10) ,
   MC_PREM_TOWN_CD                        POSITION(     406         )
   CHAR(                      3)
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
