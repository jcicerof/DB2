//DB@DSN1C JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//RUNPRNT  EXEC PGM=DSN1PRNT,PARM='PRINT,FORMAT,FULLCOPY'                       
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSUT1   DD DSN=DB2PCOPY.FE1.DB2ADM.EXCPARCL.D190407,DISP=OLD                 
