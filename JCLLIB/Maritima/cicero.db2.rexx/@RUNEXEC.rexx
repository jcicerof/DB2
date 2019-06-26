//DB@EXEC  JOB  MSGCLASS=X,CLASS=T,NOTIFY=&SYSUID                       JOB01147
//RUNREXX  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXQG2'                          
//SYSEXEC  DD   DSN=CICERO.DB2.REXX,DISP=SHR                                    
//SYSPRINT DD   SYSOUT=*                                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   DUMMY                                                           
//*INFILE   DD   DSN=CICERO.DB2.RPTMVIEW.ORACLE,DISP=OLD                        
//OUTFILE  DD   SYSOUT=*                                                        
