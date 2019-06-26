//DB@REPAI JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//*------------------------------------------------------------------           
//* RUNSTATS                                                                    
//*------------------------------------------------------------------           
//REPAIR   EXEC PROC=REPAIR,DSN=DB2P                                            
//SYSIN    DD   *                                                               
REPAIR SET TABLESPACE DB2ADM.RPTMVIEW NOCOPYPEND                                
//                                                                              
REPAIR SET TABLESPACE DBMT01.INCONAPO NOCCHECKPEND                              
REPAIR SET TABLESPACE DBMT01.INCONAPO NOCOPYPEND                                
REPAIR LEVELID TABLESPACE DBMA01.SNITFDSP                                       
