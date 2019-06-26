//REPAIR   PROC DSN=NONE,UID=NONE                                               
//*------------------------------------------------------------------           
//* REPAIR                                                                      
//*------------------------------------------------------------------           
//REPAIR   EXEC PGM=DSNUTILB,PARM='&DSN,&UID'                                   
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   DUMMY                                                           
// PEND                                                                         
