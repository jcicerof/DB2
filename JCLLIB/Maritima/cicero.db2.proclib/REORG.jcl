//REORG    PROC DSN=NONE                                                        
//*------------------------------------------------------------------           
//* REORG                                                                       
//*------------------------------------------------------------------           
//REORG    EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//*DFSPARM DD *                                                                 
//* OPTION FILSZ=E3000000                                                       
// PEND                                                                         
