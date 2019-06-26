//DB@QUERY JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  -DIS GROUP DETAIL                                                             
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN DD *                                                                    
SELECT COUNT(*) FROM DB2ERP.GN_PESSOAS         ;                                
SELECT COUNT(*) FROM DB2ERP.K9_SEG_MOVFICHCOMP ;                                
SELECT COUNT(*) FROM DB2ERP.K9_SEG_PERCRED     ;                                
SELECT COUNT(*) FROM ERPUSER.GN_PESSOAS         ;                               
SELECT COUNT(*) FROM FECUSER.DADOSAPOLICE       ;                               
