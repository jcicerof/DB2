//DB@DSNTE JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP4) PLAN(DSNTEP4) PARMS('/ALIGN(LHS) MIXED') -               
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
SELECT * FROM SYSIBM.SYSTABLES WITH UR;                                         
