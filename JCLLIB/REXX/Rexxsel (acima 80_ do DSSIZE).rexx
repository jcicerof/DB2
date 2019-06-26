/* REXX */
ARG SSID
SAY 'PARAMETROS RECEBIDOS: SSID=' SSID
KB = 2 * 1024 * 1024 * 0.8  /* 80% DE 2GB */
"EXECIO * DISKR INPUT (FINIS STEM FILE1."
 CALL DB2CON; /* CONECTA AO DB2 */
 DO X = 1 TO FILE1.0
 REC1 = FILE1.X
 IF  SUBSTR(REC1,2,7) = 'CLUSTER' THEN DO
     DSN = SUBSTR(REC1,18,44)
     WDSN = TRANSLATE(DSN, ' ', '.')
     DB = SUBWORD(WDSN,3,1)
     SP = SUBWORD(WDSN,4,1)
 END
 IF SUBSTR(REC1,38,8) = 'HI-U-RBA'
    THEN DO
         USED_KS = TRANSLATE(SUBSTR(REC1,50,12), '0', '-') % 1024
         IF USED_KS > KB THEN DO
            CALL DB2SEL
            IF TS = 'Y' & TSPARTS <> 0
               THEN DO
                    WDSSIZE = DSSIZE * 0.8
                    IF USED_KS > WDSSIZE THEN DO
                       RECOUT = DSN || ' ' || USED_KS
                       PUSH RECOUT
                       "EXECIO 1 DISKW OUTPUT";
                                              END
                   END
            END
    END
 END /* FECHA LOOP PRINCIPAL */

CALL DB2DISC;  /* DISCONECTA DO DB2 */
EXIT 0;   /* ENCERRA O PROGRAMA */

DB2CON:
 /**********************************************************************
 *  CONNECT FROM THE DB2 SYSTEM.
 \*********************************************************************/
 ADDRESS TSO "SUBCOM DSNREXX" ;
 IF RC THEN S_RC = RXSUBCOM("ADD","DSNREXX","DSNREXX") ;
/*  SAY "RC FROM RXSUBCOM ADD=" RC */
 ADDRESS DSNREXX;
 'CONNECT' SSID;
 IF SQLCODE \= 0 THEN DO ;
   SAY "CONNECT TO" SSID "FAILED.";
   CALL SQLCA
   EXIT 8 ;
 END ;
 RETURN;
DB2SEL:
  SEL1 = "SELECT DSSIZE, PARTITIONS FROM SYSIBM.SYSTABLESPACE "
  SEL2 = "WHERE DBNAME='" || DB || "' AND NAME='" || SP || "'"
  STMT = SEL1 || SEL2
  DSSIZE = 0
  TSPARTS = 0
 ADDRESS DSNREXX "EXECSQL PREPARE S1 FROM :STMT" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL DECLARE C1 CURSOR FOR S1" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL OPEN C1" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL FETCH C1 INTO :DSSIZE, :TSPARTS" ;
 IF RC = 0 THEN DO
    TS = 'Y';
    IF DSSIZE = 0 THEN DSSIZE = 2097152
    END
 ELSE TS = 'N';
 ADDRESS DSNREXX "EXECSQL CLOSE C1" ;
 RETURN;
DB2DISC:
 /**********************************************************************
 *  DISCONNECT FROM THE DB2 SYSTEM.
 \*********************************************************************/
 ADDRESS DSNREXX;
 "DISCONNECT" ;
 S_RC = RXSUBCOM("DELETE","DSNREXX","DSNREXX") ;
 RETURN;

 SQLCA_ERROR:
 CALL SQLCA
 EXIT 16
 /*********************************************************************/
 /* ERROR HANDLING ROUTINE FOR BAD SQL CODES - JUST REPORT AND END.   */
 /*********************************************************************/
 SQLCA:
 /*********************************************************************/
 SAY "ERROR. SQLCODE  = >"SQLCODE"<"
 SAY "       SQLSTATE = >"SQLSTATE"<"
 SAY "       SQLERRMC = >"SQLERRMC"<"
 SAY "       SQLERRP  = >"SQLERRP"<"
 SAY "       SQLERRD.1= >"SQLERRD.1"<"
 SAY "       SQLERRD.2= >"SQLERRD.2"<"
 SAY "       SQLERRD.3= >"SQLERRD.3"<"
 SAY "       SQLERRD.4= >"SQLERRD.4"<"
 SAY "       SQLERRD.5= >"SQLERRD.5"<"
 SAY "       SQLERRD.6= >"SQLERRD.6"<"
 SAY "       SQLWARN.0= >"SQLWARN.0"<"
 SAY "       SQLWARN.1= >"SQLWARN.1"<"
 SAY "       SQLWARN.2= >"SQLWARN.2"<"
 SAY "       SQLWARN.3= >"SQLWARN.3"<"
 SAY "       SQLWARN.4= >"SQLWARN.4"<"
 SAY "       SQLWARN.5= >"SQLWARN.5"<"
 SAY "       SQLWARN.6= >"SQLWARN.6"<"
 SAY "       SQLWARN.7= >"SQLWARN.7"<"
 SAY "       SQLWARN.8= >"SQLWARN.8"<"
 SAY "       SQLWARN.9= >"SQLWARN.9"<"
 SAY "       SQLWARN.10= >"SQLWARN.10"<"
 RETURN ;
