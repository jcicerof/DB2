//DB@DSNTP JOB 'CICERO,R:5093',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//DSNTEP2  EXEC PROC=DSNTEP2                                                    
//DSNTEP2.SYSTSIN DD *                                                          
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP4) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//DSNTEP2.SYSIN DD *                                                            
SELECT * FROM SYSIBM.SYSTABLES                                                  
