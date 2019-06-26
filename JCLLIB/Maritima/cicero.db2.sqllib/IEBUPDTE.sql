-- REBIND PACKAGE(SSRF.SQL25466) ISOLATION(CS) EXPLAIN(YES)                     
-- ./ ADD NAME=ANEXMAIL,LIST=ALL                                                
-- UNLOAD TABLESPACE DBSS01.ANEXMAIL FROMCOPYDDN SYSCOPY                        
--                                                                              
--  SELECT                                                                      
--  './ ADD NAME='||STRIP(TSNAME)||',LIST=ALL'                                  
--                   ,DBNAME, TSNAME,1                                          
--  FROM SYSIBM.SYSTABLES                                                       
--   WHERE NAME IN ('CADCRPCL'                                                  
--                 ,'SSCOREPE'                                                  
--                 ,'SSDEVOLU'                                                  
--                 ,'SSFATCON'                                                  
--                 ,'SSPARAME'                                                  
--                 ,'SSPROGLO'                                                  
--                 ,'SSREPORT'                                                  
--                 ,'SSSEGPRE'                                                  
--                 ,'SSSEGSRV'                                                  
--                 ,'SSSINCTB'                                                  
--                 ,'SSSNTVID'                                                  
--                 ,'TBCRECON'                                                  
--                 ,'TBMVCONT'                                                  
--                 ,'TBSOLPGT')                                                 
--  AND TYPE ='T' AND CREATOR IN ('ANO2000', 'MARITIMA')                        
--  UNION                                                                       
--  SELECT CHAR(                                                                
--  'COPY TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||                     
--  ' FULL YES SHRLEVEL REFERENCE'                                              
--  ,80)                                                                        
--   ,DBNAME, TSNAME,2                                                          
--  FROM SYSIBM.SYSTABLES                                                       
--   WHERE NAME IN ('CADCRPCL'                                                  
--                 ,'SSCOREPE'                                                  
--                 ,'SSDEVOLU'                                                  
--                 ,'SSFATCON'                                                  
--                 ,'SSPARAME'                                                  
--                 ,'SSPROGLO'                                                  
--                 ,'SSREPORT'                                                  
--                 ,'SSSEGPRE'                                                  
--                 ,'SSSEGSRV'                                                  
--                 ,'SSSINCTB'                                                  
--                 ,'SSSNTVID'                                                  
--                 ,'TBCRECON'                                                  
--                 ,'TBMVCONT'                                                  
--                 ,'TBSOLPGT')                                                 
--  AND TYPE ='T' AND CREATOR IN ('ANO2000', 'MARITIMA')                        
--  ORDER BY 2,3,4                                                              
--  ;                                                                           
SELECT DISTINCT                                                                 
       'REBIND PACKAGE('||STRIP(COLLID)||'.'||STRIP(NAME)||                     
       ') ISOLATION(CS) EXPLAIN(YES)'                                           
  FROM SYSIBM.SYSPACKAGE A,                                                     
       SYSIBM.SYSPACKDEP B                                                      
 WHERE A.LOCATION = B.DLOCATION                                                 
   AND A.COLLID   = B.DCOLLID                                                   
   AND A.NAME     = B.DNAME                                                     
   AND A.CONTOKEN = B.DCONTOKEN                                                 
   AND B.BNAME    IN ('CADCRPCL'                                                
                     ,'SSCOREPE'                                                
                     ,'SSDEVOLU'                                                
                     ,'SSFATCON'                                                
                     ,'SSPARAME'                                                
                     ,'SSPROGLO'                                                
                     ,'SSREPORT'                                                
                     ,'SSSEGPRE'                                                
                     ,'SSSEGSRV'                                                
                     ,'SSSINCTB'                                                
                     ,'SSSNTVID'                                                
                     ,'TBCRECON'                                                
                     ,'TBMVCONT'                                                
                     ,'TBSOLPGT')                                               
;                                                                       00005000
