//DB@LOAD JOB MSGCLASS=X,CLASS=T,NOTIFY=&SYSUID                         JOB02470
//SDO001A0 EXEC PGM=IKJEFT01                                                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
rexec -l accdb2 -p bravo 10.135.162.40 ./carrega24.sh                           
