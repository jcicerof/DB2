//CHECK    PROC DSN=NONE                                                        
//*------------------------------------------------------------------           
//* CHECK DATA                                                                  
//*------------------------------------------------------------------           
//CHECK    EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUT1   DD   UNIT=VSM   **SYSDA,SPACE=(CYL,(1500,700),RLSE)                  
//SORTOUT  DD   UNIT=VSM   **SYSDA,SPACE=(CYL,(1500,700),RLSE)                  
//SYSERR   DD   UNIT=VSM   **SYSDA,SPACE=(CYL,(50,100),RLSE)                    
//SYSIN    DD   DUMMY                                                           
// PEND                                                                         
