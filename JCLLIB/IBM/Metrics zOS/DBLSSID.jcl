//DBL-ssid- JOB -jobcard info here-
//*
//*--------------------------------------------------------------------
//JOBLIB   DD DISP=SHR,DSN=-db2pgmlib-
//**********************************************************************
//*  CREATES AN EXCEPTION RPT & A DB2 MASTER FILE FOR ALL VSAM DSNS IN
//*  CUSTOMER/ACCOUNT:  -cust-      SUBSYSTEM: -ssid-  LPAR: -lpar-
//*
//*  NOTE:  ALL REXX MESSAGES FROM LISTEXT STEP WILL BE IN THE 
//*         EXCEPTION DATASET  (//SYSTSPRT DD).
//*
//* BEFORE RUNNING THIS JOB - READ THE FOLLOWING 'NOTE'S IN THE JCL
//* YOU MAY HAVE TO MAKE ADDITIONAL UPDATES FOR YOUR ENVIRONMENT
//*
//*======================= SYMBOLIC LIST ===============================
//* SYMBOLICS ARE:
//*    JOBCARD INFO HERE = STANDARD DBA JOBCARD FOR THIS CUSTOMER
//*    SSID        = DB2 SUBSYSTEM IDENTIFIER
//*    CUST        = CUSTOMER NAME - MAX 12 BYTES
//*    LPAR        = MACHINE NAME
//*    HLQ         = LOCAL HIGH LEVEL QUALIFIER FOR OUTPUT DATASETS
//*    REXXLIB     = REXX PROGRAM LIBRARY
//*    DB2PGMLIB   = DB2 PROGRAM LIBRARY
//*    VCAT1       = VSAM HIGH LEVEL QUALIFIER USED FOR DB2 DATASETS
//*    VCAT2       = VSAM HIGH LEVEL QUALIFIER USED FOR DB2 DATASETS
//*    VCAT3       = VSAM HIGH LEVEL QUALIFIER USED FOR DB2 DATASETS
//*    ISPPLIB     = PANEL LIBRARY
//*    ISPMLIB     = MESSAGE LIBRARY
//*    ISPSLIB     = SKELETON LIBRARY
//*    ISPTLIB     = TABLE LIBRARY
//*    LN_MGR_2    = 2ND LINE MANAGER - MAX 14 BYTES
//*    DEPT        = IBM DEPARMENT - MAX 6 BYTES
//*    DIV         = IBM DIVISION - MAX 5 BYTES
//*    ENVIR_TYP   = ENVIRONMENT TYPE (PROD,TEST,DEV,QA,STAGING,OTHER)
//*    SERV_OFF    = SERVICE OFFERING (STD, CUSTOM, ONDEMAND, OTHER)
//*    RPTFLAG     = 'Y' OR 'N' - PRODUCES SELECT TYPE RPTS FROM DB2 SYSTEM
//*                         *****
//*SYMBOLICS THAT REQUIRE CHANGES:
//*     -jobcard info here-
//*     -ssid-
//*     -cust-
//*     -lpar-
//*     -hlq-
//*     -rexxlib-
//*     -db2pgmlib-
//*     -vcat1-
//*     -vcat2-
//*     -vcat3-
//*     -ispplib-
//*     -ispmlib-
//*     -ispslib-
//*     -isptlib-
//*     -ln_mgr_2-
//*     -dept-
//*     -div-
//*     -envir_typ-
//*     -serv_off-
//*     -rptflag-
//* ====================== MAINTENANCE LOG =============================
//* VERSION DATE   UPDATED BY   REASON
//*   V030105      A.FARAGHER   NEW VERSION OF VCAT LIST PROGRAM
//*   V050418      RGG/JAL      MODIFY FOR PROTOTYPE DISTRIBUTION
//*   v050422      A.FARAGHER   REPLACE FILEAID W/SORT STEP (ICEMAN)
//*   V050617      RGG/JAL      VERSION 1.1-READY FOR MASS DISTRIBUTION
//*   V051005      A. FARAGHER  VERSION 1.2-ADD NEW FIELDS -PREPARE FOR 
//*   V051130      RGG/JAL      VERSION 1.2-FUTURE DBA DATA MINING FEEDS  
//*
//**********************************************************************
//*
//**********************************************************************
//* PRE-DELETE THE OUTPUT DATASETS                                     *
//**********************************************************************
//DELETE   EXEC PGM=IDCAMS
//SYSPRINT DD   SYSOUT=*
//SYSIN    DD   *
      DELETE '-hlq-.EXTENTS.MASTER.-lpar-.DBL-ssid-'
      DELETE '-hlq-.EXTENTS.EXCEPTS.-lpar-.DBL-ssid-'
      DELETE '-hlq-.VSAMALL.-lpar-.DBL-ssid-'
      DELETE '-hlq-.VSAMLIST.-lpar-.DBL-ssid-'
      IF LASTCC < 9 THEN SET MAXCC = 0
//*
//**********************************************************************
//*  CREATES A MSTR FILE OF ALL LISTCAT INFO FOR SELECTED VSAM DB2 DSNS*
//*    (LIST OF DB2 HLQ'S FOR SYSIN DD COMES FROM VCAT-ssid- JOB)      *
//* NOTE: ADD ADDITIONAL LISTC LVL CARDS IF MORE ARE NEEDED IN SYSIN DD*
//**********************************************************************
//LISTCAT  EXEC PGM=IDCAMS
//SYSPRINT DD DSN=-hlq-.VSAMALL.-lpar-.DBL-ssid-,
//         DISP=(NEW,CATLG,DELETE),
//         DCB=(LRECL=125,BLKSIZE=12000,RECFM=VBA),
//         SPACE=(CYL,(30,10),RLSE)
//SYSIN    DD *
 LISTC LVL(-vcat1-.DSNDBD) ALL
 LISTC LVL(-vcat2-.DSNDBD) ALL
 LISTC LVL(-vcat3-.DSNDBD) ALL
//*
//***********************************************************************
//*  THIS STEP REDUCES THE LISTCAT DATA TO BE INPUTED INTO THE REXX PGM *
//*  BY SORTING OUT THE ROWS THAT ARE NOT NEEDED.                       *
//*                     ****************                                *
//* NOTE: PGM=ICEMAN IS AN ALIAS FOR YOUR INSTALLATION SORT PRODUCT     *
//*                IE.  SYNCSORT, DFSORT                                *
//*       FILE IS VB - VLTEST & VLTESTI ARE REQUIRED IN PARM LIST       *
//*  IF YOU HAVE SYNSCORT USE THE FOLLOWING PARMS:                      *
//*   SORTINPT EXEC PGM=ICEMAN,PARM='MSG=AP,VLTEST=0,VLTESTI=2'         *
//*   DO NOT USE THE PARM 'OPTION VLSCMP' 1 LINE BEFORE THE INCLUDE PARM*
//*  IF YOU HAVE DFSORT THEN USE THE FOLLOWING PARMS:                   *
//*   1. REMOVE FROM THE PARM VLTEST=0,VLTESTI=2                        *
//*   2. ADD THE PARM 'OPTION VLSCMP' 1 LINE BEFORE THE INCLUDE PARM    *
//***********************************************************************
//SORTINPT EXEC PGM=ICEMAN,PARM='MSG=AP,VLTEST=0,VLTESTI=2'
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=-hlq-.VSAMALL.-lpar-.DBL-ssid-,
//            DISP=SHR
//SORTOUT  DD DSN=-hlq-.VSAMLIST.-lpar-.DBL-ssid-,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=(LRECL=125,BLKSIZE=12000,RECFM=VBA),
//            SPACE=(CYL,(30,10),RLSE)
//SORTWK01 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK02 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK03 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD *
 SORT FIELDS=COPY
  INCLUDE COND=((6,10,CH,EQ,C'NONVSAM --'),OR,
                (13,24,CH,EQ,C'VOLSER------------MIGRAT'),OR,
                (13,9,CH,EQ,C'CLUSTER--'),OR,
                (42,10,CH,EQ,C'HI-A-RBA--'),OR,
                (42,10,CH,EQ,C'HI-U-RBA--'),OR,
                (71,8,CH,EQ,C'TRACKS--'),OR,
                (71,9,CH,EQ,C'EXTENTS--'))
 END
//*
//**********************************************************************
//*  THIS STEP RUNS THE REXX PROGRAM MSTR DATA FILE & EXC RPT CREATED  *
//*  NOTE:  REXX CODE IN LISTEXTS STEP AUTOMATICALLY EXCLUDES          *
//*         ALL DATABASES THAT BEGIN WITH DSN* and BMC*.               *
//**********************************************************************
//LISTEXT   EXEC PGM=IKJEFT01,REGION=4096K
//*----------------------------------------------------
//* DATASETS USED BY ISPF                             -
//*----------------------------------------------------
//ISPLOG    DD DUMMY,DCB=(LRECL=125,BLKSIZE=129,RECFM=VA)
//ISPPROF   DD UNIT=SYSDA,SPACE=(TRK,(9,1,4)),
//          DCB=(LRECL=80,BLKSIZE=6160,RECFM=FB,DSORG=PO)
//ISPPLIB   DD DSN=-ispplib-,DISP=SHR
//ISPMLIB   DD DSN=-ispmlib-,DISP=SHR
//ISPSLIB   DD DSN=-ispslib-,DISP=SHR
//ISPTLIB   DD DSN=-isptlib-,DISP=SHR
//SYSPROC   DD DSN=-rexxlib-,DISP=SHR
//SYSEXEC   DD DSN=-rexxlib-,DISP=SHR
//*-----------------------------------------------------
//* DATASETS USED BY TSO                               -
//*-----------------------------------------------------
//VSAMLIST DD DSN=-hlq-.VSAMLIST.-lpar-.DBL-ssid-,DISP=SHR
//RPTMSTR  DD DSN=-hlq-.EXTENTS.MASTER.-lpar-.DBL-ssid-,
//    DISP=(NEW,CATLG,CATLG),
//    UNIT=SYSDA,
//    SPACE=(CYL,(5,3),RLSE),
//    DCB=(RECFM=FB,LRECL=250,BLKSIZE=0)
//SYSTSPRT DD  DSN=-hlq-.EXTENTS.EXCEPTS.-lpar-.DBL-ssid-,
//    DISP=(NEW,CATLG,CATLG),
//    UNIT=SYSDA,
//    SPACE=(CYL,(5,3),RLSE),
//    DCB=(RECFM=FB,LRECL=80,BLKSIZE=0)
//SYSUDUMP DD SYSOUT=*
//**********************************************************************
//*           INSTRUCTS FOR INPUT PARAMETERS                           *
//*           =================================                        *
//* 1.  //SYSTSIN DD *                                                 *
//*       ISPSTART CMD(%LISTEXTS CUST,LN_MGR_2,DEPT,DIVISION,          *
//*               ENVIR_TYP,SERV_OFF,RPTFLAG)                          *
//*                                                                    *
//*  %LISTEXTS  = NAME OF REXX CLIST TO BE RUN                         *
//*  CUST       = CUSTOMER NAME - MAX 12 BYTES                         *
//*  LN_MGR_2   = 2ND LINE MANAGER - MAX 14 BYTES                      *
//*  DEPT       = IBM DEPARMENT - MAX 6 BYTES                          *
//*  DIV        = IBM DIVISION - MAX 5 BYTES                           *
//*  ENVIR_TYP  = ENV TYPE (PROD,TEST,DEV,QA,STAGING,OTHER)-MAX 8 BYTES*
//*  SERV_OFF   = SVC OFFERING (STD, CUSTOM, ONDEMAND, OTHER)-MAX 9 BYT*
//*  RPTFLAG = 'Y' OR 'N' - PRODUCES SELECT TYPE RPTS FROM DB2 SYSTEM  *
//*                                                                    *
//* 2. //INDB2SYS  DD  *    (USE COMMA BETWEEN ARGUMENT FIELDS)        *
//*      SSID,EXTLIM,VCAT   EXAMPLE:  P2KH,40,IADBPD88                 *
//*                                                                    *
//*  SSID   = DB2 SUBSYSTEM ID                                         *
//*  EXTLIM = EXTENT THRESHHOLD RPT LIMIT FOR DB2 VSAM DATASETS        *
//*           SUGGESTED VALUE FOR MOST ENVIRONMENTS => 40              *
//*  VCAT   = HLQ OF DB2 DATASET                                       *
//*                                                                    *
//*  REPEAT AS NEEDED FOR UNIQUE HLQ'S                                 *
//*  THERE MUST BE A VCAT ENTRY LISTED FOR EVERY VCAT ENTRY THAT WAS   *
//*  IN THE LISTCAT STEP - SYSIN DD STMT  (IN THE EXACT SAME ORDER)    *
//**********************************************************************
//**********************************************************************
//*                                                                    *
//* //INDB2SYS  DD  *                                                  *
//* PARM CARD ARGUMENT FIELDS ARE COMMA DELIMITED                      *
//*  DB2SYS1,DSNEXT1,DSNHLQ1                                           *
//*  DB2SYQ1,DSNEXT2,DSNHLQ2                                           *
//*  ...                                                               *
//*  ..                                                                *
//*  REPEAT AS NEEDED FOR UNIQUE HLQ'S                                 *
//**********************************************************************
//SYSTSIN  DD *
 ISPSTART CMD(%LISTEXTS -CUST-,-ln_mgr_2-,-dept-,-div-,     +
   -envir_typ-,-serv_off-,-rptflag-)
//*
//INDB2SYS  DD  *
  -ssid-,-extlim-,-vcat1-
  -ssid-,-extlim-,-vcat2-
  -ssid-,-extlim-,-vcat3-
/*
//****   END OF DBLSSID.TXT   ****//
