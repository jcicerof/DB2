SELECT DISTINCT TBCREATOR, TBNAME                                               
  FROM SYSIBM.SYSCOLUMNS                                                        
 WHERE COLCARD = -1                                                             
FOR READ ONLY WITH UR;                                                          
                                                                                
SELECT DISTINCT CREATOR, NAME, DBNAME, TSNAME,CREATEDBY                         
  FROM SYSIBM.SYSTABLES                                                         
 WHERE CARD = -1                                                                
   AND TYPE = 'T'                                                               
FOR READ ONLY WITH UR;                                                          
                                                                                
