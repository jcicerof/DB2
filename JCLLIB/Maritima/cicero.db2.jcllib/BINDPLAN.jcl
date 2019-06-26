//AXG0221B JOB (0XW0000,000,00),ROGERIO,                                        
//            NOTIFY=&SYSUID,REGION=4M,CLASS=S,MSGCLASS=X                       
//BINDPKG EXEC PGM=IKJEFT01                                             00440000
//SYSTSPRT DD  SYSOUT=*                                                 00450000
//SYSPRINT DD  SYSOUT=*                                                 00460000
//SYSTSIN  DD  *                                                        00480000
  DSN SYSTEM(DB2P)                                                      00490000
  BIND PLAN(MAPBPLAN) -                                                 00521990
       PKLIST(MAPBCOLE.*,ERPPRO.MAPBCOLE.*) -                           00523980
       QUALIFIER(SQLUSER)   -                                                   
       VALIDATE(BIND) ACQUIRE(USE) RELEASE(COMMIT) -                            
       ISOLATION(CS) ENCODING(EBCDIC) ACTION(REPLACE)                   00530000
                                                                                
  RUN PROGRAM(DSNTIAD)  PLAN(DSNTIA71) PARM('RC0')  -                           
      LIBRARY('DB2V710.RUNLIB.LOAD.MDB2P')                                      
  END                                                                           
//SYSIN    DD  *                                                                
  GRANT EXECUTE ON PLAN MAPBPLAN TO AGUIAR                                      
                                  , CA7ONL                                      
                                  , CLAUDIO                                     
                                  , CSPPUSER                                    
                                  , JCARLOS                                     
                                  , LUIS                                        
                                  , MARTINS                                     
                                  , MVSPUSER                                    
                                  , PUBLIC                                      
                                  , SCHED ;                                     
