SELECT * FROM SYSIBM.SYSCOLDISTSTATS                                            
WHERE TBOWNER = 'TECINFOR' AND TBNAME = 'CONDICAOGERENQ1';                      
SELECT * FROM SYSIBM.SYSCOLSTATS                                                
WHERE TBOWNER = 'TECINFOR' AND TBNAME = 'CONDICAOGERENQ1';                      
SELECT * FROM SYSIBM.SYSCOLDIST                                                 
WHERE TBOWNER = 'TECINFOR' AND TBNAME = 'CONDICAOGERENQ1';                      
FIM;                                                                            
--DELETE FROM CSPPUSER.PLAN_TABLE WHERE PROGNAME ='NM100D1';                    
--DELETE FROM CSPPUSER.DSN_STATEMNT_TABLE WHERE PROGNAME ='NM100D1';            
--COMMIT;                                                                       
SELECT *                                                                        
  FROM CSPPUSER.PLAN_TABLE A,                                                   
       CSPPUSER.DSN_STATEMNT_TABLE B,                                           
       SYSIBM.SYSINDEXES           C                                            
 WHERE B.QUERYNO = A.QUERYNO                                                    
   AND B.APPLNAME = A.APPLNAME                                                  
   AND B.PROGNAME = A.PROGNAME                                                  
   AND B.PROGNAME IN (                                                          
'NM100D1')                                                                      
-- AND A.TNAME    = 'SSPGMSEG'                                                  
   AND C.CREATOR = A.ACCESSCREATOR                                              
   AND C.NAME    = A.ACCESSNAME                                                 
-- AND A.QUERYNO = 4096                                                         
   ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ                         
WITH UR;                                                                        
FIM                                                                             
-- VERIFICAR SE EH BATCH (CSPPUSER) OU ONLINE (CSPPUSER)                        
--                                                                              
SELECT *                                                                        
  FROM CSPPUSER.PLAN_TABLE A,                                                   
       CSPPUSER.DSN_STATEMNT_TABLE B,                                           
       SYSIBM.SYSINDEXES           C                                            
 WHERE B.QUERYNO = A.QUERYNO                                                    
   AND B.APPLNAME = A.APPLNAME                                                  
   AND B.PROGNAME = A.PROGNAME                                                  
   AND B.PROGNAME = 'SQL31289'                                                  
-- AND A.TNAME    = 'SSPGMSEG'                                                  
   AND C.CREATOR = A.ACCESSCREATOR                                              
   AND C.NAME    = A.ACCESSNAME                                                 
-- AND A.QUERYNO = 4096                                                         
   ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ                         
WITH UR;                                                                        
FIM                                                                             
SELECT *                                                                        
  FROM CSPPUSER.PLAN_TABLE A,                                                   
       CSPPUSER.DSN_STATEMNT_TABLE B,                                           
       SYSIBM.SYSINDEXES           C                                            
 WHERE B.QUERYNO = A.QUERYNO                                                    
   AND B.APPLNAME = A.APPLNAME                                                  
   AND B.PROGNAME = A.PROGNAME                                                  
-- AND B.PROGNAME = 'SB407A'                                                    
   AND A.TNAME    = 'SSPGMSEG'                                                  
   AND C.CREATOR = A.ACCESSCREATOR                                              
   AND C.NAME    = A.ACCESSNAME                                                 
   AND A.ACCESSCREATOR = 'MARITIMA'                                             
   AND A.ACCESSNAME = 'SSPGMSEG_IX3'                                            
-- AND A.QUERYNO = 4096                                                         
-- ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ                         
WITH UR;                                                                        
