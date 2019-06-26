//TSLIBDWJ JOB 'RICARDO',MSGCLASS=T,CLASS=D,NOTIFY=ROSDDWJ,                     
//          USER=MVSPUSER,MSGLEVEL=(1,1)                                        
//*----------------------------------------------------------------             
//*     BIND NO DB2 DE PRODUCAO - MODULO ONLINE                                 
//*----------------------------------------------------------------             
//S0210    EXEC PGM=IKJEFT01,DYNAMNBR=20,REGION=4M                              
//DBRMLIB  DD DISP=SHR,DSN=P.CP.DBRMLIB                                         
//SYSTSPRT DD SYSOUT=*,DCB=BLKSIZE=13300                                        
//SYSPRINT DD SYSOUT=*,DCB=BLKSIZE=13300                                        
//SYSUDUMP DD SYSOUT=*,DCB=BLKSIZE=13300                                        
//SYSOUT   DD SYSOUT=*,DCB=BLKSIZE=13300                                        
//REPORT   DD SYSOUT=*,DCB=BLKSIZE=13300                                        
//SYSTSIN   DD  *                                                               
  BIND PACKAGE(ERPPRO.MAPCCOLE) -                                               
  OWNER(MVSPUSER)                -                                              
  QUALIFIER(SQLUSER)             -                                              
  MEMBER(CTSB777L)                  -                                           
  EXPLAIN(NO)                    -                                              
  ISOLATION(CS)                  -                                              
  RELEASE(COMMIT)                -                                              
  ACT(REP)                                                                      
//*                                                                             
