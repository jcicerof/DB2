//DB@RUNS2 JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
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
RUNSTATS TABLESPACE DBSS01.SSPRIDRE                                             
     TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL                       
     SHRLEVEL CHANGE                                                            
