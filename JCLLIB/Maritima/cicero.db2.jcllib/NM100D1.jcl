//DB@IKJEF JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//ALTERTS  EXEC PROC=DSNTEP2                                                    
//DSNTEP2.SYSTSIN DD *                                                          
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//DSNTEP2.SYSIN DD *                                                            
ALTER TABLESPACE DBEETA.CDGEQCLS BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CDGEQFIL BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CDGEQPRR BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CNDGEANE BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CNDGEVAL BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CNGEQTAC BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CONGENQ1 BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CONGENQ2 BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.CONGENQ3 BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.PARAMGER BUFFERPOOL BP26;                               
ALTER TABLESPACE DBEETA.PARGERSQ BUFFERPOOL BP26;                               
//*                                                                             
//ALTERIX  EXEC PROC=DSNTEP2                                                    
//DSNTEP2.SYSTSIN DD *                                                          
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//DSNTEP2.SYSIN DD *                                                            
ALTER INDEX TECINFOR.CNDGERENQCLS_PK BUFFERPOOL BP27;                           
ALTER INDEX TECINFOR.CNDGERENQFILA_PK BUFFERPOOL BP27;                          
ALTER INDEX TECINFOR.CNDGERENQPRR_PK BUFFERPOOL BP27;                           
ALTER INDEX TECINFOR.CNDGERENQANE_I1 BUFFERPOOL BP27;                           
ALTER INDEX TECINFOR.CNDGERENQANE_PK BUFFERPOOL BP27;                           
ALTER INDEX TECINFOR.CNDGERENQVAL_PK BUFFERPOOL BP27;                           
ALTER INDEX TECINFOR.CNDGERENQTIPACT_PK BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.CONDICAOGERENQ1_I3 BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.CONDICAOGERENQ1_I4 BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.CONDICAOGERENQ1_I5 BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.CONDICAOGERENQ1_PK BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.CONDICAOGERENQ2_PK BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.CONDICAOGERENQ3_I3 BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.CONDICAOGERENQ3_PK BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.PARAMETROGERAL_IPK BUFFERPOOL BP27;                        
ALTER INDEX TECINFOR.PARAMETROGERSEQ_PK BUFFERPOOL BP27;                        
//*                                                                             
//IKJEFT01 EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
-STO DB(DBEETA) SPACE(CDGEQCLS)                                            DBEET
-STA DB(DBEETA) SPACE(CDGEQCLS) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CDGEQFIL)                                            DBEET
-STA DB(DBEETA) SPACE(CDGEQFIL) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CDGEQPRR)                                            DBEET
-STA DB(DBEETA) SPACE(CDGEQPRR) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDGEANE)                                            DBEET
-STA DB(DBEETA) SPACE(CNDGEANE) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDGEVAL)                                            DBEET
-STA DB(DBEETA) SPACE(CNDGEVAL) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNGEQTAC)                                            DBEET
-STA DB(DBEETA) SPACE(CNGEQTAC) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CONGENQ1)                                            DBEET
-STA DB(DBEETA) SPACE(CONGENQ1) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CONGENQ2)                                            DBEET
-STA DB(DBEETA) SPACE(CONGENQ2) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CONGENQ3)                                            DBEET
-STA DB(DBEETA) SPACE(CONGENQ3) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(PARAMGER)                                            DBEET
-STA DB(DBEETA) SPACE(PARAMGER) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(PARGERSQ)                                            DBEET
-STA DB(DBEETA) SPACE(PARGERSQ) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDG1$FI)                                            DBEET
-STA DB(DBEETA) SPACE(CNDG1$FI) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDG173X)                                            DBEET
-STA DB(DBEETA) SPACE(CNDG173X) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDG1C#2)                                            DBEET
-STA DB(DBEETA) SPACE(CNDG1C#2) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDG1CVL)                                            DBEET
-STA DB(DBEETA) SPACE(CNDG1CVL) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDG1NHX)                                            DBEET
-STA DB(DBEETA) SPACE(CNDG1NHX) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDG1Y0Y)                                            DBEET
-STA DB(DBEETA) SPACE(CNDG1Y0Y) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CNDGEREN)                                            DBEET
-STA DB(DBEETA) SPACE(CNDGEREN) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(COND11SJ)                                            DBEET
-STA DB(DBEETA) SPACE(COND11SJ) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(COND1DR3)                                            DBEET
-STA DB(DBEETA) SPACE(COND1DR3) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(COND1N3I)                                            DBEET
-STA DB(DBEETA) SPACE(COND1N3I) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(COND1Q#H)                                            DBEET
-STA DB(DBEETA) SPACE(COND1Q#H) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(COND1R5U)                                            DBEET
-STA DB(DBEETA) SPACE(COND1R5U) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(COND1WC4)                                            DBEET
-STA DB(DBEETA) SPACE(COND1WC4) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(CONDICAO)                                            DBEET
-STA DB(DBEETA) SPACE(CONDICAO) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(PARA17LI)                                            DBEET
-STA DB(DBEETA) SPACE(PARA17LI) ACC(RW)                                    DBEET
-STO DB(DBEETA) SPACE(PARAMETR)                                            DBEET
-STA DB(DBEETA) SPACE(PARAMETR) ACC(RW)                                    DBEET
 END                                                                            
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   SYSOUT=*                                                        
//SYSIN    DD   DUMMY                                                           
