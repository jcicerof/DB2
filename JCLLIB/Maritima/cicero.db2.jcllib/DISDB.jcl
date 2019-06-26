//DB@DISDB JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//STOP     EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  -DIS  DB(DBEETA) SPACENAM(CONGENQ1) LIMIT(*) USE                              
  -DIS  DB(DBEETA) SPACENAM(CONDICAO) LIMIT(*) USE                              
  -DIS  DB(DBEETA) SPACENAM(CONGENQ2) LIMIT(*) USE                              
  -DIS  DB(DBEETA) SPACENAM(COND15KR) LIMIT(*) USE                              
  -DIS  DB(DBEETA) SPACENAM(CONGENQ3) LIMIT(*) USE                              
  -DIS  DB(DBEETA) SPACENAM(COND1SLH) LIMIT(*) USE                              
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
