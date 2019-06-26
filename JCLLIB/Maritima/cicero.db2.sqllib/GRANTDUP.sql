SELECT 'GRANT'||                                                                
       CASE                                                                     
         WHEN INSERTAUTH = 'Y' THEN ',INSERT'                                   
                               ELSE ''                                          
       END ||                                                                   
       CASE                                                                     
         WHEN SELECTAUTH = 'Y' THEN ',SELECT'                                   
                               ELSE ''                                          
       END ||                                                                   
       CASE                                                                     
         WHEN UPDATEAUTH = 'Y' THEN ',UPDATE'                                   
                               ELSE ''                                          
       END ||                                                                   
       CASE                                                                     
         WHEN DELETEAUTH = 'Y' THEN ',DELETE'                                   
                               ELSE ''                                          
       END ||                                                                   
       ' ON '||STRIP(SCREATOR)||'.'||STRIP(STNAME)||                            
       ' TO FAEMISP;'                                                           
  FROM SYSIBM.SYSTABAUTH                                                        
 WHERE GRANTEE = 'ONBASEP';                                                     
FIM                                                                             
SELECT DISTINCT GRANTEE FROM SYSIBM.SYSUSERAUTH                                 
WHERE GRANTEE LIKE 'ONTO%';                                                     
SELECT DISTINCT SCREATOR, STNAME                                                
   ,DELETEAUTH,SELECTAUTH,UPDATEAUTH,INSERTAUTH                                 
  FROM SYSIBM.SYSTABAUTH                                                        
 WHERE GRANTEE = 'ONBASEP'                                                      
 ORDER BY SCREATOR, STNAME;                                                     
