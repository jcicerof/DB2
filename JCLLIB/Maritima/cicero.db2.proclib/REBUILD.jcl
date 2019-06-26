//*------------------------------------------------------------------           
//* REBUILD                                                                     
//*------------------------------------------------------------------           
//REBUILD  PROC                                                                 
//REBUILD  EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                           
//SYSUT1   DD   UNIT=SYSWRK,SPACE=(CYL,(1500,700),RLSE)                         
//SORTOUT  DD   UNIT=SYSWRK,SPACE=(CYL,(1500,700),RLSE)                         
//SYSDISC  DD   DUMMY                                                           
//SYSREC   DD   DUMMY                                                           
// PEND                                                                         
