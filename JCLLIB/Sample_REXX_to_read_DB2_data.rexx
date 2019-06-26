/*REXX*/
/* source:                                                            */ 
/* http://thehelpfuldba.com/index.php/2016/11/23/sample-rexx-to-read-db2-data/ */
/*                                                                    */
/*--------------------------------------------------------------------*/
/*                                                                    */
/* Sample REXX to connect to DB2 and run a SQL prepared SQL statement */
/*                                                                    */
/* Dean Capps - November 2016                                         */
/*                                                                    */
/*--------------------------------------------------------------------*/
 
 
LOCAL_DB2 = DSN1
 
CALL CONNECT_DB2_LOCAL
 
CALL RUN_SQL
 
CALL DISCONNECT_DB2
 
EXIT
 
 
 
 
CONNECT_DB2_LOCAL:
/*--------------------------------------------------------------------*/
/*                                                                    */
/* CONNECT TO DB2                                                     */
/*                                                                    */
/*--------------------------------------------------------------------*/
ADDRESS DSNREXX
RC = 'SUBCOM DSNREXX'
 
IF RC <> 0 THEN DO
   S_RC = RXSUBCOM('ADD','DSNREXX','DSNREXX')
END
 
"CONNECT " LOCAL_DB2
IF SQLCODE <> +0 THEN DO
   MY_ERROR = 'Error connecting to DB2 ' LOCAL_DB2
   CALL DISPLAY_SQLCA
END
 
EXECSQL "SET CURRENT PACKAGESET='DSNREXCS'"
IF SQLCODE <> +0 THEN DO
   MY_ERROR = 'Error setting current PACKAGESET=DSNREXCS'
   CALL DISPLAY_SQLCA
END
 
RETURN
 
 
 
RUN_SQL:
/*--------------------------------------------------------------------*/
/*                                                                    */
/* DISCONNECT DB2                                                     */
/*                                                                    */
/*--------------------------------------------------------------------*/
/*
"  AND    C_OE_CCT = CONCAT(CONCAT(?, ?),                            ",
"         SUBSTR(DIGITS(?), 7, 4))                                   ",
*/
SQLSTMT =,
"SELECT   SUBSTR(NAME,01,10) AS NAME                                 ",
"        ,SUBSTR(CREATOR,01,10) AS CREATOR                           ",
"FROM     SYSIBM.SYSTABLES                                           ",
"WHERE    NAME = CAST(? AS VARCHAR(128))                             ",
"WITH     UR                                                         "
 
IN_SQL = SQLSTMT
CALL STRIP_BLANKS
 
SQLSTMT = OUT_SQL
 
ADDRESS DSNREXX
EXECSQL 'DECLARE C1 CURSOR FOR S1'
IF  SQLCODE < +0 THEN DO
    MY_ERROR = 'Error opening cursor C1'
    CALL DISPLAY_SQLCA
END
 
EXECSQL 'PREPARE S1 INTO :OUTSQLDA FROM :SQLSTMT'
IF  SQLCODE <  +0 THEN DO
    MY_ERROR = 'Error preparing statment S1' SQLSTMT
    CALL DISPLAY_SQLCA
END
 
IN_NAME    = 'SYSTABLES'
 
EXECSQL 'OPEN C1 USING :IN_NAME'
IF  SQLCODE <  +0 THEN DO
    MY_ERROR = 'Error opening cursor C1'
    CALL DISPLAY_SQLCA
END
 
CLEAR
DO UNTIL SQLCODE = +100
   EXECSQL 'FETCH C1 INTO :VAL_01, :VAL_02'
 
   SELECT
     WHEN  SQLCODE = +0   THEN
             DO
               SAY 'SQLCODE 0. Fetched below data'
               SAY 'Table Name : ' VAL_01
               SAY 'Creator    : ' VAL_02
             END
     WHEN  SQLCODE = +100 THEN
             DO
               SAY 'SQLCODE 100. No more data to fetch'
             END
     OTHERWISE
           MY_ERROR = 'Error fetching cursor C1'
           CALL DISPLAY_SQLCA
   END
END
 
EXECSQL 'CLOSE C1'
IF  SQLCODE <  +0 THEN DO
    MY_ERROR = 'Error closing cursor C1'
    CALL DISPLAY_SQLCA
END
 
RETURN
 
 
 
DISCONNECT_DB2:
/*--------------------------------------------------------------------*/
/*                                                                    */
/* DISCONNECT DB2                                                     */
/*                                                                    */
/*--------------------------------------------------------------------*/
ADDRESS DSNREXX
 
"DISCONNECT"
IF SQLCODE <> +0 THEN DO
   CALL DISPLAY_SQLCA
END
 
S_RC = RXSUBCOM('DELETE','DSNREXX','DSNREXX')
 
RETURN
 
 
 
STRIP_BLANKS:
/*--------------------------------------------------------------------*/
/*                                                                    */
/* STRIPS THE BLANKS FROM SQL STATEMENTS                              */
/*                                                                    */
/*--------------------------------------------------------------------*/
LOOP_END = LENGTH(IN_SQL)
OUT_SQL  = SUBSTR(IN_SQL,01,01)
 
DO I = 2 TO LOOP_END
   J = I - 1
   IF  SUBSTR(IN_SQL,I,01) = ' ' & SUBSTR(IN_SQL,J,01) = ' ' THEN
       DO
         NOP
       END
   ELSE
         OUT_SQL = OUT_SQL || SUBSTR(IN_SQL,I,01)
END
 
RETURN
 
 
 
DISPLAY_SQLCA:
/*--------------------------------------------------------------------*/
/*                                                                    */
/* DISPLAY FORMATED MESSAGES FROM THE DSNTIAR DB2 MESSAGE             */
/* FORMATTING ROUTINE                                                 */
/*                                                                    */
/*--------------------------------------------------------------------*/
TRACE OFF
 
MLEN = 72
MLIN = 15
MTOT = MLEN * MLIN
 
SQLERRML = LENGTH(SQLERRMC)
 
SQLCAID = "SQLCA   "
SQLCABC = X2C(D2X(136,8))
MSG_TEXT = X2C(D2X(MTOT,4))||COPIES(' ',MTOT)
MSG_LEN = X2C(D2X(MLEN,8))
 
SQLCA = SQLCAID||SQLCABC||X2C(D2X(SQLCODE,8))||,
        X2C(D2X(SQLERRML,4))||,
        SQLERRMC||COPIES(' ',70-SQLERRML)||,
        SQLERRP||,
        SQLERRD||SQLWARN||SQLSTATE
ADDRESS ATTCHPGM 'DSNTIAR SQLCA MSG_TEXT MSG_LEN'
 
X = 4
DO I = 1 TO MLIN
   TXT = SUBSTR(MSG_TEXT,X,MLEN)
   IF STRIP(TXT) > "" THEN MY_ERROR = MY_ERROR || ' ' || TXT
   X = X + MLEN
END
 
CALL DISPLAY_ERROR_MSG
 
RETURN
 
 
 
DISPLAY_ERROR_MSG:
/*--------------------------------------------------------------------*/
/*                                                                    */
/* DISPLAY ERROR MESSAGE                                              */
/*                                                                    */
/*--------------------------------------------------------------------*/
CLEAR
SAY 'SQL statement was:'
SAY SQLSTMT
 
SAY ' '
SAY 'SQL error:'
SAY MY_ERROR
 
EXIT 0
 
RETURN