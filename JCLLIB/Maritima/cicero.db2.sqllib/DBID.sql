--FOR TABLE SPACES:                                                             
SELECT DBID, PSID                                                               
  FROM SYSIBM.SYSTABLESPACE                                                     
 WHERE NAME='SSLOGCAD'                                                          
   AND DBNAME='DBSS05';                                                         
                                                                                
SELECT NAME, OBID                                                               
  FROM SYSIBM.SYSTABLES                                                         
 WHERE TSNAME='SSLOGCAD'                                                        
  AND CREATOR='MARITIMA';                                                       
                                                                                
--FOR INDEX SPACES:                                                             
SELECT DBID, ISOBID, OBID                                                       
  FROM SYSIBM.SYSINDEXES                                                        
 WHERE NAME='CICEROIX'                                                          
  AND CREATOR='DB2ADM';                                                         
