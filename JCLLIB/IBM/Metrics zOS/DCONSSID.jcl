//DCON-ssid- JOB -jobcard info here-
//*
//JOBLIB   DD DISP=SHR,DSN=-db2pgmlib-
//*********************************************************************
//*     DCONNECT - THIS REXX PROGRAM DOES A DB2 CATALOG QUERY TO
//*                TEST THE DB2 TO REXX INTERFACE FOR A DB2
//*                SUBSYSTEM.
//*              - IT IS RUN IN THE DCONSSID JOB.
//*              - IT PERFORMS THE FOLLOWING SELECT STMT:
//*                  SELECT DBNAME, TSNAME FROM SYSIBM.SYSTABLES
//*                    WHERE DBNAME = ? AND TSNAME = ?;
//*                   (DBNAME AND TSNAME ARE SUPPLIED ARGUMENTS)
//*              - THIS PROGRAM REQUIRES DB2 V6 OR ABOVE
//*********************************************************************
//*              INSTRUCTS FOR INPUT PARAMETERS
//*              ==============================
//* 1. //SYSTSIN  DD *
//*      DCONSSID SSID DBNAME TSNAME
//*
//*  DCONSSID  = NAME OF REXX CLIST TO BE RUN
//*  SSID      = DB2 SUBSYSTEM ID
//*  DBNAME    = DATABASE NAME TO BE USED IN WHERE CLAUSE - DBDSN06
//*  TSNAME    = TABLESPACE NAME TO BE USED IN WHERE CLAUSE - SYSCOPY
//*======================= SYMBOLIC LIST ===============================
//* SYMBOLICS ARE:
//*    JOBCARD INFO HERE = STANDARD DBA JOBCARD FOR THIS CUSTOMER
//*    SSID              = DB2 SUBSYSTEM ID
//*    REXXLIB           = REXX PROGRAM LIBRARY
//*                         *****
//* SYMBOLICS THAT REQUIRE CHANGES:
//*    -jobcard info here-
//*    -db2pgmlib-
//*    -ssid-
//*    -rexxlib-
//*=================== MAINTENANCE LOG =================================
//* DATE    UPDATED BY  REASON
//* 022505  A.FARAGHER  NEW VERSION OF PROGRAM
//* 041805  RGG/JAL     MODIFY FOR PROTOTYPE DISTRIBUTION
//* 050617  RGG/JAL     VERSION 1.1-READY FOR MASS DISTRIBUTION
//**********************************************************************
//DCON-ssid-  EXEC PGM=IKJEFT01,DYNAMNBR=50,REGION=4096K
//SYSPROC   DD DSN=-rexxlib-,DISP=SHR
//SYSEXEC   DD DSN=-rexxlib-,DISP=SHR
//SYSIN     DD DUMMY
//SYSUDUMP  DD SYSOUT=*
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSTSIN   DD *
DCONNECT -ssid- DSNDB06 SYSCOPY
/*
//****   END OF DCONSSID.TXT   ****//
