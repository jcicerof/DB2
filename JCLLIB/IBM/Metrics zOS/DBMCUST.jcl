//DBM-cust- JOB -jobcard info here-
//*
//**********************************************************************
//* THIS JOB RUNS AFTER ALL THE DB2 DBLSSID JOBS HAVE COMPLETED AND
//* DOES A SORTMERGE OF ALL THE DASD LISTEXT DATSETS FROM THE DBLSSID
//* JOBS INTO A MASTER FILE TO BE SENT TO ONE LPAR IMAGE FOR A FINAL
//* ROLL UP TO FEED THE METRICS REPORT PROCESS.
//*
//* BEFORE RUNNING THIS JOB - READ THE FOLLOWING 'NOTE'S IN THE JCL
//* YOU MAY HAVE TO MAKE ADDITIONAL UPDATES FOR YOUR ENVIRONMENT
//*
//*======================= SYMBOLIC LIST ===============================
//* SYMBOLICS ARE:
//*    JOBCARD INFO HERE = STANDARD DBA JOBCARD FOR THIS CUSTOMER
//*    CUST              = CUSTOMER OR ACCOUNT - MAX 5 BYTES
//*    HLQ               = LOCAL HIGH LEVEL QUALIFIER
//*    LPAR# (#-1,2,3,4) = LPAR'S OF INCOMING DATASETS TO BE MERGED
//*    LPAR              = MACHINE NAME WHERE THIS JOB IS RUNNING
//*    SSID              = DB2 SUBSYSTEM IDENTIFIER
//*    REXXLIB           = YOUR REXX LIBRARY NAME
//*                         *****
//* SYMBOLICS THAT REQUIRE CHANGES:
//*    -jobcard info here-
//*    -cust-
//*    -hlq-
//*    -lpar#-   (#-1,2,3,4)                                     
//*    -lpar-     
//*    -ssid-
//*    -rexxlib-
//* ====================== MAINTENANCE LOG =============================
//* VERSION DATE   UPDATED BY   REASON
//*   V030105      A.FARAGHER   NEW VERSION OF VCAT LIST PROGRAM
//*   V050418      RGG/JAL      MODIFY FOR PROTOTYPE DISTRIBUTION
//*   V050617      RGG/JAL      VERSION 1.1-READY FOR MASS DISTRIBUTION
//*   V051005      A. FARAGHER  VERSION 1.2-ADD NEW FIELDS -PREPARE FOR 
//*   V051130      RGG/JAL      VERSION 1.2-FUTURE DBA DATA MINING FEEDS
//**********************************************************************
//*
//**********************************************************************
//* WORKFILE DELETE STEP
//**********************************************************************
//DELETE   EXEC PGM=IDCAMS
//SYSPRINT DD   SYSOUT=*
//SYSIN    DD   *
      DELETE '-hlq-.EXTENTS.MASTER.-lpar-.DBM-cust-'
      DELETE '-hlq-.METRICS.-lpar-.DBM-cust-.DB2'
      DELETE '-hlq-.METRICS.SUM.-lpar-.DBM-cust-.DB2'
      IF LASTCC < 9 THEN SET MAXCC = 0
//*
//********************************************************************
//* INPUT FILES TO THE SORT ARE THE OUTPUT MASTER EXTENT DATASET FROM
//* THE DBLSSID JOB.  THIS STEP TAKE THE INPUT FILES AND SORTS OUT THE
//* ROWS THAT ARE NOT NEEDED
//*                          *****
//* NOTE: PGM=ICEMAN IS REALLY AN ALLIAS FOR SYNCSORT OR DFSORT
//*                          *****
//*       THIS IS A VB FILE SO THE SPECAIL PARMS VLTEST AND
//*       VLTESTI ARE REQUIRED
//* IF YOU HAVE SYNCSORT USE THE FOLLOWING PARMS:
//*   SORTINPT EXEC PGM=ICEMAN,PARM='MSG=AP,VLTEST=0,VLTESTI=2'
//*   DO NOT USE THE PARM 'OPTION VLSCMP' 1 LINE BEFORE THE INCLUDE PARM
//* IF YOU HAVE DFSORT THEN USE THE FOLLOWING PARMS:
//*    1. REMOVE FROM THE PARM VLTEST=0,VLTESTI=2
//*    2. ADD THE PARM 'OPTION VLSCMP' 1 LINE BEFORE THE INCLUDE PARM
//********************************************************************
//SORTINPT EXEC PGM=ICEMAN,PARM='MSG=AP'
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=-hlq-.EXTENTS.MASTER.-lpar1-.DBL-ssid-,
//            DISP=SHR
//*        DD DSN=-hlq-.EXTENTS.MASTER.-lpar2-.DBL-ssid-,
//*           DISP=SHR
//*        DD DSN=-hlq-.EXTENTS.MASTER.-lpar3-.DBL-ssid-,
//*           DISP=SHR
//*        DD DSN=-hlq-.EXTENTS.MASTER.-lpar4-.DBL-ssid-,
//*           DISP=SHR
//SORTOUT  DD DSN=-hlq-.EXTENTS.MASTER.-lpar-.DBM-cust-,
//            DCB=(RECFM=FB,LRECL=250,DSORG=PS),
//            SPACE=(CYL,(30,10),RLSE),UNIT=SYSDA,
//            DISP=(NEW,CATLG,CATLG)
//SORTWK01 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK02 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK03 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK04 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK05 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SORTWK06 DD UNIT=SYSDA,SPACE=(CYL,(10,10),RLSE)
//SYSIN    DD *
 SORT FIELDS=(149,20,A,136,12,A,81,8,A,90,4,A,95,8,A,104,8,A),FORMAT=CH
  INCLUDE COND=((3,8,CH,EQ,C'.DSNDBC.'),OR,
                (4,8,CH,EQ,C'.DSNDBC.'),OR,
                (5,8,CH,EQ,C'.DSNDBC.'),OR,
                (6,8,CH,EQ,C'.DSNDBC.'),OR,
                (7,8,CH,EQ,C'.DSNDBC.'),OR,
                (8,8,CH,EQ,C'.DSNDBC.'),OR,
                (9,8,CH,EQ,C'.DSNDBC.'),OR,
                (10,8,CH,EQ,C'.DSNDBC.'))
//*
//**********************************************************************
//* THIS STEP PRODUCES THE DB2 DASD METRICS REPORT
//**********************************************************************
//*              INSTRUCTS FOR INPUT PARAMETERS                        *
//*              ==============================                        *
//* 1. //PARM='DMETRICS'                                               *
//*                                                                    *
//*  DMETRICS   = NAME OF REXX CLIST TO BE RUN                         *
//*                                                                    *
//* 2. //DEXCLUDE DD *    (OPTIONAL) TO EXCLUDE DB FROM METRICS TOTALS *
//*    * COLUMN 1 MEANS COMMENT                                        *
//*    * CUSTOMER COL 3 - 13 CHAR MAX                                  *   
//*    * LPAR     COL 17 - 9 CHAR MAX                                  *
//*    * DB2SYS   COL 27 - 5 CHAR MAX                                  *
//*    * DBNAME   COL 35 - 8 CHAR MAX                                  *
//*    * EXAMPLE:                                                      *
//*      ATT           DG00      DSNP     IACMAPDB                     *
//*                                                                    *
//**********************************************************************
//DMETRICS  EXEC PGM=IKJEFT01,REGION=4096K,
// PARM='DMETRICS'
//SYSPROC   DD DSN=-rexxlib-,DISP=SHR
//SYSEXEC   DD DSN=-rexxlib-,DISP=SHR
//**********************************************************************
//*     THIS DD CAN BE AN EXTERNAL DATASET FB 80 BYTES.                *
//*DEXCLUDE  DD DSN=DBA.DBATEAM.METRICS.VIST.SYA.DB2.EXCLUDES,DISP=SHR *
//*                           OR                                       *
//*   ASTERISK IN COLUMN 1 MEANS COMMENT ONLY.                         *
//*   PUT DATABASES TO BE EXCLUDED FROM DB2 METRICS REPORTING          *
//*   CUSTOMER      LPAR      DB2SYS  DBDNM                            *
//*   ------------- --------- -----   --------                         *
//*   VISTEON       SYA3      DB2I    CUT201RD                         *
//**********************************************************************
//DEXCLUDE  DD *
* COLUMN 1 MEANS COMMENT          
* ADD EXCLUDE DATA LINE HERE IF A DB IS TO BE EXCLUDED FROM TOTALS    
//*
//DBMSTR    DD DSN=-hlq-.EXTENTS.MASTER.-lpar-.DBM-cust-,DISP=SHR
//SYSTSIN   DD DUMMY
//SYSUDUMP  DD SYSOUT=*
//SYSTSPRT  DD SYSOUT=*
//MREPORT   DD DSN=-hlq-.METRICS.-lpar-.DBM-cust-.DB2,
//             DISP=(NEW,CATLG,CATLG),
//             UNIT=SYSDA,
//             SPACE=(TRK,(1,1),RLSE),
//             DCB=(RECFM=FB,LRECL=133,BLKSIZE=0)
//SUMRPT    DD DSN=-hlq-.METRICS.SUM.-lpar-.DBM-cust-.DB2,
//             DISP=(NEW,CATLG,CATLG),
//             UNIT=SYSDA,
//             SPACE=(TRK,(1,1),RLSE),
//             DCB=(RECFM=FB,LRECL=150,BLKSIZE=0)
/*
//****   END OF DBMCUST.TXT   ****//
