//DB@RUNST JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//         SET DSN=DB2P                                                         
//RUNSTATS EXEC PROC=RUNSTATS,DSN=&DSN                                          
//RUNSTATS.SYSIN DD *                                                           
RUNSTATS TABLESPACE DBEEGD.COEMIELT                                             
   TABLE (ALL) INDEX (ALL) KEYCARD UPDATE ALL HISTORY ALL                       
RUNSTATS TABLESPACE DBEEGD.LGRGTSGR                                             
   TABLE (ALL) INDEX (ALL) KEYCARD UPDATE ALL HISTORY ALL                       
