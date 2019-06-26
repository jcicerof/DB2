//UNLOAD   PROC DSN=NONE                                                        
//*------------------------------------------------------------------           
//* UNLOAD                                                                      
//*------------------------------------------------------------------           
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN',COND=EVEN                              
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//SYSOUT   DD   SYSOUT=*                                                        
//SYSPUNCH DD   DUMMY                                                           
//SYSREC   DD   DUMMY                                                           
//SYSIN    DD   DUMMY                                                           
// PEND                                                                         
