/* REXX **************************************************************/
/*                                                                   */
/*        DCONNECT - THIS REXX PROGRAM DOES A DB2 CATALOG QUERY TO   */
/*                   TEST THE DB2 TO REXX INTERFACE FOR A DB2        */
/*                   SUBSYSTEM.                                      */
/*                 - IT IS RUN IN THE DCONSSID JOB.                  */
/*                 - IT PERFORMS THE FOLLOWING SELECT STMT:          */
/*                     SELECT DBNAME, TSNAME FROM SYSIBM.SYSTABLES   */
/*                       WHERE DBNAME = ? AND TSNAME = ?;            */
/*                      (DBNAME AND TSNAME ARE SUPPLIED ARGUMENTS)   */
/*                 - THIS PROGRAM REQUIRES DB2 V6 OR ABOVE           */
/*                                                                   */
/*********************************************************************/
/*              INSTRUCTS FOR INPUT PARAMETERS                       */
/*              ==============================                       */
/* 1. //SYSTSIN  DD *                                                */
/*      DCONSSID SSID DBNAME TSNAME                                  */
/*                                                                   */
/*  DCONSSID  = NAME OF REXX CLIST TO BE RUN                         */
/*  SSID      = DB2 SUBSYSTEM ID                                     */
/*  DBNAME    = DATABASE NAME TO BE USED IN WHERE CLAUSE             */
/*  TSNAME    = TABLESPACE NAME TO BE USED IN WHERE CLAUSE           */
/*                                                                   */
/*********************************************************************/
/*=================== MAINTENANCE LOG ===============================*/
/* DATE    UPDATED BY  REASON                                        */
/* 022505  A.FARAGHER  NEW VERSION OF PROGRAM                        */
/* 041805  RGG/JAL     MODIFY FOR MASS DISTRIBUTION                  */
/*********************************************************************/
ARG PARM
PARSE UPPER VAR PARM SSID DBNAME TSNAME
CALL CONNECT_REXX_SQL
/*********************************************************************/
SQL1A = "SELECT DBNAME, TSNAME  FROM  SYSIBM.SYSTABLES "
SQL1B = " WHERE DBNAME = '"DBNAME"'"
SQL1C= " AND TSNAME = '"TSNAME"'"
SQL1 = SQL1A || SQL1B || SQL1C
ADDRESS DSNREXX "EXECSQL DECLARE C1 CURSOR FOR S1"
IF SQLCODE \= 0 THEN
   CALL PRTSQLCA "DECLARE S1 FOR C1"
ADDRESS DSNREXX "EXECSQL PREPARE S1 FROM :SQL1"
IF SQLCODE \= 0 THEN
  CALL PRTSQLCA "PREPARE S1 FROM :SQL1"
ADDRESS DSNREXX "EXECSQL OPEN C1"
IF SQLCODE \= 0 THEN
   CALL PRTSQLCA "OPEN C1"
 DO UNTIL SQLCODE \= 0
 ADDRESS DSNREXX "EXECSQL FETCH C1 INTO :DBNAME, :TSNAME"

    /* WRITE REPORT                                                   */
         TS = STRIP(DBNAME)||'.'||STRIP(TSNAME)
         Y = LEFT(TS,18)
           SAY Y
END
IF SQLCODE=0 | SQLCODE=100 THEN NOP             /* PROCESSED ALL ROWS */
ELSE CALL PRTSQLCA "NO ROWS - C1"

ADDRESS DSNREXX "EXECSQL CLOSE C1"
IF SQLCODE\=0 THEN CALL PRTSQLCA "CLOSE C1"

ADDRESS DSNREXX "DISCONNECT"
RETURN(0)


/**********************************************************************/
/* SET UP REXX/SQL ENVIRONMENT                                        */
/**********************************************************************/
CONNECT_REXX_SQL:
DB2SYS = SSID
ADDRESS TSO "SUBCOM DSNREXX"
IF RC =1 THEN
   S_RC = RXSUBCOM('ADD','DSNREXX','DSNREXX')     /* ADD HOST CMD ENV */
ELSE
  IF RC = 0 THEN
     NOP
  ELSE DO
    SAY 'CAN NOT ACCESS DB2 REXX FUNCTION.  ENDING...RC =' RC
    EXIT 99
  END
ADDRESS DSNREXX "CONNECT" DB2SYS
IF SQLCODE \= 0 THEN CALL PRTSQLCA 'CONNECT'

RETURN(0)

PRTSQLCA:

SAY '** ERROR SQL STATEMENT - ' ARG(1)
SAY 'SQLCODE ='SQLCODE
SAY 'SQLERRMC ='SQLERRMC
SAY 'SQLERRP ='SQLERRP
SAY 'SQLERRD ='SQLERRD.1',',
            || SQLERRD.2',',
            || SQLERRD.3',',
            || SQLERRD.4',',
            || SQLERRD.5',',
            || SQLERRD.6

SAY 'SQLWARN ='SQLWARN.0',',
            || SQLWARN.1',',
            || SQLWARN.2',',
            || SQLWARN.3',',
            || SQLWARN.4',',
            || SQLWARN.5',',
            || SQLWARN.6',',
            || SQLWARN.7',',
            || SQLWARN.8',',
            || SQLWARN.9',',
             || SQLWARN.10
 SAY 'SQLSTATE='SQLSTATE

EXIT 99
/****   END OF DCONNECT.TXT   ****/
