SELECT A.CREATOR,A.NAME,A.DBNAME,A.TSNAME,B.NAME                                
         FROM SYSIBM.SYSTABLES A,                                               
              SYSIBM.SYSCOLUMNS B                                               
WHERE B.DEFAULT = 'I'                                                           
  AND A.CREATOR = B.TBCREATOR                                                   
  AND A.NAME    = B.TBNAME                                                      
  AND A.TYPE    = 'T'                                                           
  ORDER BY A.DBNAME,A.TSNAME                                                    
