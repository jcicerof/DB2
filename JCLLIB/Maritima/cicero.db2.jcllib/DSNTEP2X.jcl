//DB@DSNTE JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  -STOP  DB(DBWPC1) SPACENAM(DETALAPO)                                          
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
  -START DB(DBWPC1) SPACENAM(DETALAPO) ACC(RW)                                  
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
  ALTER TABLESPACE DBWPC1.DETALAPO                                        000100
        USING STOGROUP STGP88D                                            000200
        COMPRESS YES;                                                     000300
