//LOAD     PROC DSN=NONE                                                        
//*------------------------------------------------------------------           
//* LOAD                                                                        
//*------------------------------------------------------------------           
//LOAD     EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(1000,500),RLSE)                          
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(1000,500),RLSE)                          
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1000,500),RLSE)                          
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1000,500),RLSE)                          
//SYSDISC  DD   DUMMY                                                           
//SYSREC   DD   DUMMY                                                           
//SYSIN    DD   DUMMY                                                           
// PEND                                                                         
