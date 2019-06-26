//DB@DSNTP JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
//*------------------------------------------------------------------           
//*                                                                             
//*------------------------------------------------------------------           
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//DSNTEP2  EXEC PROC=DSNTEP2                                                    
//DSNTEP2.SYSTSIN DD *                                                          
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//DSNTEP2.SYSIN DD *                                                            
CREATE INDEX TECINFOR.CONDICAOGERENQ1_I5                                        
ON TECINFOR.CONDICAOGERENQ1                                                     
           (TPPRM                                                               
           ,CDPRM                                                               
           ,TPPRMCND                                                            
           ,CDREGTRF                                                            
           ,CDREGPNE                                                            
           ,CDCPNVEI                                                            
           ,CDCEPTRFINI                                                         
           ,CDCEPTRFFNL                                                         
           ,CDCEPPNEINI                                                         
           ,CDCEPPNEFNL)                                                        
    USING STOGROUP STGP30I                                                      
        PRIQTY 35280                                                            
        SECQTY 3504                                                             
    PCTFREE 5                                                                   
    BUFFERPOOL BP27                                                             
    CLOSE NO                                                                    
    COPY NO                                                                     
    DEFER YES                                                                   
    PIECESIZE 2097152 K                                                         
;                                                                               
COMMIT;                                                                         
--DROP INDEX TECINFOR.CONDICAOGERENQ1_I6;                                       
--COMMIT;                                                                       
