//VCAT-ssid- JOB -jobcard info here-
//*
//**********************************************************************
//*  LISTS ALL VCAT ENTRIES IN A DB2 SUBSYSTEM
//*======================= SYMBOLIC LIST ===============================
//* SYMBOLICS ARE:
//*    JOBCARD INFO HERE = STANDARD DBA JOBCARD FOR THIS CUSTOMER
//*    SSID              = DB2 SUBSYSTEM ID
//*    DB2PGMLIB         = DB2 PROGRAM LIBRARY
//*                         *****
//* SYMBOLICS THAT REQUIRE CHANGES:
//*    -jobcard info here-
//*    -ssid-
//*    -db2pgmlib-
//* ====================== MAINTENANCE LOG =============================
//* VERSION DATE   UPDATED BY   REASON
//*   V030105      A.FARAGHER   NEW VERSION OF VCAT LIST PROGRAM
//*   V050418      RGG/JAL      MODIFY FOR PROTOTYPE DISTRIBUTION
//*   v050422      A FARAGHER   GENERATE O/P IN LISTCAT CARD FORMAT
//*   V050617      RGG/JAL      VERSION 1.1-READY FOR MASS DISTRIBUTION
//*
//**********************************************************************
//* SELECT QUERY ON DB2 CATALOG FOR SUBSYSTEM - -ssid-
//**********************************************************************
//DB2VCAT EXEC PGM=IKJEFT01
//STEPLIB  DD DISP=SHR,DSN=-db2pgmlib-
//SYSPRINT DD SYSOUT=*
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
DSN SYSTEM(-ssid-)
RUN PROGRAM(DSNTEP2) PLAN(DSNTEP2) LIB('-db2pgmlib-')
END
//*
//SYSIN    DD *
 SELECT ' LISTC LVL('|| STRIP(CHAR(VCATNAME)) || '.DSNDBD) ALL'
   FROM SYSIBM.SYSSTOGROUP
   GROUP BY VCATNAME
 UNION
 SELECT ' LISTC LVL('|| STRIP(CHAR(VCATNAME)) || '.DSNDBD) ALL'
   FROM SYSIBM.SYSTABLEPART
   WHERE VCATNAME ¬= '00000001'
   GROUP BY VCATNAME
 UNION
 SELECT ' LISTC LVL('|| STRIP(CHAR(VCATNAME)) || '.DSNDBD) ALL'
   FROM SYSIBM.SYSINDEXPART
   WHERE VCATNAME ¬= '00000001'
   GROUP BY VCATNAME;
/*
//****   END OF VCATSSID.TXT   ****//
