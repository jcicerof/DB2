//DB@STST  JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  -STO DB(DBEETA) SPACENAM(PPONBASE)                                            
  -STA DB(DBEETA) SPACENAM(PPONBASE) ACC(RW)                                    
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
