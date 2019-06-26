//DB@DSNTE JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
SELECT * FROM DB2ADM.DB2PCOPY B                                                 
 WHERE B.DSNAME NOT EXISTS (SELECT 1 FROM SYSIBM.SYSCOPY A                      
                             WHERE A.DSNAME = B.DSNAME                          
                               AND A.ICTYPE IN ('I', 'F')                       
                           )                                                    
FOR FETCH ONLY WITH UR;                                                         
