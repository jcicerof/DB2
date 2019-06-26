//DB@RUNS1 JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         SET DSN=DB2P                                                         
//*------------------------------------------------------------------           
//* RUNSTATS                                                                    
//*------------------------------------------------------------------           
//RUNSTATS EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
LISTDEF DBLIST INCLUDE TABLESPACE DBEETA.CTLPPGRN                               
               INCLUDE TABLESPACE DBEETA.CTPPGRIT                               
               INCLUDE TABLESPACE DBEETA.RESPPSGR                               
                                                                                
RUNSTATS TABLESPACE  LIST DBLIST                                                
         TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL                   
         SHRLEVEL CHANGE                                                        
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
REBIND PACKAGE(MAPBCOLE.SSR0200L) ISOLATION(CS) EXPLAIN(YES)                    
REBIND PACKAGE(MAPCCOLE.SSR0200L) ISOLATION(CS) EXPLAIN(YES)                    
END                                                                             
