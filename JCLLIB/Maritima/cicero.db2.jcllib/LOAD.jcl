//DB@LOAD  JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         SET DSN=DB2P                                                         
//         SET LIB=DB2.DB2P                                                     
//*------------------------------------------------------------------           
//* LOAD                                                                        
//*------------------------------------------------------------------           
//LOAD     EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=&LIB..SDSNEXIT,DISP=SHR                                     
//         DD   DSN=&LIB..SDSNLOAD,DISP=SHR                                     
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(900,900),RLSE)                           
//SYSUT1   DD   UNIT=VSM                                                        
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(900,900),RLSE)                           
//SORTOUT  DD   UNIT=VSM                                                        
//SYSDISC  DD   DUMMY                                                           
//SYSREC   DD   DUMMY                                                           
//SYSIN    DD   *                                                               
