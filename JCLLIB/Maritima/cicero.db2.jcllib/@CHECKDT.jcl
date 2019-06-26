//DB@CSHK  JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//CHECK    EXEC PROC=CHECK,DSN=DB2P                                             
//CHECK.SYSIN DD *                                                              
CHECK DATA TABLESPACE DBEEOR.ORCIPNIV SCOPE ALL                                 
CHECK DATA TABLESPACE DBEEOR.ORCISQCA SCOPE ALL                                 
CHECK DATA TABLESPACE DBEEOR.ORCICOBE SCOPE ALL                                 
CHECK DATA TABLESPACE DBEEOR.ORCICDIF SCOPE ALL                                 
CHECK DATA TABLESPACE DBEEOR.ORITCBCA SCOPE ALL                                 
CHECK DATA TABLESPACE DBEEOR.ORITCVED SCOPE ALL                                 
CHECK DATA TABLESPACE DBEEOR.ORCITBNF SCOPE ALL                                 
