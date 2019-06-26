//DB@QUIES JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
//*-------------------------------------------------------------------          
//* QUIESCE                                                                     
//*------------------------------------------------------------------           
//         SET DSN=DB2P                                                         
//QUIESCE  EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
QUIESCE TABLESPACE DB2ADM.CTRLTSQY                                              
