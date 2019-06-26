//DB@RUN   JOB MSGCLASS=X,CLASS=T,NOTIFY=&SYSUID                        JOB02470
//RUNEXEC  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='LE'                             
//SYSEXEC  DD   DSN=CICERO.DB2.REXX,DISP=SHR                                    
//SYSPRINT DD   SYSOUT=*                                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   DUMMY                                                           
//INFILE   DD   DSN=JR.DSN1LOGP.SYSSUMRY,DISP=OLD                               
