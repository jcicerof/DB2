//RUNSTATS PROC DSN=NONE                                                        
//*------------------------------------------------------------------           
//* RUNSTATS                                                                    
//*------------------------------------------------------------------           
//RUNSTATS EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   DUMMY                                                           
// PEND                                                                         
