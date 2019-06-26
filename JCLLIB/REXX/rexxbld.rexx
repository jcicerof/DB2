/* REXX */
/* READS INPUT FILE AND WRITES OUTPUT FILE */
#RECO = 0     /* RECORDS WRITE                 */
#JOB = 0      /* JOB NUMBER                    */
VAR1 = 0      /* CONTROLE                      */
VAR2 = 1      /* CONTROLE JOB CARD             */
VAR5 = 0      /* CONTROLE                      */
DB = ''
SP = ''
SF = ''
PARM = ''
SEL1 = "SELECT TYPE, PARTITIONS FROM SYSIBM.SYSTABLESPACE "
SEL2 = "WHERE DBNAME='"
SEL3 = " AND NAME='"
SEL4 = "SELECT CHAR(CREATOR,10), NAME, PARTITION FROM SYSIBM.SYSINDEXES,"
SEL5 = " SYSIBM.SYSINDEXPART WHERE DBNAME='"
SEL6 = " AND INDEXSPACE='"
SEL7 = " AND NAME = IXNAME"
/*---------------------------------------------------*/
/* PARA EXECUTAR ESTA REXX PASSAR O SSID E O VCAT    */
/* O SSID SERA USADO PARA ACESSAR O DB2 E PARA       */
/* MONTAR O JCL, ONDE GERAMOS COMANDOS DE STOP/START */
/*---------------------------------------------------*/
ARG SSID STOGROUP LIBTEP2
SAY 'PARAMETROS RECEBIDOS: SSID    =' SSID
SAY '                      STOGROUP=' STOGROUP
SAY '                      LIBTEP2 =' LIBTEP2
/* TRACE A */
CALL DB2CON;   /* CONECTA AO DB2 */

"EXECIO * DISKR JOBCARD (FINIS STEM JOBC."
JOBCARD1 = JOBC.1
JOBCARD2 = JOBC.2
JOBCARD3 = JOBC.3
"EXECIO * DISKR INPUT (FINIS STEM FILE1."
/*                                      */
 #RECI = FILE1.0  /* QUANTIDADE DE REGISTROS LIDOS */
 DO X = 1 TO FILE1.0  /* LOOP DE LEITURA: DE 1 ATE FIM DE ARQUIVO */
 REC1 = FILE1.X
 VAR1 = VAR1 + 1
 VAR5 = VAR5 + 1
 /* SAY 'DSN=' SUBSTR(REC1,1,44) */
 DSN = TRANSLATE(SUBSTR(REC1,1,44), ' ', '.')
 VCAT = SUBWORD(DSN,1,1)
 DB = SUBWORD(DSN,3,1)
 SP = SUBWORD(DSN,4,1)
 SF = SUBWORD(DSN,5,1) || '.' || SUBWORD(DSN,6,1)
 CLUSTER = VCAT || '.' || 'DSNDBC.' || DB || '.' || SP || '.' || SF
 DATA    = VCAT || '.' || 'DSNDBD.' || DB || '.' || SP || '.' || SF

 /* VAI ACESSAR O DB2 PARA VER SE O TS EH LOB */
 TYPE = ' '
 TSPARTS = 0
 IXPARTS = 0
 IXCREATOR = ''
 IXNAME = ''
 STMTTS = SEL1 || SEL2 || DB || "'" || SEL3 || SP || "'"
 STMTIX = SEL4 || SEL5 || DB || "'" || SEL6 || SP || "'" || SEL7
 TS = 'N'
 IX = 'N'
 CALL DB2SEL /* SELECT TABLESPACE & INDEX INFORMATIONS */

 IF IX = 'N' &  TS = 'N' THEN
    SAY 'DB=' || DB || ' SP=' || SP || ' TS=' || TS || ' IX=' || IX
 IF   TYPE = 'O' THEN PARM = ',PARM=LOB'; ELSE PARM = ''
 IF VAR2 = 1 THEN DO
    #JOB = #JOB + 1
    RECOUT = SUBWORD(JOBCARD1,1,1) || #JOB || ' ' || ,
             SUBWORD(JOBCARD1,2,2)
    CALL WRITE;
    RECOUT = JOBCARD2
    CALL WRITE;
    RECOUT = JOBCARD3
    CALL WRITE;
    VAR2 = 0
 END
 IF VAR1 = 50 THEN DO
    VAR2 = 1; VAR1 = 0
 END
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//* COMANDA O STOP DO TABLESPACE/INDEXSPACE      *'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//STOP' || VAR5 || ' EXEC  PGM=IKJEFT01,COND=(4,LT)'
 CALL WRITE;
 RECOUT = '//SYSTSPRT DD  SYSOUT=*'
 CALL WRITE;
 RECOUT = '//SYSPRINT DD  SYSOUT=*'
 CALL WRITE;
 RECOUT = '//SYSTSIN  DD  *'
 CALL WRITE;
 RECOUT = '  DSN S(' || SSID || ')'
 CALL WRITE;
 RECOUT = '  -STOP DB(' || DB || ') SP(' || SP || ')'
 IF TSPARTS <> '0' | IXPARTS <> '0'
    THEN RECOUT = '  -STOP DB(' || DB || ') SP(' || SP || ')' ,
               || ' PART(' || SUBSTR(SF,8,3) || ')'
 CALL WRITE;
 IF DB <> 'DSNDB01' & DB <> 'DSNDB06' THEN DO
    IF IX = 'Y' THEN CALL ALTERIX
    IF TS = 'Y' THEN CALL ALTERTS
 END
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//* FAZ O RENAME DO DS P/ .O E DEFINE O NEW DS   *'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//DEFD' || VAR5 || ' EXEC  PGM=IDCAMS,COND=(4,LT)'
 CALL WRITE;
 RECOUT = '//SYSPRINT DD  SYSOUT=*'
 CALL WRITE;
 RECOUT = '//SYSIN    DD  *'
 CALL WRITE;
 RECOUT = '  ALTER   ' || CLUSTER || ' -'
 CALL WRITE;
 RECOUT = '  NEWNAME(' || CLUSTER || '.O)'
 CALL WRITE;
 RECOUT = '  ALTER   ' || DATA || ' -'
 CALL WRITE;
 RECOUT = '  NEWNAME(' || DATA || '.O)'
 CALL WRITE;
 RECOUT = '  DEF  CL(NAME(' || CLUSTER || ') -'
 CALL WRITE;
 RECOUT = '       ' || SUBSTR(REC1,51,17) || ' VOLUMES(*) -'
 CALL WRITE;
 RECOUT = '       REUSE SHR(3 3) SPEED OWNER(DB2DBS) - '
 CALL WRITE;
 RECOUT = '       CISZ(' || SUBSTR(REC1,45,5) || ') LINEAR) -'
 CALL WRITE;
 RECOUT = '       DATA(NAME(' || DATA || '))'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//* EXECUTA O DSN1COPY PARA FAZER A COPIA DO DS  *'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//CPYD' || VAR5 || ' EXEC  PGM=DSN1COPY,COND=(4,LT)' || PARM
 CALL WRITE;
 RECOUT = "//SYSUT1   DD   DISP=SHR,AMP='BUFND=20',"
 CALL WRITE;
 RECOUT = '//   DSN=' || CLUSTER || '.O'
 CALL WRITE;
 RECOUT = "//SYSUT2   DD   DISP=SHR,AMP='BUFND=20',"
 CALL WRITE;
 RECOUT = '//   DSN=' || CLUSTER
 CALL WRITE;
 RECOUT = '//SYSPRINT DD   SYSOUT=*'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//* COMANDA O START DO OBJ (TABLESPACE/INDEXSPC) *'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//START' || VAR5 || ' EXEC  PGM=IKJEFT01,COND=(4,LT)'
 CALL WRITE;
 RECOUT = '//SYSTSPRT DD   SYSOUT=*'
 CALL WRITE;
 RECOUT = '//SYSTSIN  DD   *'
 CALL WRITE;
 RECOUT = '  DSN S(' || SSID || ')'
 CALL WRITE;
 IF TS = 'Y' THEN
    IF TSPARTS = '0'
       THEN RECOUT = '  -START DB(' || DB || ') SP(' || SP || ')'
       ELSE RECOUT = '  -START DB(' || DB || ') SP(' || SP || ')' ,
                      || ' PART(' || SUBSTR(SF,8,3) || ')'
 IF IX = 'Y' THEN
    IF IXPARTS = '0'
       THEN RECOUT = '  -START DB(' || DB || ') SP(' || SP || ')'
       ELSE RECOUT = '  -START DB(' || DB || ') SP(' || SP || ')' ,
                      || ' PART(' || SUBSTR(SF,8,3) || ')'
 IF IX <> 'Y' AND TS <> 'Y' THEN
    RECOUT = '  -START DB(' || DB || ') SP(' || SP || ')'
 CALL WRITE;
 RECOUT = '  END'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//* DELETA O ARQUIVO ORIGINAL RENOMEADO P/ .O    *'
 CALL WRITE;
 RECOUT = '//*----------------------------------------------*'
 CALL WRITE;
 RECOUT = '//DELD' || VAR5 || ' EXEC  PGM=IDCAMS,COND=(4,LT)'
 CALL WRITE;
 RECOUT = '//SYSPRINT DD  SYSOUT=*'
 CALL WRITE;
 RECOUT = '//SYSIN    DD  *'
 CALL WRITE;
 RECOUT = ' DELETE ' || CLUSTER || '.O'
 CALL WRITE;
 DB = ''; SP = ''; SF = ''
END

CALL DB2DISC;  /* DISCONECTA DO DB2 */
SAY '# OF INPUT  RECORDS = ' #RECI
SAY '# OF OUTPUT RECORDS = ' #RECO
SAY '# OF GENERATED JOBS = ' #JOB
EXIT 0;   /* ENCERRA O PROGRAMA */

WRITE:    /* GRAVA UMA LINHA DE JCL */
 PUSH RECOUT ;
 "EXECIO 1 DISKW OUTPUT" ; #RECO = #RECO + 1;
 RETURN;
/*------------------------------------------------------------*/
/*    MONTA OS COMANDOS DE ALTER QUANDO FOR UM INDICE         */
/*------------------------------------------------------------*/
ALTERIX:
 PRIQTY = SUBSTR(REC1,55,5) * 48
 SECQTY = SUBSTR(REC1,61,4) * 48
 RECOUT = '  RUN  PROGRAM(DSNTEP2) LIB(' || LIBTEP2 || ')'
 CALL WRITE;
 RECOUT = '  END'
 CALL WRITE;
 RECOUT = '//SYSIN    DD  *'
 CALL WRITE;
 RECOUT = "SET CURRENT SQLID = 'SYSADM';"
 CALL WRITE;
 IXCREATOR = SUBWORD(IXCREATOR,1,1)
 RECOUT = 'ALTER INDEX ' || IXCREATOR || '.' || IXNAME
 CALL WRITE;
 IF IXPARTS <> 0
    THEN DO
         RECOUT = ' ALTER PARTITION ' || SUBSTR(SF,8,3)
         CALL WRITE;
         RECOUT = 'USING STOGROUP ' || STOGROUP || ' PRIQTY ' || ,
                   PRIQTY || ' SECQTY ' || SECQTY || ';'
         CALL WRITE;
         END
 ELSE DO
      IF SUBSTR(SF,8,3) <> '001' THEN DO
         RECOUT = 'USING STOGROUP ' || STOGROUP || ';'
         CALL WRITE;
      END
      ELSE DO
           RECOUT = 'USING STOGROUP ' || STOGROUP || ' PRIQTY ' || ,
                     PRIQTY || ' SECQTY ' || SECQTY || ';'
           CALL WRITE;
           END
      END
RETURN;
/*------------------------------------------------------------*/
/*    MONTA OS COMANDOS DE ALTER QUANDO FOR UM TABLESPACE     */
/*------------------------------------------------------------*/
ALTERTS:
 PRIQTY = SUBSTR(REC1,55,5) * 48
 SECQTY = SUBSTR(REC1,61,4) * 48
 RECOUT = '  RUN  PROGRAM(DSNTEP2) LIB(' || LIBTEP2 || ')'
 CALL WRITE;
 RECOUT = '  END'
 CALL WRITE;
 RECOUT = '//SYSIN    DD  *'
 CALL WRITE;
 RECOUT = "SET CURRENT SQLID = 'SYSADM';"
 CALL WRITE;
 RECOUT = 'ALTER TABLESPACE ' || DB || '.' || SP
 CALL WRITE;
 IF TSPARTS <> 0
    THEN DO
         RECOUT = ' ALTER PARTITION ' || SUBSTR(SF,8,3)
         CALL WRITE;
         RECOUT = 'USING STOGROUP ' || STOGROUP || ' PRIQTY ' || ,
                   PRIQTY || ' SECQTY ' || SECQTY || ';'
         CALL WRITE;
         END
 ELSE DO
      IF SUBSTR(SF,8,3) <> '001' THEN DO
         RECOUT = 'USING STOGROUP ' || STOGROUP || ';'
         CALL WRITE;
      END
      ELSE DO
           RECOUT = 'USING STOGROUP ' || STOGROUP || ' PRIQTY ' || ,
                     PRIQTY || ' SECQTY ' || SECQTY || ';'
           CALL WRITE;
           END
      END
RETURN;
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
 ADDRESS DSNREXX "EXECSQL PREPARE S1 FROM :STMTTS" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL DECLARE C1 CURSOR FOR S1" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL OPEN C1" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL FETCH C1 INTO :TYPE, :TSPARTS" ;
 IF RC = 0 THEN TS = 'Y'
 ADDRESS DSNREXX "EXECSQL CLOSE C1" ;
 ADDRESS DSNREXX "EXECSQL PREPARE S2 FROM :STMTIX" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL DECLARE C2 CURSOR FOR S2" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL OPEN C2" ;
 IF RC <> 0 THEN CALL SQLCA ;
 ADDRESS DSNREXX "EXECSQL FETCH C2 INTO :IXCREATOR, :IXNAME, :IXPARTS" ;
 IF RC = 0 THEN IX = 'Y'
 ADDRESS DSNREXX "EXECSQL CLOSE C2" ;
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
