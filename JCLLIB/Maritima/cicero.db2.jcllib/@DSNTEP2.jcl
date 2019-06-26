//DB@DSNTP JOB 'CICERO,R:5093',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//DSNTEP2  EXEC PROC=DSNTEP2                                                    
//DSNTEP2.SYSTSIN DD *                                                          
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//DSNTEP2.SYSIN DD *                                                            
SELECT COUNT(*) FROM SQLUSER.PAGAMENTO                                          
WHERE DTLCT >= '2008-01-01'                                                     
  AND DTLCT <= '2008-05-31'                                                     
  AND SISTEMA IN (3, 6)                                                         
WITH UR;                                                                        
