//IBM1JCF0 JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',            JOB15809
//         MSGLEVEL=(1,1),MSGCLASS=X,USER=DB2PROD,
//         CLASS=L,NOTIFY=IBM1JCF TYPRUN=SCAN
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*--------------------------------------------------------------------
//* DB2A DB2A.DB2RUNLB
//* DB2D DB2S.DB2RUNLB
//* DB2J DB2K.DB2RUNLB
//* DB2E DB2F.DB2RUNLB
//* DB2H DB2H.DB2RUNLB
//* DB2P DB2C.DB2RUNLB
//* DB2Q DB2R.DB2RUNLB
//*--------------------------------------------------------------------
//         SET DSN=DB2J,DB2LIB=DB2K
//*
//IEBGENER EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//SYSUT1   DD *
  DSN SYSTEM(DB2J)
  RUN PROGRAM(DSNTEP2) PARMS('/ALIGN(LHS) MIXED')
//SYSUT2   DD DSN=&&DSNTEP2,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(1,1),RLSE)
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//IEBGENER EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//SYSUT1   DD *
  DSN SYSTEM(DB2J)
  RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIAUL) PARMS('SQL')
//SYSUT2   DD DSN=&&DSNTIAUL,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(1,1),RLSE)
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//CREATTS EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD DSN=&DB2LIB..DB2LOAD,DISP=SHR
//         DD DSN=&DB2LIB..DB2RUNLB,DISP=SHR
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DSN=&&DSNTEP2,DISP=(OLD,PASS,DELETE)
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD *
SET CURRENT SQLID = 'DB2PROD';
COMMIT;
DROP   DATABASE DB2ADM;
COMMIT;
CREATE DATABASE DB2ADM;
COMMIT;

  CREATE TABLESPACE MIGVRS11
    IN DB2ADM
    USING STOGROUP GDAP0T00
    PRIQTY 1400  SECQTY 1400
    ERASE  NO
    FREEPAGE 0 PCTFREE 5
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 1
    LOGGED
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ROW
    LOCKMAX SYSTEM
    CLOSE NO
    COMPRESS NO
    CCSID      UNICODE
    DEFINE YES
    MAXROWS 255;
  COMMIT;
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//CREATTB EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD DSN=&DB2LIB..DB2LOAD,DISP=SHR
//         DD DSN=&DB2LIB..DB2RUNLB,DISP=SHR
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DSN=&&DSNTEP2,DISP=(OLD,PASS,DELETE)
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD *
SET CURRENT SQLID = 'DB2PROD';
COMMIT;
CREATE TABLE DB2ADM.MIGVRS11 LIKE SYSIBM.SYSTABLES
    IN DB2ADM.MIGVRS11;
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN'                                00070000
//STEPLIB  DD   DSN=&DB2LIB..DB2EXIT,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00090000
//SYSPRINT DD   SYSOUT=*                                                00100000
//UTPRINT  DD   SYSOUT=*                                                00110000
//SYSUDUMP DD   SYSOUT=*                                                00120000
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00130000
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00140000
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00150000
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00160000
//SYSDISC  DD   DUMMY                                                   00170000
//SYSREC   DD   DUMMY                                                   00180000
//SYSPUNCH DD   DUMMY                                                   00180000
//SYSIN    DD   *                                                       00190000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200000

LISTDEF LISTDBA
    INCLUDE TABLESPACE DSNDB06.SYSTSTAB

TEMPLATE DDREC DSN('DBA5.DB2.UNL.MIGV11.DATA')                          00240002
   DISP(NEW,CATLG,DELETE)                                               00250000
   UNIT SYSDA                                                           00260001

UNLOAD LIST LISTDBA PUNCHDDN SYSPUNCH                                   00270000
       UNLDDN DDREC                                                     00280000
       SHRLEVEL REFERENCE                                               00290000
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//LOAD     EXEC PGM=DSNUTILB,PARM='&DSN'
//STEPLIB  DD   DSN=&DB2LIB..DB2EXIT,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00090000
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUT1   DD  UNIT=SYSDA,SPACE=(TRK,(100,220),RLSE)
//SORTOUT  DD  UNIT=SYSDA,SPACE=(TRK,(100,220),RLSE)
//SYSERR   DD  DSN=&&SYSERR,
//             DISP=(,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(100,220),RLSE)
//SYSMAP   DD  DSN=&SYSMAP,
//             DISP=(,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(100,215),RLSE)
//SYSDISC  DD  DSN=&&SYSDISC,
//             DISP=(,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(100,215),RLSE)
//SYSIN     DD *
TEMPLATE SREC
     DSN('DBA5.DB2.UNL.MIGV11.DATA')
     DISP(OLD,DELETE,KEEP)

LOAD DATA INDDN SREC LOG NO  REPLACE NOCOPYPEND
 STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
 UNICODE CCSID(00367,01208,01200)
 INTO TABLE DB2ADM.MIGVRS11
 WHEN(00001:00002) = X'0013'
 ( "NAME"
  POSITION(  00003:00132) VARCHAR MIXED
 , "CREATOR"
  POSITION(  00133:00262) VARCHAR MIXED
 , "TYPE"
  POSITION(  00263:00263) CHAR MIXED(001)
 , "DBNAME"
  POSITION(  00264:00289) VARCHAR MIXED
 , "TSNAME"
  POSITION(  00290:00315) VARCHAR MIXED
 , "DBID"
  POSITION(  00316:00317) SMALLINT
 , "OBID"
  POSITION(  00318:00319) SMALLINT
 , "COLCOUNT"
  POSITION(  00320:00321) SMALLINT
 , "EDPROC"
  POSITION(  00322:00347) VARCHAR MIXED
 , "VALPROC"
  POSITION(  00348:00373) VARCHAR MIXED
 , "CLUSTERTYPE"
  POSITION(  00374:00374) CHAR MIXED(001)
 , "CLUSTERRID"
  POSITION(  00375:00378) INTEGER
 , "CARD"
  POSITION(  00379:00382) INTEGER
 , "NPAGES"
  POSITION(  00383:00386) INTEGER
 , "PCTPAGES"
  POSITION(  00387:00388) SMALLINT
 , "IBMREQD"
  POSITION(  00389:00389) CHAR MIXED(001)
 , "REMARKS"
  POSITION(  00390:01153) VARCHAR MIXED
 , "PARENTS"
  POSITION(  01154:01155) SMALLINT
 , "CHILDREN"
  POSITION(  01156:01157) SMALLINT
 , "KEYCOLUMNS"
  POSITION(  01158:01159) SMALLINT
 , "RECLENGTH"
  POSITION(  01160:01161) SMALLINT
 , "STATUS"
  POSITION(  01162:01162) CHAR MIXED(001)
 , "KEYOBID"
  POSITION(  01163:01164) SMALLINT
 , "LABEL"
  POSITION(  01165:01256) VARCHAR MIXED
 , "CHECKFLAG"
  POSITION(  01257:01257) CHAR MIXED(001)
 , "CHECKRID"
  POSITION(  01258:01261) CHAR(00004)
 , "AUDITING"
  POSITION(  01262:01262) CHAR MIXED(001)
 , "CREATEDBY"
  POSITION(  01263:01392) VARCHAR MIXED
 , "LOCATION"
  POSITION(  01393:01522) VARCHAR MIXED
 , "TBCREATOR"
  POSITION(  01523:01652) VARCHAR MIXED
 , "TBNAME"
  POSITION(  01653:01782) VARCHAR MIXED
 , "CREATEDTS"
  POSITION(  01783:01808) TIMESTAMP EXTERNAL(026)
 , "ALTEREDTS"
  POSITION(  01809:01834) TIMESTAMP EXTERNAL(026)
 , "DATACAPTURE"
  POSITION(  01835:01835) CHAR MIXED(001)
 , "RBA1"
  POSITION(  01836:01841) CHAR(00006)
 , "RBA2"
  POSITION(  01842:01847) CHAR(00006)
 , "PCTROWCOMP"
  POSITION(  01848:01849) SMALLINT
 , "STATSTIME"
  POSITION(  01850:01875) TIMESTAMP EXTERNAL(026)
 , "CHECKS"
  POSITION(  01876:01877) SMALLINT
 , "CARDF"
  POSITION(  01878:01885) FLOAT(53)
 , "CHECKRID5B"
  POSITION(  01886:01890) CHAR(00005)
 , "ENCODING_SCHEME"
  POSITION(  01891:01891) CHAR MIXED(001)
 , "TABLESTATUS"
  POSITION(  01892:01923) VARCHAR MIXED
 , "NPAGESF"
  POSITION(  01924:01931) FLOAT(53)
 , "SPACEF"
  POSITION(  01932:01939) FLOAT(53)
 , "AVGROWLEN"
  POSITION(  01940:01943) INTEGER
 , "RELCREATED"
  POSITION(  01944:01944) CHAR MIXED(001)
 , "NUM_DEP_MQTS"
  POSITION(  01945:01946) SMALLINT
 , "VERSION"
  POSITION(  01947:01948) SMALLINT
 , "PARTKEYCOLNUM"
  POSITION(  01949:01950) SMALLINT
 , "SPLIT_ROWS"
  POSITION(  01951:01951) CHAR MIXED(001)
 , "SECURITY_LABEL"
  POSITION(  01952:01952) CHAR MIXED(001)
 , "OWNER"
  POSITION(  01953:02082) VARCHAR MIXED
 , "APPEND"
  POSITION(  02083:02083) CHAR MIXED(001)
 , "OWNERTYPE"
  POSITION(  02084:02084) CHAR MIXED(001)
 , "CONTROL"
  POSITION(  02085:02085) CHAR MIXED(001)
 , "VERSIONING_SCHEMA"
  POSITION(  02086:02215) VARCHAR MIXED
 , "VERSIONING_TABLE"
  POSITION(  02216:02345) VARCHAR MIXED
 , "HASHKEYCOLUMNS"
  POSITION(  02346:02347) SMALLINT
 , "ARCHIVING_SCHEMA"
  POSITION(  02348:02477) VARCHAR MIXED
 , "ARCHIVING_TABLE"
  POSITION(  02478:02607) VARCHAR MIXED
 , "STATS_FEEDBACK"
  POSITION(  02608:02608) CHAR MIXED(001)
 )
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'
//STEPLIB  DD   DSN=&DB2LIB..DB2EXIT,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00090000
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)
//SYSDISC  DD   DUMMY
//SYSREC   DD   DUMMY
//SYSIN    DD   *
OPTIONS EVENT(ITEMERROR, SKIP)
LISTDEF MYLIST INCLUDE TABLESPACE DB2ADM.MIGVRS11
TEMPLATE DDCOPY
         DSN(DBA5.DB2.&DB..&TS..D&DT..H&TIME.)
         UNIT MAGV
         VOLCNT(255)
         DISP(NEW,CATLG,DELETE)
         STACK YES
COPY LIST MYLIST
     SHRLEVEL REFERENCE
     FULL YES
     COPYDDN DDCOPY
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//SELECT  EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2RUNLB,DISP=SHR                          00090000
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DSN=&&DSNTEP2,DISP=(OLD,PASS,DELETE)
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSPUNCH DD SYSOUT=*
//SYSREC00 DD SYSOUT=*
//SYSIN DD *
SET CURRENT SQLID = 'DB2PROD';
COMMIT;
SELECT * FROM DB2ADM.MIGVRS11 FETCH FIRST 50 ROW ONLY WITH UR;
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//UPDATE  EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2RUNLB,DISP=SHR                          00090000
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DSN=&&DSNTIAUL,DISP=(OLD,PASS,DELETE)
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSPUNCH DD SYSOUT=*
//SYSREC00 DD SYSOUT=*
//SYSIN DD *
SET CURRENT SQLID = 'DB2PROD';
COMMIT;
 UPDATE DB2ADM.MIGVRS11 SET REMARKS = 'TESTE';
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//RECOVER  EXEC PGM=DSNUTILB,PARM='&DSN'
//STEPLIB  DD   DSN=&DB2LIB..DB2EXIT,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00090000
//SYSPRINT DD SYSOUT=*
//UTPRINT  DD SYSOUT=*
//SYSUT1   DD UNIT=(SYSDA,20),SPACE=(CYL,(50,25),RLSE)
//SYSIN    DD *
  RECOVER TABLESPACE DB2ADM.MIGVRS11 TOLASTFULLCOPY
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//REORG    EXEC PGM=DSNUTILB,PARM='&DSN'                                00044003
//STEPLIB  DD   DSN=&DB2LIB..DB2EXIT,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00090000
//SYSPRINT DD   SYSOUT=*                                                00047001
//UTPRINT  DD   SYSOUT=*                                                00048001
//SYSUDUMP DD   SYSOUT=*                                                00049001
//SYSIN    DD   *                                                       00200000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00420001
LISTDEF LISTA
        INCLUDE TABLESPACE DB2ADM.MIGVRS11

TEMPLATE DDCOPY                                                         00450000
         DSN(DBA5.DB2.&DB..&TS..H&HO.&MI..C1)                           00460000
         UNIT SYSDA                                                     00470000
         DISP(NEW,CATLG,DELETE)                                         00490000
TEMPLATE SREC                                                           00450000
         DSN(DBA5.DB2.&DB..&TS..SREC)                                   00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK
TEMPLATE SDISC                                                          00450000
         DSN(DBA5.DB2.&DB..&TS..SDISC)                                  004
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK
TEMPLATE SPUNCH                                                         00450000
         DSN(DBA5.DB2.&DB..&TS..SPUNCH)                                 00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1,1) TRK
TEMPLATE SUT1                                                           00450000
         DSN(DBA5.DB2.&DB..&TS..SUT1)                                   00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK
TEMPLATE SOUT                                                           00450000
         DSN(DBA5.DB2.&DB..&TS..SOUT)                                   00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK

QUIESCE LIST LISTA
REORG TABLESPACE LIST LISTA
      LOG NO SHRLEVEL REFERENCE
      SORTKEYS SORTDATA
      COPYDDN DDCOPY
      STATISTICS TABLE(ALL)
                 INDEX(ALL) UPDATE ALL
      PUNCHDDN SPUNCH
      UNLDDN SREC
      DISCARDDN SDISC
      WORKDDN (SUT1,SOUT)
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//LOADNUL  EXEC PGM=DSNUTILB,PARM='&DSN'
//STEPLIB  DD   DSN=&DB2LIB..DB2EXIT,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00090000
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)
//SYSDISC  DD   SYSOUT=*
//SYSREC   DD   DUMMY
//SYSIN    DD   *
LOAD DATA INDDN SYSREC LOG NO  REPLACE NOCOPYPEND
 INTO TABLE "DB2ADM"."MIGVRS11"
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//*DELTAB  EXEC PGM=IKJEFT01,DYNAMNBR=20
//*STEPLIB  DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                          00080000
//*         DD   DSN=&DB2LIB..DB2RUNLB,DISP=SHR                         00090000
//*SYSTSPRT DD SYSOUT=*
//*SYSTSIN  DD DSN=&&DSNTEP2,DISP=(OLD,PASS,DELETE)
//*SYSPRINT DD SYSOUT=*
//*SYSUDUMP DD SYSOUT=*
//*SYSIN    DD *
//* SET CURRENT SQLID = 'DB2PROD';
//* COMMIT;
//* DROP TABLE DB2ADM.MIGVRS11;
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//DELTBSP EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD   DSN=&DB2LIB..DB2LOAD,DISP=SHR                           00080000
//         DD   DSN=&DB2LIB..DB2RUNLB,DISP=SHR                          00090000
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DSN=&&DSNTEP2,DISP=(OLD,PASS,DELETE)
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD *
SET CURRENT SQLID = 'DB2PROD';
COMMIT;
DROP TABLESPACE DB2ADM.MIGVRS11;

