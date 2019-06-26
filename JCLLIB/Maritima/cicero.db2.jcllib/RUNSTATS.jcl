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
LISTDEF DBLIST                                                                  
                    INCLUDE TABLESPACE (DBEETA.FIPEVIGE)                        
                    INCLUDE TABLESPACE (DBEETA.CONGENQ1)                        
                    INCLUDE TABLESPACE (DBEETA.CONGENQ2)                        
                    INCLUDE TABLESPACE (DBEETA.CONGENQ3)                        
                                                                                
RUNSTATS TABLESPACE  LIST DBLIST                                                
         TABLE(ALL) INDEX(ALL)                                                  
         KEYCARD FREQVAL NUMCOLS 5 COUNT 50                                     
         KEYCARD UPDATE ALL HISTORY ALL                                         
         SHRLEVEL CHANGE                                                        
