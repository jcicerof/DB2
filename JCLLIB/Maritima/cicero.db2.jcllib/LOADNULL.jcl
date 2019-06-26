//DB@LOAD  JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         SET DSN=DB2P                                                         
//         SET LIB=DB2.DB2P                                                     
//*------------------------------------------------------------------           
//* LOAD NULL                                                                   
//*------------------------------------------------------------------           
//LOADNULL EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=&LIB..SDSNEXIT,DISP=SHR                                     
//         DD   DSN=&LIB..SDSNLOAD,DISP=SHR                                     
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(500,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(500,500),RLSE)                           
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(500,700),RLSE)                           
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(500,700),RLSE)                           
//SYSDISC  DD   DUMMY                                                           
//SYSREC   DD   DUMMY                                                           
//SYSIN    DD   *                                                               
LOAD DATA LOG NO REPLACE NOCOPYPEND INDDN SYSREC                                
     INTO TABLE DB2ADM.HSTVSAM                                                  
