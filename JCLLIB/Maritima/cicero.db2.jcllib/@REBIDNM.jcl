//DB@RBI01 JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//*-------------------------------------------------------------------          
//* REBIND                                                                      
//*-------------------------------------------------------------------          
//REBIND   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSOUT   DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
DSN SYSTEM(DB2P)                                                                
REBIND PACKAGE(MAPBCOLE.AL515D2) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPBCOLE.NM100D1) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPBCOLE.REMK060R) ISOLATION(CS) EXPLAIN(YES)                    
REBIND PACKAGE(MAPBCOLE.REQG018B) ISOLATION(CS) EXPLAIN(YES)                    
REBIND PACKAGE(MAPBCOLE.TA131D1) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPBCOLE.TA191D2) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPBCOLE.TA320D1) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPCCOLE.AL515D2) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPCCOLE.NM100D1) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPCCOLE.REMK060R) ISOLATION(CS) EXPLAIN(YES)                    
REBIND PACKAGE(MAPCCOLE.TA131D1) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPCCOLE.TA131R1) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPCCOLE.TA191D2) ISOLATION(CS) EXPLAIN(YES)                     
REBIND PACKAGE(MAPCCOLE.TA320D1) ISOLATION(CS) EXPLAIN(YES)                     
END                                                                             
