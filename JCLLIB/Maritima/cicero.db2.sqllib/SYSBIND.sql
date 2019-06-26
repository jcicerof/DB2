--REBIND PACKAGE (MATBCOLE.AL504D1) ISOLATION(CS) EXPLAIN(YES)                  
--                                                                              
SELECT DISTINCT                                                                 
       'REBIND PACKAGE('||STRIP(COLLID)||'.'||STRIP(NAME)||                     
       ') ISOLATION(CS) EXPLAIN(YES)'                                           
--'INCLUDE TABLESPACE ('||                                                      
--STRIP(B.BQUALIFIER)||'.'||STRIP(B.BNAME)||')'                                 
  FROM SYSIBM.SYSPACKAGE A,                                                     
       SYSIBM.SYSPACKDEP B                                                      
 WHERE A.LOCATION = B.DLOCATION                                                 
   AND A.COLLID   = B.DCOLLID                                                   
   AND A.NAME     = B.DNAME                                                     
   AND A.CONTOKEN = B.DCONTOKEN                                                 
   AND B.BQUALIFIER LIKE 'DB%'                                                  
   AND B.BTYPE    = 'R'                                                         
-- AND A.VALID    = 'N'                                                         
-- AND NAME IN (   'AP110R1')                                           00020125
   AND B.BNAME    IN ('OBVDAPPS')                                               
FOR READ ONLY WITH UR;                                                  00060000
